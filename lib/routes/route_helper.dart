import 'package:get/get.dart';
import 'package:restaurant_app/pages/home_page.dart';

import '../pages/cart_page.dart';
import '../pages/detail_page.dart';
class RouteHelper{
  static const String initial = "/";
  static const String foodDetail  = "/food-detail";
  static const String cartPage = "/cart-page";

  static String getInitial() => '$initial';
  static String getProductDetail(int pageId) => '$foodDetail?pageId=$pageId'; 
  static String getCart() =>'$cartPage';

  static List<GetPage> routes = [

    GetPage(name:initial , page:(() => HomePage()),transition: Transition.fadeIn),
    GetPage(name: foodDetail , page :((){
      int pageId = int.parse(Get.parameters['pageId']!);
      return DetailPage( pageId: pageId);
    }),transition: Transition.fadeIn),
    GetPage(name: cartPage , page :((){
      
      return const CartPage( );
    }),transition: Transition.fadeIn),


  ];
}