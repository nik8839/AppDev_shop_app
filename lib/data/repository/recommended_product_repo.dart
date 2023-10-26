import 'package:get/get.dart';
import 'package:shop_app/utils/appconstant.dart';

import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response>GetRecommendedProductList()async{
    return await apiClient.getData(AppConstant.Recommended_Product_Uri);
  }

}