import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconcolor;
  final double size;
  final double iconsize;
   AppIcons({super.key, required this.icon,  this.backgroundcolor=Colors.white,  this.iconcolor=Colors.black,  this.size=40,this.iconsize=16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolor,

      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconsize,
      ),

    );
  }
}
