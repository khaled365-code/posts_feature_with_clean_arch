


import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/datasource/posts_remote_data_source.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/repos/posts_repo_implementation.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/repos/posts_domain_repo.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/get_posts_use_case.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/usecases/update_post_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../features/posts/data/datasource/posts_local_data_source.dart';
import '../../features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import '../../features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

setupServiceLocator() async
{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // network info
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker(),);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl.get<InternetConnectionChecker>()),);
  sl.registerLazySingleton<http.Client>(() => http.Client(),);

  //shared preferences
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // data sources
  sl.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImplWithHttp(client: sl.get<http.Client>()),);
  sl.registerLazySingleton<PostsLocalDataSource>(() => PostsLocalDataSourceImpl(sharedPreferences: sl.get<SharedPreferences>()),);

  // repository
  sl.registerLazySingleton<PostsRepo>(() => PostsRepoImplementation(
      networkInfo: sl.get<NetworkInfo>(),
      postsLocalDataSource: sl.get<PostsLocalDataSource>(),
      postsRemoteDataSource: sl.get<PostsRemoteDataSource>()),);


  // use cases
  sl.registerLazySingleton<AddPostUseCase>(() => AddPostUseCase(postsDomainRepo: sl.get<PostsRepo>()),);
  sl.registerLazySingleton<DeletePostUseCase>(() => DeletePostUseCase(postsDomainRepo: sl.get<PostsRepo>()),);
  sl.registerLazySingleton<UpdatePostUseCase>(() => UpdatePostUseCase(postsDomainRepo: sl.get<PostsRepo>()),);
  sl.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(postsDomainRepo: sl.get<PostsRepo>()),);

  //blocs
  sl.registerFactory(() => PostsBloc(getPostsUseCase: sl.get<GetPostsUseCase>()),);
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPostUseCase: sl.get<AddPostUseCase>(),
      updatePostUseCase: sl.get<UpdatePostUseCase>(),
      deletePostUseCase:sl.get<DeletePostUseCase>()),);






}
