

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SharedButton extends StatelessWidget {

  final void Function() onButtonPressed;
  final String text;
  const SharedButton({super.key, required this.onButtonPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onButtonPressed,
        child: FittedBox(
           fit: BoxFit.scaleDown,
           alignment: AlignmentDirectional.centerStart,
          child: Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal
          ),),
        ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        fixedSize: Size(100, 50),
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
          shadowColor:  AppColors.primaryColor,

      ),

    );
  }
}
