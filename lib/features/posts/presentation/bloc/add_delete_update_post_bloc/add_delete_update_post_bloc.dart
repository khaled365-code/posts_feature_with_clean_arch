import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/delete_post_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/update_post_use_case.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;
  AddDeleteUpdatePostBloc({required this.addPostUseCase,required this.updatePostUseCase,required this.deletePostUseCase}) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent)
      {
        emit(AddDeleteUpdatePostLoadingState());
        final response = await addPostUseCase(postEntity: event.post);
        emit(_getPostState(response, 'post added successfully'));

      } else if (event is UpdatePostEvent)
      {
        emit(AddDeleteUpdatePostLoadingState());
        final response = await updatePostUseCase(postEntity: event.post);
        emit(_getPostState(response, 'post updated successfully'));

      } else if (event is DeletePostEvent)
      {
        emit(AddDeleteUpdatePostLoadingState());
        final response = await deletePostUseCase(postId: event.postId);
        emit(_getPostState(response, 'post deleted successfully'));
      }
    });
  }

  AddDeleteUpdatePostState _getPostState(Either<Failure,Unit> either,String message)
   {
     return either.fold((failure)
     {
       return AddDeleteUpdatePostFailureState(message: convertFailureToMessage(failure));
     }, (_)
     {
       return (AddDeleteUpdatePostSuccessState(message: message));
     });

   }

  String convertFailureToMessage(Failure failure)
  {
    switch(failure.runtimeType)
    {
      case ServerFailure:
        return 'server failure happened';
      case OfflineFailure:
        return 'please check your internet connection';
      default:
        return 'Unexpected error happened';
    }

  }
}
