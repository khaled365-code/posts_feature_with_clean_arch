

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

class  CustomOutlinedTextField extends StatelessWidget {

  final Widget? suffixIcon;
  final bool? obsecureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText,labelText;
  final TextStyle? hintStyle,labelStyle,inputTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextDirection? textDirection;
  final int? maxLines,minLines;
  const  CustomOutlinedTextField({super.key, this.suffixIcon, this.obsecureText, required this.controller, this.validator, this.contentPadding, this.hintText, this.labelText, this.hintStyle, this.labelStyle, this.inputTextStyle, this.inputFormatters, this.onFieldSubmitted, this.onChanged, this.textDirection,  this.maxLines,  this.minLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: inputTextStyle??TextStyle(
        decoration: TextDecoration.none,
      ),
      validator: validator,
      controller: controller,
      obscureText: obsecureText??false,
     textDirection: textDirection,
     maxLines: maxLines,
     minLines: minLines,
     decoration: InputDecoration(
       hintStyle: hintStyle,
       hintText: hintText,
       labelText: labelText,
       labelStyle: labelStyle,
       contentPadding: contentPadding??EdgeInsetsDirectional.symmetric(vertical: 20),
       fillColor: Colors.white,
       filled: true,
       suffixIcon: suffixIcon,
       enabledBorder: buildOutlineInputBorder(),
         focusedBorder: buildOutlineInputBorder()
     ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
       borderSide: BorderSide(
         color: Colors.grey,
       ),

     );
  }
}
