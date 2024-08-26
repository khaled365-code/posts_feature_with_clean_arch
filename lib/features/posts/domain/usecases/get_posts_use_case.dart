


import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/posts_entity.dart';
import '../repos/posts_domain_repo.dart';


class GetPostsUseCase {

  final PostsRepo postsDomainRepo;

  GetPostsUseCase({required this.postsDomainRepo});


  Future<Either<Failure,List<PostsEntity>>> call() async
  {

    return await postsDomainRepo.getAllPosts();
  }


}