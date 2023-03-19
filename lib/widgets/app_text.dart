
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TextOverflow overflow ;
  bool? isBold  ;
  AppText({super.key,
    this.size = 16,
    this.isBold = false,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.color = Colors.black});
    
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: size,
        overflow: overflow,
        fontWeight: isBold == true?FontWeight.bold:null
         ),
    );
  }
}