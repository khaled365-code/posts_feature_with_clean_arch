

import 'package:flutter/material.dart';
import 'package:posts_app_with_clean_arch/core/routes/app_routes.dart';
import 'package:posts_app_with_clean_arch/core/routes/router.dart';

import 'core/app_theme/app_theme.dart';
import 'features/posts/presentation/views/all_posts_screen.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.postsScreen,
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}