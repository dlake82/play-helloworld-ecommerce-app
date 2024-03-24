import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';

abstract class PostsDao {
  void cacheAuthors({required AuthorsResponse authors});
  bool get isAuthorsCacheAvailable;
  AuthorsResponse? getCachedAuthors();

  void cachePosts({required PostsResponse posts});
  bool get isPostsCacheAvailable;
  PostsResponse? getCachedPosts();
}
