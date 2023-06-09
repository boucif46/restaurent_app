import'package:get/get.dart' ;
import 'package:restaurant_app/models/product_model.dart';

import '../data/api/repository/cart_repo.dart';
import '../models/cart_model.dart';
class CartController extends GetxController {

  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  
  Map<int , CartModel> _items ={};
  Map<int , CartModel> get items => _items ;
  void addItem(ProductModel product,int quantity){
       var  newQuantity = 0 ;

      if(_items.containsKey(product.id)){

        _items.update(product.id!, (value) {
         
          print('product '+product.name!+' updated') ;

          newQuantity =((value.quantity! + value.quantity!) > value.quantity!+ quantity) ? value.quantity! -   (value.quantity! - quantity)
                                                                                       : value.quantity! - (value.quantity! - quantity) ;
          return CartModel(
            id :value.id,      
            name:value.name,    
            price:value.price,   
            img:value.img,     
            quantity:((value.quantity! + value.quantity!) > value.quantity!+ quantity) ? value.quantity! -   (value.quantity! - quantity)
                                                                                       : value.quantity! - (value.quantity! - quantity),
            isExist:true,
            time: DateTime.now().toString(),
            product: product
            ); 
        });
        if(newQuantity == 0){
            _items.remove(product.id);
          }
      }else{
            _items.putIfAbsent(product.id!, () {
          return CartModel(
            id :product.id,      
            name:product.name,    
            price:product.price,   
            img:product.img,     
            quantity:quantity,
            isExist:true,
            time: DateTime.now().toString(), 
            product: product   
          );});
      }
     
    update();
  }
  
 

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false ;
  }

   int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity =  value.quantity!;
        }
      });
    }
    return quantity ;
  }
  
    int get totalItems{
      var totalQuantity = 0 ;
      _items.forEach((key, value) {
        totalQuantity += value.quantity! ;
      });
      return totalQuantity ;
    }

    List<CartModel> get getItems{
      return _items.entries.map((e) {
        return e.value; 
      }).toList();
    }

    int get getTotalAmount{
      var totalAmount = 0 ;
      _items.forEach((key, value) {
        totalAmount += value.quantity! * value.price! ;
       });
       //update();
       return totalAmount ;  
    }
    
}