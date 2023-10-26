import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widget/small_text.dart';

import '../utils/dimensions.dart';

class Expandable_Text extends StatefulWidget {
  final String text;
  const Expandable_Text({super.key, required this.text});

  @override
  State<Expandable_Text> createState() => _Expandable_TextState();
}

class _Expandable_TextState extends State<Expandable_Text> {
  late String first_half;
  late String second_half;
  bool hiddentext=true;
  double textheight=Dimensions.ScreenHeight/5.63;
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textheight)
      {
        first_half=widget.text.substring(0,textheight.toInt());
        second_half=widget.text.substring(textheight.toInt()+1,widget.text.length);
      }
    else
      {
        first_half=widget.text;
        second_half="";
      }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: second_half.isEmpty?SmallText(text: first_half,size: 20,):Column(
        children: [
          SmallText(text: hiddentext?(first_half+"...."):(first_half+second_half),size: 20,color: Colors.black,),
          InkWell(
            onTap: (){
              setState(() {
                hiddentext=!hiddentext;
                // if(hiddentext==false)
                //   {
                // SmallText(text: " Show less",color: Colors.lightGreen,size: 20,);
                // Icon(Icons.arrow_drop_up,color: Colors.green,size: 17,);
                // }


              });
            },
            child: Row(
              children: [
                SizedBox(height: 50,),
                //SmallText(text: first_half+"...",color: Colors.black,size: 20,),
               // if(hiddentext)
                SmallText(text: hiddentext?"Show more":"Show less",color: Colors.lightGreen,size: 20,),
                Icon(hiddentext?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.green,size: 17,),
              ],
            ),
          )
        ],
      )

    );
  }
}
