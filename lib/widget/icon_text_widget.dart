import 'package:flutter/cupertino.dart';
import 'package:shop_app/widget/small_text.dart';

class IconLoc extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color icon_color;
  const IconLoc({super.key, required this.icon, required this.text, required this.icon_color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: icon_color,),
        SizedBox(width: 5,),
        SmallText(text: text,size: 12,),
      ],
    );
  }
}
