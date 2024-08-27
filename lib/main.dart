import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_clean_arch/posts_app.dart';
import 'core/injection/injector.dart' as di;
import 'core/injection/injector.dart';
import 'features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await di.setupServiceLocator();
  runApp(const PostsApp());
}



