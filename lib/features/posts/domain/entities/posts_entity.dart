

import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable
{

  final int postId,userId;
  final String title,body;
  const PostsEntity({required this.postId,required this.title,required this.body,required this.userId,});


  @override
  // TODO: implement props
  List<Object?> get props => [postId,title,body,userId];



}