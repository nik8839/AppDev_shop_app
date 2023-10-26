import 'package:shop_app/models/product_models.dart';

class CartModel {
  int? id;
  String? name;

  int? price;

  String? img;
  int ?quantity;
  bool ? isExist;
  String?time;
  ProductModel? product;

  CartModel(
      {this.id,
        this.name,
         this.quantity,
        this.price,
        this.isExist,
        this.img,
        this.time,
        this.product,
       });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
     quantity=json['quantity'];
    price = json['price'];
    isExist=json['isexist'];
    time=json['time'];

    img = json['img'];
    product=ProductModel.fromJson(json['product']);


  }


}