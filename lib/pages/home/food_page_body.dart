import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/controllers/recommended_product_controller.dart';
import 'package:shop_app/models/product_models.dart';
import 'package:shop_app/pages/food/popular_food_details.dart';
import 'package:shop_app/routes/routes_helper.dart';
import 'package:shop_app/utils/appconstant.dart';
import 'package:shop_app/widget/big_text.dart';
import 'package:shop_app/widget/icon_text_widget.dart';
import 'package:shop_app/widget/small_text.dart';

import '../../utils/dimensions.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController=PageController(viewportFraction:0.82);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.PageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
       setState(() {
         _currPageValue=pageController.page!;


       });



    });
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder:(popularproduct){
        return  popularproduct.isLoaded?Container(
          height: Dimensions.ViewPage,
          //padding: EdgeInsets.only(left:),
          margin: EdgeInsets.only(bottom: 30),
         // child: GestureDetector
           // (
            // onTap: (){
            //   Get.to(PopularFoodDetails());
              // Get.toNamed(RouterHelper.getPopularFood());
             //},

            child: PageView.builder(
                controller: pageController,
                itemCount: popularproduct.popularProductList.length,
                itemBuilder: (context,position){
                  return _build_Page_Item(position,popularproduct.popularProductList[position]);


                }),
          //),

        ):CircularProgressIndicator(
          color: Colors.black,
        );

        }),
        GetBuilder<PopularProductController>(builder: (popularproduct){
          return DotsIndicator(
            dotsCount: popularproduct.popularProductList.isEmpty?1: popularproduct.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.green,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );

        }),
        SizedBox(height: 10,),

        Container(
            padding: EdgeInsets.only(left:5),
            margin: EdgeInsets.only(left: 10),
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BigText(text: "Recommended",size: 20,color: Colors.black,),
                 SizedBox(width: 10,),
                Container(

                  child: BigText(text: ".",size:20,color:Colors.black),
                ),

                 SizedBox(width: 20,),
                Container(
                  margin: EdgeInsets.only(bottom: 2,top: 8),
                  child: SmallText(text: "Food pairing",size: 15,color: Colors.black45,),
                ),


              ],
            )




        ),
      //  Container(
         // height: 2000,
          //width: 700,
          //padding: EdgeInsets.only(bottom: 10),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return  recommendedProduct.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedProduct.recommendedProductList.length,
              shrinkWrap:true,
              //padding: EdgeInsets.only(bottom: 50),
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouterHelper.getRecommendedFood(index,"home"));
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          padding: EdgeInsets.only(bottom: 1),
                          margin: EdgeInsets.only(bottom:1),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(
                                  20

                              ),
                              color: Colors.white,
                              image: DecorationImage( image: NetworkImage(AppConstant.Base_Url+AppConstant.Upload_Uri+recommendedProduct.recommendedProductList[index].img!),fit: BoxFit.cover)

                          ),
                        ),
                        //SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewImageH,
                            width: Dimensions.listViewImageW,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5,right:5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: recommendedProduct.recommendedProductList[index].name!,size: 25,color: Colors.black,
                                  ),
                                  SizedBox(height: 20,),
                                  SmallText(text: "Try with something new.Not Bored??",size: 12,color: Colors.black,),
                                  SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      IconLoc(icon: Icons.circle_sharp,
                                          text:"Normal",  icon_color: Colors.yellow),
                                      SizedBox(width: 10,),
                                      IconLoc(icon: Icons.location_on,
                                          text:"1.7 km",  icon_color: Colors.greenAccent),
                                      SizedBox(width: 10,),
                                      IconLoc(icon: Icons.access_time_rounded,
                                          text:"32 min", icon_color: Colors.black),




                                    ],
                                  ),


                                ],
                              ),



                            ),
                          ),
                        )
                      ],
                    ),

                  ),
                );
              }):CircularProgressIndicator(
            color: Colors.black,
          );
        }),

       // )


      ],
    );
  }
  Widget  _build_Page_Item(int index, ProductModel popularProduct){
    Matrix4 matrix=Matrix4.identity();
    if(index==_currPageValue.floor())
      {
        var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans=_height*(1-currScale)/2;
        matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

      }
    else if(index==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(index==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else{
      var currScale=0.8;
      var currTrans=_height*(1-_scaleFactor)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        GestureDetector(
          onTap: (){
        //   Get.to(PopularFoodDetails());
        Get.toNamed(RouterHelper.getPopularFood(index,"home"));
    },
          child: Container(
          height: Dimensions.PageViewContainer,
          margin: EdgeInsets.only(left: 5,right: 5,top: 25,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color:Colors.lightGreen,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(AppConstant.Base_Url+AppConstant.Upload_Uri+popularProduct.img!),
            ),
            //color: Colors.
          ),


      ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.TextViewContainer,
                margin:EdgeInsets.only(bottom:5 ,left: 30,right: 30),
                padding: EdgeInsets.only(left:30,right: 15,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0,5)
                    )
                  ]
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: popularProduct.name!,size: 24,color: Colors.black,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                            children:
                              List.generate(popularProduct.stars!, (index) => Icon(Icons.star,color: Colors.greenAccent,)),
                          ),
                          SizedBox(width: 10),
                          SmallText(text: "4.5",color:Colors.black38,size: 12,),
                          SizedBox(width: 10),
                          SmallText(text: "100k comments",color:Colors.black38,size: 12,),




                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                         IconLoc(icon: Icons.circle_sharp,
                             text:"Normal",  icon_color: Colors.yellow),
                          SizedBox(width: 10,),
                          IconLoc(icon: Icons.location_on,
                              text:"1.7 km",  icon_color: Colors.greenAccent),
                          SizedBox(width: 10,),
                          IconLoc(icon: Icons.access_time_rounded,
                              text:"32 min", icon_color: Colors.black),




                        ],
                      ),

                    ],
                  ),
                ),

              ),


                //color: Colors.


            ),
        ],
      ),
    );

  }
}
