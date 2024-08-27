
import 'package:flutter/material.dart';

class DisplayMessageWidget extends StatelessWidget {

  final String message;
  const DisplayMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height/3,
      child: Text(message,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
    );
  }
}
