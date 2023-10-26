import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shop_app/pages/cart/cart_page.dart';
import 'package:shop_app/pages/food/popular_food_details.dart';
import 'package:shop_app/pages/food/recommended_food_details.dart';
import 'package:shop_app/pages/home/food_page_body.dart';
import 'package:shop_app/pages/home/home_page.dart';
import 'package:shop_app/pages/home/main_food_page.dart';

class RouterHelper{
  static const String initial="/";
  static  String getInitial()=>"$initial";
  static const String popularFood="/popular-food";
  static const String recommendedfood="/recommended-food";
  static const String cartPage="/cart-page";
  static  String getRecommendedFood(int pageId,String page)=>"$recommendedfood?pageId=$pageId&page=$page";
  static  String getPopularFood(int pageId,String page)=>"$popularFood?pageId=$pageId&page=$page";
  static String getCartPage()=>"$cartPage";
  static List<GetPage>routes=[
    GetPage(name: initial, page: (){
      return HomePage();
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: popularFood, page: (){
     var pageId=Get.parameters['pageId'];
     var page=Get.parameters['page'];

      return PopularFoodDetails(pageId:int.parse(pageId!),page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedfood, page: () {
      // GetPage(name: recommendedfood, page: (){
      var pageId = Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return Recommended_Food_Details(pageId:int.parse(pageId!),page:page!);
    },
      //  },
      transition:Transition.fadeIn,

    ),
    GetPage(name: cartPage, page: (){
      return CartPage();

    }
    ,
      transition: Transition.fadeIn,
    ),


  ]
  ;

}