import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_clean_arch/features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app_with_clean_arch/features/posts/presentation/views/add_or_update_post_screen.dart';


import '../../features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import '../../features/posts/presentation/views/all_posts_screen.dart';
import '../injection/injector.dart' as di;
import 'app_routes.dart';

class AppRouter {


  static Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.postsScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) =>
              di.sl<PostsBloc>()
                ..add(GetPostsEvent()),
              child: AllPostsScreen(),
            ), settings: routeSettings);
      case AppRoutes.addOrUpdatePostScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => di.sl<AddDeleteUpdatePostBloc>(),
              child: AddOrUpdatePostScreen(),
            ), settings: routeSettings);
    }
  }


}