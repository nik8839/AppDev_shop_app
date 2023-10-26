import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/controllers/recommended_product_controller.dart';
import 'package:shop_app/pages/home/main_food_page.dart';
import 'package:shop_app/routes/routes_helper.dart';
import 'package:shop_app/utils/appconstant.dart';
import 'package:shop_app/widget/app_icons.dart';
import 'package:shop_app/widget/big_text.dart';

import '../../widget/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 60,
              right: 20,
          left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouterHelper.getInitial());
                    }

                    ,child: AppIcons(icon: Icons.arrow_back_ios,
                    iconcolor: Colors.white,
                      backgroundcolor: Colors.lightGreen,
                      iconsize: 20,
                    ),
                  ),
                  SizedBox(width: 60,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouterHelper.getInitial());
                    },
                    child: AppIcons(icon: Icons.home_filled,
                      iconcolor: Colors.white,
                      backgroundcolor: Colors.lightGreen,
                      iconsize: 20,
                    ),
                  ),
                  AppIcons(icon: Icons.shopping_cart_outlined,

                    iconcolor: Colors.white,
                    backgroundcolor: Colors.lightGreen,
                    iconsize: 20,
                  ),

                ],

          )),
          Positioned(
              top: 100,
              right: 20,
              left: 20,
              bottom: 0,
              child: Container(
               // color: Colors.red,
                margin: EdgeInsets.only(top: 10),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList=cartController.getItems;
                    return  ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_,index){
                          return Container(
                            height: 100,width: double.maxFinite,
                            // color: Colors.blue,
                            // margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    var popularIndex=Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                    if(popularIndex>=0)
                                      {
                                        Get.toNamed(RouterHelper.getPopularFood(popularIndex,"cartpage"));
                                      }
                                    else
                                      {
                                        var recommendedIndex=Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                        if(recommendedIndex>=0)
                                        {
                                          Get.toNamed(RouterHelper.getRecommendedFood(recommendedIndex,"cartpage"));
                                        }

                                      }



                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left:5,bottom: 5),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstant.Base_Url+AppConstant.Upload_Uri+cartController.getItems[index].img!
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width:10),
                                Expanded(child: Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!,color: Colors.black,size: 20,),
                                      SmallText(text:"Spicy",color: Colors.black,size: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: cartController.getItems[index]!.price.toString(),color: Colors.redAccent,),
                                          Container(
                                            height: 60,
                                            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.black12,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: ()
                                                    {
                                                      // print("done");
                                                      // popularProduct.setQuantity(false);
                                                      cartController.addItem(cartController.getItems[index].product!, -1);
                                                    },
                                                    child: Icon(Icons.remove)),
                                                SizedBox(width: 20,),
                                                SmallText(text:  cartController.getItems[index]!.quantity.toString(),color: Colors.black,size: 20,),//popularProduct.inCartItems.toString(),size: 20,color: Colors.black,),
                                                SizedBox(width: 20,),
                                                GestureDetector(
                                                    onTap: ()
                                                    {
                                                      // print("done");
                                                      //popularProduct.setQuantity(true);
                                                      cartController.addItem(cartController.getItems[index].product!, 1);
                                                    },
                                                    child: Icon(Icons.add)),
                                              ],
                                            ),
                                          ),


                                        ],
                                      )






                                    ],
                                  ),


                                ))
                              ],
                            ),

                          );

                        });

                  })
                ),

              )),

        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
          return  Container(
            height: 120,
            padding: EdgeInsets.only(left: 10,right: 10,top: 10),
            //color: Colors.white70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [

                      SizedBox(width: 20,),
                      SmallText(text: "\$ "+cartController.totalAmount.toString(),size: 20,color: Colors.black,),
                      SizedBox(width: 20,),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black12,

                  ),
                  child: GestureDetector(
                      onTap: (){
                        //popularProduct.addItem(product);
                      },
                      child: BigText(text:"Check Out!!",size: 20,color: Colors.black,)),

                )

              ],
            ),
          );
        },)
    );
  }
}
