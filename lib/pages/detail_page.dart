import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/Controller/cart_controller.dart';
import 'package:restaurant_app/Controller/product_controller.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/utils/app_constants.dart';
import 'package:restaurant_app/widgets/app_icon.dart';
import 'package:restaurant_app/widgets/app_text.dart';
import 'package:restaurant_app/widgets/icon_detail_page.dart';

import '../misc/app_colors.dart';
import '../widgets/app_latge_text.dart';
import '../widgets/expandble_text.dart';

class DetailPage extends StatefulWidget {
  int pageId;
  DetailPage({super.key,required this.pageId}) {
    
  }

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var detailProduct  = Get.find<ProductController>().productList[widget.pageId];
    Get.find<ProductController>().initProduct(detailProduct,Get.find<CartController>());
    print("page id is ${widget.pageId}");
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 450,
                width: double.maxFinite,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URL+detailProduct.img),
                    fit: BoxFit.cover

                  )
                ),
               )
              ),
              Positioned(
                top: 60,
                left: 25,
                child: GestureDetector(
                  onTap: (() => Get.back()),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                      border: Border.all(color: AppColors.mainColor)
                    ),
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                  ),
                )
              ),
              Positioned(
                top: 60,
                right: 25,
                
                  child: GetBuilder<ProductController>(builder: ((controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.cartPage);
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                              border: Border.all(color: AppColors.mainColor)
                            ),
                            child: const Center(child: Icon(Icons.shopping_cart)),
                          ),
                        ),
                        Get.find<ProductController>().totalItems >= 1 ? 
                        Positioned(
                          right: 1,
                          top: 1,
                          child:CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.mainColor,
                            child: Center(
                              child: AppLargeText(text:Get.find<ProductController>().totalItems.toString(),size: 10,color: Colors.white, ),
                            ),

                          )
                          ):Container(),
                          
                      ],
                    );
                  })),
                
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,

                child: GetBuilder<ProductController>(builder: (productController){
                  return Container(
                  
                  width:double.maxFinite,
                  height: 400,
                  padding: const EdgeInsets.only(top:30,left: 20,right: 20,bottom: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    ),
                    color: Color.fromARGB(255, 236, 232, 232)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: detailProduct.name,size: 25,color: Colors.black,),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                         GestureDetector(
                          onTap: (() {
                            productController.setQuantity(false);
                          }),
                          child: IconDetailPage(icon: Icons.remove)),
                         const SizedBox(width: 12,),
                               Text(productController.inCartIthems.toString()),
                         const SizedBox(width: 12,),
                         GestureDetector(
                          onTap: (() {
                            productController.setQuantity(true);
                          }),
                          child: IconDetailPage(icon: Icons.add)),
                         Expanded(child: Container()),
                         AppLargeText(text: "\$${detailProduct.price}",size: 25,color:  AppColors.mainColor,)
                        ],
                      ),
                      const SizedBox(height:15 ,),
                      AppLargeText(text:  "Description",size: 20,),
                      const SizedBox(height:10),
                       Container(
                        height: 190,
                        child: SingleChildScrollView(child: ExpndbleText(text:detailProduct.description,))),
                      const SizedBox(height: 20,),
                      
                        
                    ],

                  ),
                );
                }),

                
              ),
               Positioned(
                left: 260,
                right: 20,
                bottom:375,
                child: CircleAvatar(
                 
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite,color: AppColors.mainColor,),
                )
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  
                  child: GetBuilder<ProductController>(builder: (productController){
                    return GestureDetector(
                      onTap: (() {
                        productController.addItem(detailProduct);
                      }),
                      child: Container(
                          
                            height:50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainColor
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.shopping_cart,color: Colors.white,),
                                const SizedBox(width: 5,),
                                AppLargeText(text: "Add to cart",color: Colors.white,size: 20,)
                                
                              ],
                            ),
                          ),
                    );
                  },)
                )
          ],

          )
        ),
      );
    
  }
}