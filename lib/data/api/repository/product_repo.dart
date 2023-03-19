// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:restaurant_app/data/api/api_client.dart';
import 'package:restaurant_app/utils/app_constants.dart';



class ProductRepo  extends GetxService{
 final ApiClient apiClient ;

  ProductRepo({required this.apiClient}); 

 Future<Response> getProductList() async{
  //end point 
   return await apiClient.getData(AppConstants.PRODUCT_URI);
 }
}