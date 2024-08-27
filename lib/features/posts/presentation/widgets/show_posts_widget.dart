

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';
import 'package:posts_app_with_clean_arch/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class ShowPostsWidget extends StatelessWidget {

  final List<PostsEntity> posts;
  const ShowPostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () => onDataRefresh(context),
      child: ListView.separated(
          itemBuilder: (context,index){
            int length = posts.length;
            final reversedIndex = length - 1 - index;
            return ListTile(
              leading: Text(posts[reversedIndex].postId.toString()),
              title: Text(posts[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text(posts[index].body,style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),
              contentPadding: EdgeInsetsDirectional.only(start: 15,end: 10),
              onTap: (){},

            );
          },
          separatorBuilder: (context,index)=> Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          itemCount: posts.length),
    );
  }
  Future<void> onDataRefresh(BuildContext context) async
  {
    BlocProvider.of<PostsBloc>(context).add(GetPostsEvent());
  }
}
