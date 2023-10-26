import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/data/repository/popular_product_repo.dart';
import 'package:shop_app/models/product_models.dart';

import '../models/cart_models.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic>_popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;
  bool _isLoaded=false;
  late CartController _cart;
  bool get isLoaded=>_isLoaded;
  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartitems=0;
  int get inCartItems=>_inCartitems+_quantity;
  Future<void>getPopularList()async {
    Response response=await popularProductRepo.GetPopularProductList();
    if(response.statusCode==200)
      {
        print("done");
        _popularProductList=[];
        _popularProductList.addAll(Product.fromJson(response.body).products);
        update();
        print(_popularProductList);
        _isLoaded=true;
      }
    else{

    }

  }
  void setQuantity(bool isIncrement)
  {
    if(isIncrement)
      {
        if(_inCartitems+_quantity<20)
        _quantity=_quantity+1;
        else
          {
            Get.snackbar("Reached Limit Quantuty", "Limit cannot exceed 20",
            backgroundColor: Colors.black,
              colorText: Colors.white,

            );
          }
      }
    else
      {
        if(_inCartitems+_quantity>0)
        _quantity=_quantity-1;
        else
        {
          Get.snackbar("Reached Minimum Limit Quantity", "Limit cannot be 0",
            backgroundColor: Colors.black,
            colorText: Colors.white,

          );
        }
      }
    update();
  }
  void initProduct(ProductModel product,CartController cart)
  {
    _inCartitems=0;
    _quantity=0;
    _cart=cart;
    var exist=false;
    exist=_cart.existInCart(product);
    if(exist)
      {
        _inCartitems=_cart.getQuantity(product);
      }
  }
  void addItem(ProductModel product)
  {
    //if(_quantity>0) {
      _cart.addItem(product, _quantity);
      _quantity=0;
      _inCartitems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print("the key is " + value.id.toString() + " the quantity is " +
            value.quantity.toString());
      });
   // }
    update();

  }
  int get totalItems{
    return _cart.totalItems;
  }
  List<CartModel>get getItems{
    return _cart.getItems;
  }


}