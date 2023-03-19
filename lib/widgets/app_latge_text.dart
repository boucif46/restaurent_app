
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  bool? isBold; 
  bool? overflow;
  AppLargeText({super.key,
    this.size = 30,
    this.overflow =false ,
    required this.text,
    this.color = Colors.black,
    this.isBold=true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: isBold==true?size:25,
        fontWeight:isBold==true?FontWeight.bold:FontWeight.normal,
        overflow:overflow== true?TextOverflow.ellipsis:null
         ),
    );
  }
}