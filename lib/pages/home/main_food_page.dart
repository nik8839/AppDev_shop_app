import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widget/big_text.dart';
import 'package:shop_app/widget/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("height= "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body:  Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //Text("Welcome"),
                    BigText(text: "Welcome",color: Colors.lightGreen,size: 24,),
                    Row(
                      children: [
                        SmallText(text: "John",color: Colors.blueGrey,size: 18,),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],

                ),
                Center(
                  child: Container(
                    height: 45,
                    width: 60,
                    child: Icon(Icons.search,color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightGreen,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
             child:FoodPage(),
          ))





        ],
      )



    );
  }
}
