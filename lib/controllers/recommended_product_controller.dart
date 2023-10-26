import 'package:get/get.dart';
import 'package:shop_app/data/repository/popular_product_repo.dart';
import 'package:shop_app/models/product_models.dart';

import '../data/repository/recommended_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic>_recommendedProductList=[];
  List<dynamic> get recommendedProductList=>_recommendedProductList;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  Future<void>getRecommendedList()async {
    Response response=await recommendedProductRepo.GetRecommendedProductList();
    if(response.statusCode==200)
    {
      print("donee");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      update();
      print(_recommendedProductList);
      _isLoaded=true;
    }
    else{

    }

  }


}