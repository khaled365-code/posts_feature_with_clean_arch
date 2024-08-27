



import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';

class PostsModel extends PostsEntity
{
  final int? postId;
  final String title;
  final String body;
 const  PostsModel({ required this.title,required this.body,this.postId,}) : super(postId: postId,title: title,body: body,);



 factory PostsModel.fromJson(Map<String,dynamic> json)
  {
    return PostsModel(
        title: json['title'],
        body: json['body'],
        postId: json['id']);
  }

  Map<String,dynamic> toJson(PostsModel postsModel)
  {
    return {
      "id": postsModel.postId,
      "title": postsModel.title,
      "body": postsModel.body,
    };
  }


}