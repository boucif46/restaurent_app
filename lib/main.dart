import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/product_controller.dart';
import 'package:restaurant_app/pages/cart_page.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/main_page.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/splash/splash_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductList();
    return  GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     
      home: MainPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

