

import 'package:dartz/dartz.dart';

import 'package:posts_app_with_clean_arch/core/errors/failure.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/datasource/posts_local_data_source.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/datasource/posts_remote_data_source.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/models/posts_model.dart';

import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repos/posts_domain_repo.dart';

class PostsRepoImplementation implements PostsRepo
{
  final PostsLocalDataSource postsLocalDataSource;
  final PostsRemoteDataSource postsRemoteDataSource;
  final NetworkInfo networkInfo;

  PostsRepoImplementation(
      {required this.networkInfo,
        required this.postsLocalDataSource,
        required this.postsRemoteDataSource});


  @override
  Future<Either<Failure, List<PostsEntity>>> getAllPosts() async
  {
    if (await networkInfo.deviceIsConnected) {
      try {
        final data = await postsRemoteDataSource.getPosts();
        await postsLocalDataSource.savePostsToCache(data);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try
      {
        final data = await postsLocalDataSource.getCachedPosts();
        return Right(data);
      } on EmptyCacheException
      {
        return Left(EmptyCacheFailure());
      }
    }
  }


  @override
  Future<Either<Failure,Unit>> updatePost({required PostsEntity postEntity}) async {
    if (await networkInfo.deviceIsConnected) {
      try
      {
        PostsModel postModel =
        PostsModel(
            userId: postEntity.userId,
            title: postEntity.title,
            body: postEntity.body,
            postId: postEntity.postId);

        await postsRemoteDataSource.updatePost(postsModel: postModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }


  @override
  Future<Either<Failure, Unit>> addPost({required PostsEntity postEntity}) async {
    if (await networkInfo.deviceIsConnected) {
      try {
        PostsModel postModel =
        PostsModel(
            userId: postEntity.userId,
            title: postEntity.title,
            body: postEntity.body,
            postId: postEntity.postId);

        await postsRemoteDataSource.addPost(postsModel: postModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

  }

  @override
  Future<Either<Failure,Unit>> deletePost({required int postId}) async
  {
    if (await networkInfo.deviceIsConnected) {
      try {
        await postsRemoteDataSource.deletePost(postId: postId);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
