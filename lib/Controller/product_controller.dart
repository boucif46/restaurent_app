import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/api/repository/product_repo.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/models/cart_model.dart';
import 'package:restaurant_app/models/product_model.dart';

import 'cart_controller.dart';
class ProductController extends GetxController{
  final ProductRepo productRepo ;
  ProductController({required this.productRepo});
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList ;
  late CartController _cart ;
  bool _isLoaded = false ;
  bool get isLoaded =>_isLoaded ;

  int _quantity = 0;
  int get quantity => _quantity ;
   
  int _inCartIthems = 0;
  int get inCartIthems => _inCartIthems + _quantity ;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList() ;
    if(response.statusCode == 200){
      
      print("products got");
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true ;
      update();
    }else{
      
    }
  }


  void setQuantity(bool isIncremente){
    if(isIncremente){
      _quantity =checkQuantity(_quantity + 1) ;
    }else if(isIncremente == false){
      _quantity =checkQuantity(_quantity - 1) ;
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item count", "You can't reduce more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Item count", "You can't add more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,);
      return 20;
    }else{
      return quantity;
    }

    
  }
  void initProduct( ProductModel product,CartController cart){
    _quantity = 0 ;
    _inCartIthems = 0;
    _cart = cart ; 
    var exist =false ;
    exist = _cart.existInCart(product);
    print('exist or not ${exist}');
    if(exist){
      _quantity = _cart.getQuantity(product);

    }
    print('the quantity in the cart is ${_quantity}');
  }
 
 
  void addItem(ProductModel product){
    if(_quantity > 0 ){
    _cart.addItem(product, _quantity);
    _cart.items.forEach((key, value) {
      print('the id is '+value.id.toString()+" The Quantity is "+value.quantity.toString());
    });
    }else{
      Get.snackbar("Quantity", "quantity is 0 !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
    }
    update();
  }

  int get totalItems{
    return _cart.totalItems ;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }


}