

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/models/posts_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';

abstract class PostsRemoteDataSource
{

  Future<List<PostsModel>>getPosts();
  Future<Unit>addPost({required PostsModel postsModel});
  Future<Unit>deletePost({required int postId});
  Future<Unit>updatePost({required PostsModel postsModel});

}

const String baseUrl='https://jsonplaceholder.typicode.com/';

class PostsRemoteDataSourceImplWithHttp implements PostsRemoteDataSource{

  final http.Client client;
  PostsRemoteDataSourceImplWithHttp({required this.client});
  @override
  Future<Unit> addPost({required PostsModel postsModel}) async
  {

    Map<String,dynamic> body=
    {
      'title':postsModel.title,
      'body':postsModel.body,
    };
    Map<String,String> headers={
      'Content-Type':'application/json',
    };

    final response= await client.post(Uri.parse('$baseUrl/posts'),body: json.encode(body),
        headers: headers);

    if(response.statusCode==201)
      {
        return Future.value(unit);
      }else
        {
          throw ServerException();
        }


  }

  @override
  Future<Unit> deletePost({required int postId}) async
  {
    Map<String,String> headers=
    {
      'Content-Type':'application/json',
    };
    final response= await client.delete(Uri.parse('$baseUrl/posts/$postId'),headers: headers);
    if(response.statusCode==200)
      {
        return Future.value(unit);
      }else
        {
          throw ServerException();
        }
  }

  @override
  Future<List<PostsModel>> getPosts() async {

    final response=await client.get(Uri.parse('$baseUrl/posts'));
    var data=json.decode(response.body);
    if(response.statusCode==200)
      {
        List<PostsModel>postsList=data.map<PostsModel>((json) => PostsModel.fromJson(json)).toList();
        return Future.value(postsList);
      }
    else
      {
        throw ServerException();
      }
  }

  @override
  Future<Unit> updatePost({required PostsModel postsModel}) async {
    Map<String,dynamic> body=
    {
      'title':postsModel.title,
      'body':postsModel.body,
    };
    Map<String,String> headers=
    {
      'Content-Type':'application/json',
    };

    final response= await client.patch(Uri.parse('$baseUrl/posts'),body: json.encode(body),
        headers: headers);

    if(response.statusCode==200)
    {
      return Future.value(unit);
    }else
    {
      throw ServerException();
    }
  }


}