import 'package:get/get.dart';
import 'package:shop_app/utils/appconstant.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService{
 final ApiClient apiClient;
 PopularProductRepo({required this.apiClient});
Future<Response>GetPopularProductList()async{
return await apiClient.getData(AppConstant.Popular_Product_Uri);
}

}