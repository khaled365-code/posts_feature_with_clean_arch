



import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';

class PostsModel extends PostsEntity
{
  final int userId,postId;
  final String title;
  final String body;
 const  PostsModel({required this.userId,required this.title,required this.body,required this.postId,}) : super(postId: postId,title: title,body: body,userId: userId);



 factory PostsModel.fromJson(Map<String,dynamic> json)
  {
    return PostsModel(
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
        postId: json['id']);
  }

  Map<String,dynamic> toJson(PostsModel postsModel)
  {
    return {
      "userId": postsModel.userId,
      "id": postsModel.postId,
      "title": postsModel.title,
      "body": postsModel.body,
    };
  }


}