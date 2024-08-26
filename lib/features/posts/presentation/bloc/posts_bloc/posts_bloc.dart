import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/get_posts_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;
  PostsBloc({required this.getPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {

      if(event is GetPostsEvent || event is RefreshPostsEvent)
        {
          emit(PostsLoadingState());
          final response=await getPostsUseCase();
        response.fold(
          (failure) {
            emit(PostsFailureState(message: convertFailureToMessage(failure)));
          },
          (posts) {
            emit(PostsSuccessState(postsList: posts));
          },
        );
      }

    });

  }

  String convertFailureToMessage(Failure failure)
  {
    switch(failure.runtimeType)
    {
      case ServerFailure:
        return 'server failure happened';
      case EmptyCacheFailure:
        return 'empty cache failure happened';
      case OfflineFailure:
        return 'please check your internet connection';
      default:
        return 'Unexpected error happened';
    }

  }
}
