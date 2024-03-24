import 'package:secondhand_market/app/features/posts/data/data_sources/local/dao/posts_dao.dart';
import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';

class PostsLocalDataSource {
  PostsLocalDataSource({required PostsDao postsDao}) : _postsDao = postsDao;

  final PostsDao _postsDao;

  void updateAuthors({required AuthorsResponse authors}) =>
      _postsDao.cacheAuthors(authors: authors);

  bool get isAuthorsAvailable => _postsDao.isAuthorsCacheAvailable;
  AuthorsResponse? getAuthors() => _postsDao.getCachedAuthors();

  void updatePosts({required PostsResponse posts}) =>
      _postsDao.cachePosts(posts: posts);
  bool get isPostsAvailable => _postsDao.isPostsCacheAvailable;
  PostsResponse? getPosts() => _postsDao.getCachedPosts();
}
