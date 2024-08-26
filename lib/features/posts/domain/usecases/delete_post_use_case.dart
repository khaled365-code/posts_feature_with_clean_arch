

import 'package:dartz/dartz.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/repos/posts_domain_repo.dart';

import '../../../../core/errors/failure.dart';

class DeletePostUseCase
{

  final PostsRepo postsDomainRepo;

  DeletePostUseCase({required this.postsDomainRepo});

  Future<Either<Failure,Unit>> call({required int postId}) async
  {
    return await postsDomainRepo.deletePost(postId: postId);
  }

}