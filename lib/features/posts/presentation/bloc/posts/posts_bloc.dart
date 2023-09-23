// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poster/core/error/failures.dart';
import 'package:poster/core/strings/failures.dart';
import 'package:poster/features/posts/domain/entities/post.dart';
import 'package:poster/features/posts/domain/usecases/get_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase;
  PostsBloc({required this.getAllPostsUsecase}) : super(PostsInitial()) {
    on<PostsEvent>(
      (event, emit) async {
        if (event is GetAllPostsEvent || event is RefreshPostEvent) {
          emit(PostsLoading());
          final responsePosts = await getAllPostsUsecase();
          responsePosts.fold(
            (failure) {
              emit(PostsError(message: _mapFailureToMessage(failure)));
            },
            (posts) {
              emit(PostsLoaded(posts: posts));
            },
          );
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
