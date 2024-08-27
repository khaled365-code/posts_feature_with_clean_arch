


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_clean_arch/core/routes/app_routes.dart';
import 'package:posts_app_with_clean_arch/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';

import '../../../../core/widgets/loading_indicator_widget.dart';
import '../widgets/display_message_widget.dart';
import '../widgets/show_posts_widget.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       automaticallyImplyLeading: false,
        title: Text('Posts',style: TextStyle(color: Colors.white),),),
      body: _buildBodyFun(),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

 Widget  _buildBodyFun()
 {
   return BlocBuilder<PostsBloc,PostsState>(
       builder: (context, state)
       {
         if (state is PostsLoadingState)
         {
           return Center(child: LoadingIndicatorWidget());
         } else if (state is PostsSuccessState)
         {
            return ShowPostsWidget(
              posts: state.postsList,
            );
         } else if (state is PostsFailureState)
         {
            return DisplayMessageWidget(
              message: state.message,
            );
         } else
         {
            return Text('initial state');
         }
       },);

 }

  Widget _buildFloatingButton(BuildContext context)
  {
    return FloatingActionButton(
      onPressed: (){
        Navigator.pushNamed(context, AppRoutes.addOrUpdatePostScreen);
      },
      child: Icon(Icons.add),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ) ,);

  }
}
