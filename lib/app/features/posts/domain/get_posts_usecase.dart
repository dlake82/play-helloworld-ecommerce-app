import 'package:secondhand_market/app/features/posts/data/repository/posts_repository.dart';
import 'package:secondhand_market/core/data/result.dart';
import 'package:secondhand_market/core/utils/typedefs.dart';

class GetPostsWithAuthorsUseCase {
  const GetPostsWithAuthorsUseCase({
    required PostsRepository blogPostsRepository,
  }) : _postsRepository = blogPostsRepository;

  final PostsRepository _postsRepository;

  Future<Result<PostsWithAuthors>> call() async {
    final authorsResult = await _postsRepository.getAuthors();
    final postsResult = await _postsRepository.getPosts();

    if (postsResult.isFailure) {
      return Result.failure(errorMessage: postsResult.errorMessage);
    }

    if (authorsResult.isFailure) {
      return Result.failure(errorMessage: authorsResult.errorMessage);
    }

    final authors = authorsResult.data?.users;
    final posts = postsResult.data?.posts;

    final postsWithAuthors = (posts: posts, authors: authors);
    return Result.success(postsWithAuthors);
  }
}
