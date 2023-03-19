import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/widgets/app_latge_text.dart';

class ExpndbleText extends StatefulWidget {
  final String text ;
  const ExpndbleText({super.key, required this.text});

  @override
  State<ExpndbleText> createState() => _ExpndbleTextState();
}

class _ExpndbleTextState extends State<ExpndbleText> {
  late String firstHalf;
  late String secondHalf;

  bool _hiddenText = true ;
 
  double textHeight = 150;


  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text ;
      secondHalf="";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Text(firstHalf):Column(
        children: [
          Text(_hiddenText?(firstHalf+"..."):(firstHalf+secondHalf),),
          InkWell(
            onTap: (){
              setState(() {
                _hiddenText=!_hiddenText;
              });
            },
            child: Row(
              children: [
                AppLargeText(text: "Show more",size: 16,color: AppColors.mainColor,),
                Icon(_hiddenText==true?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}