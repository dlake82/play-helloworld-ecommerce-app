import 'package:secondhand_market/app/features/posts/data/data_sources/remote/api/posts_api.dart';
import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';

class PostsRemoteDataSource {
  const PostsRemoteDataSource({required PostsApi postsApi})
      : _postApi = postsApi;

  final PostsApi _postApi;
  Future<PostsResponse> getPosts() => _postApi.getPosts();
  Future<AuthorsResponse> getAuthors() => _postApi.getAuthors();
}
