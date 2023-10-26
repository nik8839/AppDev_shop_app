import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/data/api/api_client.dart';
import 'package:shop_app/data/repository/cart_repo.dart';
import 'package:shop_app/data/repository/popular_product_repo.dart';
import 'package:shop_app/utils/appconstant.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void>init()async {
  //api client
  Get.lazyPut(()=>ApiClient(AppBaseUrl: AppConstant.Base_Url));
  //repo
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo());
  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(()=>CartController(cartRepo: Get.find()));

}