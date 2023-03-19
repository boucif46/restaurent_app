import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
   IconData? icon;
   String? image;
   String? text;
  double size ;
   Color iconColor ;
  Color backgroundColor;
  bool? border =false;
  bool isIcon ;

   AppIcon({super.key, 
    this.border,
    this.size = 50,
     this.icon, 
    this.iconColor= Colors.black87, 
    this.backgroundColor = Colors.white,
    required this.isIcon,
     this.image, 
      this.text
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 65,
          width: 65,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
            border: Border.all(
              width: 1.0,
              color: Colors.black45
            )
          ),
          
          child: Center(child:isIcon == true ? Icon(icon) :Image(image: AssetImage("images/"+image!),width: 45,height: 45,)),
          
        ),
        const SizedBox(height: 4,),
        Text(text!)
      ],
    );
  }
}