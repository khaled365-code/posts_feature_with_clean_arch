


import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/datasource/posts_remote_data_source.dart';
import 'package:posts_app_with_clean_arch/features/posts/data/repos/posts_repo_implementation.dart';
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
  sl.registerLazySingleton(() => NetworkInfoImpl(internetConnectionChecker: sl()),);
  sl.registerLazySingleton(() => InternetConnectionChecker(),);
  sl.registerLazySingleton(() => http.Client(),);

  //shared preferences
  sl.registerLazySingleton(() => sharedPreferences);

  // data sources
  sl.registerLazySingleton(() => PostsRemoteDataSourceImplWithHttp(client: sl()),);
  sl.registerLazySingleton(() => PostsLocalDataSourceImpl(sharedPreferences: sl()),);

  // repository
  sl.registerLazySingleton(() => PostsRepoImplementation(
      networkInfo: sl(),
      postsLocalDataSource: sl(),
      postsRemoteDataSource: sl()),);

  // use cases
  sl.registerLazySingleton(() => AddPostUseCase(postsDomainRepo: sl()),);
  sl.registerLazySingleton(() => DeletePostUseCase(postsDomainRepo: sl()),);
  sl.registerLazySingleton(() => UpdatePostUseCase(postsDomainRepo: sl()),);
  sl.registerLazySingleton(() => GetPostsUseCase(postsDomainRepo: sl()),);

  //blocs
  sl.registerFactory(() => PostsBloc(getPostsUseCase: sl()),);
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPostUseCase: sl(),
      updatePostUseCase: sl(),
      deletePostUseCase: sl()),);






}
