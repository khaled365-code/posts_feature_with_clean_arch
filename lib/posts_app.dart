

import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}