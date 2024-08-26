

import 'package:dartz/dartz.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class PostsRepo
{

  Future<Either<Failure,List<PostsEntity>>>getAllPosts();
  Future<Either<Failure,Unit>>addPost({required PostsEntity postEntity});
  Future<Either<Failure,Unit>>deletePost({required int postId});
  Future<Either<Failure,Unit>>updatePost({required PostsEntity postEntity});

}