import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:restaurant_app/misc/app_colors.dart';

class IconDetailPage extends StatelessWidget {

  final IconData icon ;
  double? size = 40;
  Color? backgroundColor = AppColors.mainColor;
  Color? iconColor = Colors.white;
  IconDetailPage({super.key,
  required this.icon,
  this.backgroundColor ,
  this.size,
  this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border:Border.all(
          color: AppColors.mainColor,
          width: 1
        ),
        

      ),
      child: Center(child: Icon(icon,color: iconColor,)),
    );
  }
}