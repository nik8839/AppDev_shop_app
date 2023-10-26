import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
   BigText({super.key,  this.color=Colors.lightGreen, required this.text, this.size=20,this.overFlow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size,
      ),


    );
  }
}
