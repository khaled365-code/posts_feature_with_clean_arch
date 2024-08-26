part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}


class GetPostsEvent extends PostsEvent {}


class RefreshPostsEvent extends PostsEvent{}
