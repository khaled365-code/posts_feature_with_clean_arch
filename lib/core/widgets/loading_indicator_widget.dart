

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: AppColors.secondaryColor,
      ),
    );
  }
}
