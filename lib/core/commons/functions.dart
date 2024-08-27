


import 'package:flutter/material.dart';

buildScaffoldMessenger({required BuildContext context,
  required String message , required Color snackColor})
{

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,style: TextStyle(color: Colors.white),),
      backgroundColor: snackColor,
      elevation: 0,
    ),
  );


}