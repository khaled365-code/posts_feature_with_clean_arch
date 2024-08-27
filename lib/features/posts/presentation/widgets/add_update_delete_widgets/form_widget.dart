


import 'package:flutter/material.dart';
import 'package:posts_app_with_clean_arch/core/widgets/shared_button.dart';
import 'package:posts_app_with_clean_arch/features/posts/domain/entities/posts_entity.dart';

import '../../../../../core/widgets/custom_outlined_text_field.dart';
import '../../bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddDeleteUpdatePostBloc.get(context).addPostFormKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            CustomOutlinedTextField(
              onFieldSubmitted: (value)
              {
                if(AddDeleteUpdatePostBloc.get(context).addPostFormKey.currentState!.validate())
                {
                  AddDeleteUpdatePostBloc.get(context).add(AddPostEvent(post: PostsEntity(
                    postId: 0 ,
                    title: AddDeleteUpdatePostBloc.get(context).titleForAddPostController.text,
                    body: AddDeleteUpdatePostBloc.get(context).bodyForAddPostController.text,)));
                }
              },
              validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'you must write a title ';
                }
                else if(value=='')
                {
                  return 'this field should not be empty';
                }
                return null;
              },
              maxLines: 1,
              hintText: 'Title',
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey
              ),
              contentPadding: EdgeInsetsDirectional.only(top: 20,start: 10),
              controller: AddDeleteUpdatePostBloc.get(context).titleForAddPostController,
            ),
            SizedBox(height: 20,),
            CustomOutlinedTextField(
              onFieldSubmitted: (value)
              {
                if(AddDeleteUpdatePostBloc.get(context).addPostFormKey.currentState!.validate())
                {
                  AddDeleteUpdatePostBloc.get(context).add(AddPostEvent(post: PostsEntity(
                    postId: 0 ,
                    title: AddDeleteUpdatePostBloc.get(context).titleForAddPostController.text,
                    body: AddDeleteUpdatePostBloc.get(context).bodyForAddPostController.text,)));
                }
              },
              validator: (value)
              {
                if(value!.isEmpty)
                  {
                    return 'you must write a title ';
                  }
                else if(value=='')
                  {
                    return 'this field should not be empty';
                  }
                return null;
              },
             minLines: 6,
              maxLines: 6,
              hintText: 'body',
              hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey
              ),
              controller: AddDeleteUpdatePostBloc.get(context).bodyForAddPostController,
              contentPadding: EdgeInsetsDirectional.only(top: 20,start: 10),
            ),
            SizedBox(height: 30,),
            SharedButton(
               text: 'Add',
              onButtonPressed: (){
                 if(AddDeleteUpdatePostBloc.get(context).addPostFormKey.currentState!.validate())
                   {
                     AddDeleteUpdatePostBloc.get(context).add(AddPostEvent(post: PostsEntity(
                       postId: 0 ,
                       title: AddDeleteUpdatePostBloc.get(context).titleForAddPostController.text,
                       body: AddDeleteUpdatePostBloc.get(context).bodyForAddPostController.text,)));
                   }
              },
            )


          ],
        ),
      ),
    );
  }
}
