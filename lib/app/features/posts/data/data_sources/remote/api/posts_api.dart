import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';

abstract class PostsApi {
  Future<AuthorsResponse> getAuthors();
  Future<PostsResponse> getPosts();
}
