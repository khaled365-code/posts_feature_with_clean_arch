part of 'add_delete_update_post_bloc.dart';

@immutable
sealed class AddDeleteUpdatePostEvent extends Equatable{}


class AddPostEvent extends AddDeleteUpdatePostEvent
{
 final PostsEntity post;

  AddPostEvent({required this.post});
  @override
  // TODO: implement props
  List<Object?> get props => [post];

}

class UpdatePostEvent extends AddDeleteUpdatePostEvent
{
  final PostsEntity post;

  UpdatePostEvent({required this.post});
  @override
  // TODO: implement props
  List<Object?> get props => [post];

}

class DeletePostEvent extends AddDeleteUpdatePostEvent
{
  final int postId;
  DeletePostEvent({required this.postId});
  @override
  // TODO: implement props
  List<Object?> get props => [postId];

}
