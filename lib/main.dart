import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_app/controllers/popular_product_controllers.dart';
import 'package:shop_app/pages/cart/cart_page.dart';
import 'package:shop_app/pages/food/popular_food_details.dart';
import 'package:shop_app/pages/food/recommended_food_details.dart';
import 'package:shop_app/pages/home/main_food_page.dart';
import 'package:shop_app/routes/routes_helper.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularList();
    Get.find<RecommendedProductController>().getRecommendedList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home:MainFoodPage(),
       initialRoute: RouterHelper.getInitial(),
       getPages: RouterHelper.routes,
      // MainFoodPage()
    );
  }
}


