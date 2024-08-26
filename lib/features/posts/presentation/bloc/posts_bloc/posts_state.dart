part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}
final class PostsLoadingState extends PostsState {}
final class PostsSuccessState extends PostsState {
  final List<PostsEntity> postsList;

  PostsSuccessState({required this.postsList});

}
final class PostsFailureState extends PostsState {
  final String message;
  PostsFailureState({required this.message});
}
