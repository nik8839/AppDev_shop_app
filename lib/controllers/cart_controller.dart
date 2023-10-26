import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/product_models.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_models.dart';

class CartController extends GetxController{
   final CartRepo cartRepo;
   CartController({required this.cartRepo});
   Map<int,CartModel>_items={};
   Map<int,CartModel>get items=>_items;
   void addItem(ProductModel product,int quantity){
      var totalQuantity=0;
      if(_items.containsKey(product.id!)){
         _items.update(product.id!, (value) {
            totalQuantity=value.quantity!+quantity;

            return CartModel(

               id: value.id,
               name: value.name,
               quantity:value.quantity!+quantity,
               price: value.price,
               isExist: true,
               img: value.img,
               time: DateTime.now().toString(),
               product: product,

            );

         });
         if(totalQuantity<=0)
            _items.remove(product.id);
         
      }
      else
         {
            if(quantity>0)
            _items.putIfAbsent(product.id!, () {
               return CartModel(

                  id: product.id,
                  name: product.name,
                  quantity: quantity,
                  price: product.price,
                  isExist: true,
                  img: product.img,
                  time: DateTime.now().toString(),
                  product: product,

               );
            });
            else
            {
               Get.snackbar ( "Null Quantity", "Add atleast 1 item in cart",
                  backgroundColor: Colors.black,
                  colorText: Colors.white,);
            }
         }
            

       update();
   }
   bool existInCart(ProductModel product){
      if(_items.containsKey(product.id))
         {
            return true;
         }
      return false;
   }
   int getQuantity(ProductModel product){
      var quantity=0;
      if(_items.containsKey(product.id))
         {
            _items.forEach((key, value) {
               if(key==product.id)
                  {
                    quantity=value.quantity!;
                  }


            });
         }
      return quantity;

   }
   int get totalItems{
      var totalQuantity=0;
      _items.forEach((key, value) {
         totalQuantity+=value.quantity!;
      });
      return totalQuantity;
   }
   List<CartModel>get getItems{
      return _items.entries.map((e){
         return e.value;
      }).toList();
   }
   int get totalAmount
   {
      var total=0;
      _items.forEach((key, value) {
         total+=value.quantity!*value.price!;
      });


      return total;
   }

}