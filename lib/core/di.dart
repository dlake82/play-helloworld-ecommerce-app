import 'package:secondhand_market/app/features/posts/data/data_sources/local/dao/hive_posts_dao.dart';
import 'package:secondhand_market/app/features/posts/data/data_sources/local/dao/posts_dao.dart';
import 'package:secondhand_market/app/features/posts/data/data_sources/local/posts_local_data_source.dart';
import 'package:secondhand_market/app/features/posts/data/data_sources/remote/api/http_posts_api.dart';
import 'package:secondhand_market/app/features/posts/data/data_sources/remote/api/posts_api.dart';
import 'package:secondhand_market/app/features/posts/data/data_sources/remote/posts_remote_data_source.dart';
import 'package:secondhand_market/app/features/posts/data/repository/posts_repository.dart';
import 'package:secondhand_market/app/features/posts/domain/get_posts_usecase.dart';
import 'package:secondhand_market/app/features/search/data/repository/search_repository.dart';
import 'package:secondhand_market/app/features/search/domain/search_usecase.dart';
import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';
import 'package:secondhand_market/core/router/navigation_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

Future<void> test() async {
  int a = 1;

  a..toString();
}

Future<void> setup() async {
  di
    ..registerLazySingleton<PostsApi>(() => HttpPostsApi(client: Client()))
    ..registerLazySingleton<PostsDao>(
      () => HivePostsDao(authorsBox: di(), postsBox: di()),
    )
    ..registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSource(postsApi: di()),
    )
    ..registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSource(postsDao: di()),
    )
    ..registerLazySingleton<PostsRepository>(
      () => PostsRepository(
        postsRemoteDataSource: di(),
        postsLocalDataSource: di(),
      ),
    )
    ..registerLazySingleton<SearchPostsRepository>(
      () => SearchPostsRepository(
        postsRepository: di(),
      ),
    )
    ..registerLazySingleton<GetPostsWithAuthorsUseCase>(
      () => GetPostsWithAuthorsUseCase(
        blogPostsRepository: di(),
      ),
    )
    ..registerLazySingleton<SearchPostsWithAuthorsUseCase>(
      () => SearchPostsWithAuthorsUseCase(
        postsRepository: di(),
        searchPostsRepository: di(),
      ),
    );

  // --- open and register posts box
  final postsBox = await Hive.openBox<PostsResponse>('postsBox');
  di.registerLazySingleton(() => postsBox);

  // --- open and register users box
  final usersBox = await Hive.openBox<AuthorsResponse>('usersBox');
  di
    ..registerLazySingleton(() => usersBox)

    // core
    ..registerLazySingleton(NavigationService.new);
}
