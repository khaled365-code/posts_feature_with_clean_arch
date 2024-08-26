
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/posts_entity.dart';
import '../repos/posts_domain_repo.dart';

class UpdatePostUseCase {

  final PostsRepo postsDomainRepo;

  UpdatePostUseCase({required this.postsDomainRepo});


  Future<Either<Failure,Unit>> call({required PostsEntity postEntity}) async
  {

    return await postsDomainRepo.updatePost(postEntity: postEntity);
  }

}