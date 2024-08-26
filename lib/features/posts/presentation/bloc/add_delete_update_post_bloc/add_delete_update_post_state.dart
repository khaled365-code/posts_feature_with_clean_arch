part of 'add_delete_update_post_bloc.dart';

@immutable
sealed class AddDeleteUpdatePostState extends Equatable {}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

final class AddDeleteUpdatePostLoadingState extends AddDeleteUpdatePostState
{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AddDeleteUpdatePostSuccessState extends AddDeleteUpdatePostState
{

  final String message;
  AddDeleteUpdatePostSuccessState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class AddDeleteUpdatePostFailureState extends AddDeleteUpdatePostState
{

  final String message;

  AddDeleteUpdatePostFailureState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}



