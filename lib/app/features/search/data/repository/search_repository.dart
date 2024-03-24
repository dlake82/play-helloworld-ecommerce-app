import 'package:secondhand_market/app/features/posts/data/repository/posts_repository.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';
import 'package:secondhand_market/core/data/result.dart';

class SearchPostsRepository {
  SearchPostsRepository({required PostsRepository postsRepository})
      : _postsRepository = postsRepository;

  final PostsRepository _postsRepository;

  Future<Result<PostsResponse>> searchPostByTitle({
    required String searchTerm,
  }) {
    return _postsRepository.getPosts().then((resource) {
      if (resource.isSuccess) {
        final foundPosts = resource.data?.posts
            .where((post) => post.title.toLowerCase().contains(searchTerm))
            .toList();
        return Result.success(PostsResponse(posts: foundPosts!));
      }
      return Result.failure(errorMessage: resource.errorMessage);
    });
  }
}
