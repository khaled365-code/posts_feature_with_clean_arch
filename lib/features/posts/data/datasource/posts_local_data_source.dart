

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/posts_model.dart';

abstract class PostsLocalDataSource
{
  Future<List<PostsModel>> getCachedPosts();
  Future<Unit> savePostsToCache(List<PostsModel> postsList);


}

class PostsLocalDataSourceImpl implements PostsLocalDataSource{

  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<List<PostsModel>> getCachedPosts() {

    final jsonString=sharedPreferences.getString('cached_posts');
    if(jsonString != null)
      {
       var  decodedPosts=json.decode(jsonString);
       List<PostsModel>postsList=
       decodedPosts.map<PostsModel>((json) => PostsModel.fromJson(json)).toList();
       return Future.value(postsList);

      }
    else
        {
          throw EmptyCacheException();
        }

  }

  @override
  Future<Unit> savePostsToCache(List<PostsModel> postsList) async {

    List  postsModelToJson=
   postsList.map<Map<String,dynamic>>((postsModel) => postsModel.toJson(postsModel) ,).toList();
    await sharedPreferences.setString('cached_posts', json.encode(postsModelToJson));
    return Future.value(unit);
  }
}