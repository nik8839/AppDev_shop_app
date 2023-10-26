import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/food/popular_food_details.dart';
import 'package:shop_app/widget/small_text.dart';

import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  String text;

   AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:text,size: 50,color: Colors.black,),
        SizedBox(height: 20,),
        Row(
          children: [
            Wrap(
              children:
              List.generate(5, (index) => Icon(Icons.star,color: Colors.greenAccent,)),
            ),
            SizedBox(width: 40),
            SmallText(text: "4.5",color:Colors.black38,size: 20,),
            SizedBox(width: 60),
            SmallText(text: "100k comments",color:Colors.black38,size: 15,),




          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            IconLoc(icon: Icons.circle_sharp,
                text:"Normal",  icon_color: Colors.yellow),
            SizedBox(width: 80,),
            IconLoc(icon: Icons.location_on,
                text:"1.7 km",  icon_color: Colors.greenAccent),
            SizedBox(width: 30,),
            IconLoc(icon: Icons.access_time_rounded,
                text:"32 min", icon_color: Colors.black),




          ],
        ),

      ],
    );
  }
}
