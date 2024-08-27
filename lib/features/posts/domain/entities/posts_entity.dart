

import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable
{

  final int? postId;
  final String title,body;
  const PostsEntity({this.postId,required this.title,required this.body,});


  @override
  // TODO: implement props
  List<Object?> get props => [postId,title,body,];



}