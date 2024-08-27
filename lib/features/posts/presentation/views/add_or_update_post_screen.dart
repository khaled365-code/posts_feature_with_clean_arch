

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_clean_arch/features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/loading_indicator_widget.dart';
import '../widgets/add_update_delete_widgets/form_widget.dart';

class  AddOrUpdatePostScreen extends StatelessWidget {


  const  AddOrUpdatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),

    );
  }

  AppBar _buildAppBar(BuildContext context)
  {
    return AppBar(
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
      title: Text('Add Post',style: TextStyle(color: Colors.white),),);

  }

  Widget _buildBody()
  {
    return BlocConsumer<AddDeleteUpdatePostBloc,AddDeleteUpdatePostState>
      (
        builder: (context,state)
        {
          if(state is AddDeleteUpdatePostLoadingState)
            {
              return Center(child: LoadingIndicatorWidget(),);
            }
          else
              {
                return FormWidget();
              }
        },
        listener: (context,state)
        {
          if (state is AddDeleteUpdatePostSuccessState)
            {
              buildScaffoldMessenger(message: state.message, context: context, snackColor: Colors.green);
              Navigator.pushNamed(context, AppRoutes.postsScreen);
            }
          else if (state is AddDeleteUpdatePostFailureState)
            {
              buildScaffoldMessenger(message: state.message, context: context, snackColor: Colors.redAccent);
            }
        });
  }
}
