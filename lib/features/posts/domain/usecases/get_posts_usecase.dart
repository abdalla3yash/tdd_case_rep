import 'package:dartz/dartz.dart';
import 'package:poster/core/error/failures.dart';
import 'package:poster/features/posts/domain/entities/post.dart';
import 'package:poster/features/posts/domain/repositories/posts_repository.dart';

class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
