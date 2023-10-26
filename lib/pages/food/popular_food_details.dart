import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/pages/cart/cart_page.dart';
import 'package:shop_app/pages/home/main_food_page.dart';
import 'package:shop_app/utils/dimensions.dart';
import 'package:shop_app/widget/app_icons.dart';
import 'package:shop_app/widget/expandable_text_widget.dart';

import '../../routes/routes_helper.dart';
import '../../utils/appconstant.dart';
import '../../widget/app_column.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_text_widget.dart';
import '../../widget/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  final String page;
  PopularFoodDetails({Key?key ,required this.pageId, required this.page}):super(key:key);
  @override
  Widget build(BuildContext context) {
    var product =Get.find<PopularProductController>().popularProductList[pageId];
  //  print("product id is"+pageId.toString());
   // print("product name is"+product.name.toString());
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.PopularDetailsH,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage(
                      AppConstant.Base_Url+AppConstant.Upload_Uri+product.img!,
                    ),
                  )
                ),

          )),
          Positioned(
            top: 30,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                  onTap: (){
                 //   print("button pressed");
                  // Get.toNamed(RouterHelper.getInitial());
                   // Get.to=>MainFoodPage()
                    if(page=='cartpage')
                      Get.toNamed(RouterHelper.getCartPage());
                      else
                        Get.toNamed(RouterHelper.getInitial());
                   // Get.to(()=>MainFoodPage());
                   // Get.to(MainFoodPage());
                  },
                  child: AppIcons(icon: Icons.arrow_back_ios)),
            //  SizedBox(width:380,),
              GetBuilder<PopularProductController>(builder: (controller){
                return GestureDetector(
                  onTap: ()
                  {
                      if(controller.totalItems>=1)
                      Get.toNamed(RouterHelper.getCartPage());
                   
                  },
                  child: Stack(
                    children: [
                      AppIcons(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>0?
                      Positioned(
                          right:0,
                          top:0,

                              child: AppIcons(icon: Icons.circle,size: 20,iconcolor: Colors.transparent,backgroundcolor: Colors.lightGreen,)
                          //),
                      ):
                           Container(),
                      Get.find<PopularProductController>().totalItems>0?
                      Positioned(
                          right:6,
                          top:1,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12,
                              color: Colors.white,
                          )
                      ):
                      Container(),


                    ],
                  ),
                );
              })

            ],
          )),
          Positioned(
              left:0,
              right: 0,
              bottom: 0,
              top: Dimensions.PopularDetailsH-30,
              child: Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text:product.name!),
                    SizedBox(height: 20,),
                    BigText(text: "Introduce",size: 40,color: Colors.black45,),
                    
                    Expanded(child: SingleChildScrollView(child:
                    Expandable_Text(text: product.description)))
                   // ")
                  //  Expandable_Text(text: "ljaskjfbvnjasndklj")
                   // Text("This burger is so spicy,juicy filled with freshly cut and chopped items. You are going to love it. the 2 layers of aloo patty and paneer patty give it a good option.")
                  ]
                )
          )),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
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
                    GestureDetector(
                        onTap: ()
                        {
                         // print("done");
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove)),
                    SizedBox(width: 20,),
                    SmallText(text: popularProduct.inCartItems.toString(),size: 20,color: Colors.black,),
                    SizedBox(width: 20,),
                    GestureDetector(
                        onTap: ()
                        {
                         // print("done");
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add)),
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
                      popularProduct.addItem(product);
                    },
                    child: BigText(text: "\$${product.price}  |Add to Cart",size: 20,color: Colors.black,)),

              )

            ],
          ),
        );
      },)

    );
  }
}
