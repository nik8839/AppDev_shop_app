import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/controllers/recommended_product_controller.dart';
import 'package:shop_app/pages/cart/cart_page.dart';
import 'package:shop_app/routes/routes_helper.dart';
import 'package:shop_app/utils/appconstant.dart';
import 'package:shop_app/widget/app_icons.dart';
import 'package:shop_app/widget/big_text.dart';
import 'package:shop_app/widget/expandable_text_widget.dart';

import '../../controllers/cart_controller.dart';

class Recommended_Food_Details extends StatelessWidget {
  int pageId;
  String page;
   //Recommended_Food_Details({Key ? key, required this.pageId}):super(key:key);
  Recommended_Food_Details(  {required this.pageId,required this.page});

  @override
  Widget build(BuildContext context) {
    var rec_product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(rec_product,Get.find<CartController>());
   // print(rec_product.name);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(Icons.close,color: Colors.white,),
                // Icon(Icons.add_shopping_cart,color: Colors.whi
                //
                GestureDetector(
                  onTap: (){

                   // Get.toNamed(RouterHelper.initial);
                    if(page=='cartpage')
                      Get.toNamed(RouterHelper.getCartPage());
                    else
                      Get.toNamed(RouterHelper.getInitial());
                    // Get.to(()=>MainFoodPage());
                  },
                  child: AppIcons(icon: Icons.close),
                ),
               // AppIcons(icon: Icons.shopping_cart),
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
                          //  )
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
            ),
            bottom: PreferredSize(preferredSize:Size.fromHeight(50),
            child: Container(

              child: Center(child: BigText(text:rec_product.name,size: 30,color: Colors.black,)),
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),

                ),
                color: Colors.white,
              ),
            )

            ),
            pinned: true,
            backgroundColor: Colors.brown,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstant.Base_Url+AppConstant.Upload_Uri+rec_product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: Expandable_Text(text: rec_product.description),
                  margin: EdgeInsets.only(left: 10,right: 10),
                  )
                ],
              ),            
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 80,right: 80,top: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                      onTap:(){
                        controller.setQuantity(false);

                              },
                      child: AppIcons(icon: Icons.remove,backgroundcolor: Colors.black,iconcolor: Colors.white,size: 40,iconsize: 20,)),
                  BigText(text: "\$${rec_product.price} X ${controller.inCartItems}",size: 30,color: Colors.black,),
                  GestureDetector(
                      onTap: (){
                        controller.setQuantity(true);
                      },
                      child: AppIcons(icon: Icons.add,backgroundcolor: Colors.black,iconcolor: Colors.white,size: 40,iconsize: 20,)),


                ],
              ),
            ),
            Container(
              //margin: EdgeInsets.only(left:10,right: 10),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12,
                    ),
                    child:AppIcons(icon: Icons.favorite_border,iconsize: 30,),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(rec_product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black12,

                      ),
                      child: BigText(text: "\$${rec_product.price! } |Add to Cart",size: 20,color: Colors.black,),

                    ),
                  )

                ],
              ),
            ),
          ],
        );
      })
    );
  }
}
