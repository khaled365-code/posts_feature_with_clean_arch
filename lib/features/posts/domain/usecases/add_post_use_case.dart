

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/posts_entity.dart';
import '../repos/posts_domain_repo.dart';

class AddPostUseCase
{
  final PostsRepo postsDomainRepo;

  AddPostUseCase({required this.postsDomainRepo});


  Future<Either<Failure,Unit>> call({required PostsEntity postEntity}) async
  {
    return await postsDomainRepo.addPost(postEntity: postEntity);

  }

}