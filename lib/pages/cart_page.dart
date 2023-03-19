import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/Controller/cart_controller.dart';
import 'package:restaurant_app/Controller/product_controller.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/utils/app_constants.dart';
import 'package:restaurant_app/widgets/app_latge_text.dart';
import 'package:restaurant_app/widgets/app_text.dart';
import 'package:restaurant_app/widgets/icon_detail_page.dart';
import 'package:get/get.dart';
import '../misc/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 236, 232, 232),
      body: Container(
         
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                    onTap: (){
                    Get.back();
                  },
                     child: Container(
                                     width: 45,
                                     height: 45,
                                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: AppColors.mainColor)
                                     ),
                                     child: const Center(child: Icon(Icons.arrow_back_ios)),
                                   ),
                   ),
                
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: AppColors.mainColor)
                    ),
                    child: const Center(child: Icon(Icons.home)),
                  ),
                ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              
              height: 485,
              width: double.maxFinite,
              //controller is heeeeeeere
              //controller is heeeeeeere
              //controller is heeeeeeere
              //controller is heeeeeeere
              child: GetBuilder<CartController>(builder: (cartController){

                var _cartList = cartController.getItems;
                return ListView.builder(
                itemCount: _cartList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 100,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            var pageId = Get.find<ProductController>().productList.indexOf(_cartList[index].product);
                            Get.toNamed(RouteHelper.getProductDetail(pageId));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image:  DecorationImage(
                                image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URL+cartController.getItems[index].img!),
                                 fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                AppText(text:cartController.getItems[index].name! ,size: 20,overflow: TextOverflow.ellipsis,isBold: true,),
                                // AppLargeText(text: cartController.getItems[index].name!,color: Colors.black,size: 20,overflow: true,),
                                const SizedBox(height: 5,),
                                AppText(text: "pizza with chicken and cheese"),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 234,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppLargeText(text: "\$"+cartController.getItems[index].price!.toString(),color: AppColors.mainColor,size: 20),
                                      Row(
                                        children: [
                                          IconDetailPage(icon: Icons.remove_shopping_cart,size: 30,iconColor: Colors.white,backgroundColor: AppColors.mainColor,),
                                          SizedBox(width: 20,),
                                          GestureDetector(
                                            onTap: () {
                                              cartController.addItem(_cartList[index].product!, (_cartList[index].quantity! - 1));
                                            },
                                            child: IconDetailPage(icon:Icons.remove,size: 30,)),
                                          const SizedBox(width: 10,),
                                          Text(_cartList[index].quantity.toString()),
                                          const SizedBox(width: 10,),
                                          GestureDetector(
                                            onTap: () {
                                              cartController.addItem(_cartList[index].product!, (_cartList[index].quantity! + 1));
                                            },
                                            child: IconDetailPage(icon:Icons.add,size: 30,)),
                                        ],
                                      )
                        
                        
                                    ],
                                  ),
                                )
                        
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                
              );
              })
            ),
            SizedBox(height: 10,),
            Container(
              width: double.maxFinite,
              height: 45,
              child: Column(
                children: [ 
                  Container(
                        height: 20,
                        width: double.maxFinite,
                        child: Row(
                            children: List.generate(100, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                              :Colors.black,
                              height: 2,
                            ),
                            )),
                          ),
                      ),
                      Row(
                        
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: "Sub Total", size: 20,color: AppColors.mainColor,),
                            AppLargeText(text: Get.find<CartController>().getTotalAmount.toString(), size: 20,color: AppColors.mainColor,),
                          ],
                          
                        ),
                ],
              ),
            ),
            SizedBox(height: 14,),
            Container(
               height:60,
               width: double.maxFinite,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: AppColors.mainColor
               ),
               child: Center(child: AppLargeText(text: "Order Now",color: Colors.white,size: 20,)),
             )
          ]
        ),
      ),
    );
  }
}