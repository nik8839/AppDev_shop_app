import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:shop_app/utils/appconstant.dart';
class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String AppBaseUrl;

  late Map<String,String>_mainheaders;
  ApiClient({required this.AppBaseUrl}){
    baseUrl=AppBaseUrl;
    token=AppConstant.Token;
    timeout=Duration(seconds: 31);
    _mainheaders={
      'Content-type':'application/json; charset=UTF-8',
    //'Authorization':'Bearer $token'
    };

  }
  Future<Response>getData(String uri) async {
    try{
      Response response=await get(uri);
      return response;


    }
    catch(e)
    {
      return Response(statusCode: 1,statusText: e.toString());

    }
  }
}