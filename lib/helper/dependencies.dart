import 'package:get/get.dart';
import 'package:restaurant_app/Controller/product_controller.dart';

import 'package:restaurant_app/data/api/api_client.dart';
import 'package:restaurant_app/data/api/repository/cart_repo.dart';
import 'package:restaurant_app/data/api/repository/product_repo.dart';
import 'package:restaurant_app/utils/app_constants.dart';

import '../Controller/cart_controller.dart';

Future<void> init() async{
//api client 
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL ));
  
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  
  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}