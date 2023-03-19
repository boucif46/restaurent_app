import 'package:flutter/material.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/models/product_model.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/utils/app_constants.dart';
import 'package:restaurant_app/widgets/app_icon.dart';
import 'package:restaurant_app/widgets/app_latge_text.dart';
import 'package:get/get.dart' ;
import '../Controller/product_controller.dart';
import '../widgets/app_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

     
  @override
  Widget build(BuildContext context) {
       TabController _tabController = TabController(length:5 ,vsync: this);
       List images =[
          "burger-1.jpg",
          "burger-2.jpg",
          "burger-3.jpg",
          "pizza-1.jpg",
          "pizza-2.jpg",
          "pizza-3.jpg",
          "pizza-4.jpg",
       ];
    return Scaffold(
      
          backgroundColor: Colors.white,
          body: SizedBox(
            
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children:[
                Opacity(opacity: 0.9,
            child: ClipPath(
              clipper: WaveClipper() ,
              child: Container(
                color: AppColors.mainColor,
                height: 230,
              ),
            ),
            ),
            Opacity(opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper() ,
              child: Container(
                color: AppColors.mainColor,
                height: 220,
              ),
            ),
            ),
          
            //top icons
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: 50,
                  margin:  const EdgeInsets.only(top: 40,left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.menu_open_rounded,size: 35,color: Colors.white,),
                      Icon(Icons.search,size: 35,color: Colors.white,),
                      Icon(Icons.shopping_cart,size: 35,color: Colors.white,)
                    ], 
                  ),
                )
              ),
              //hello and what's fo....
              Positioned(
                top: 90,
                left: 0,
                right: 0,

                child: Container(
                  height: 100,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 20,right: 20),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Hello!",isBold:true,color: Colors.white,),
                      const SizedBox(height: 5,),
                      AppLargeText(text: "What's for dinner today ?",isBold: false,color: Colors.white,)
                    ],
                  ),
                ),
                ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        
                 // margin: EdgeInsets.only(left: 10,right: 10),
                      child:  Align(
                      alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelPadding:  const EdgeInsets.all(10),
                          controller: _tabController,
                          labelColor:Colors.black ,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorWeight: 2.0,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.pink,
                          
                          tabs:  [
                              AppIcon(isIcon :false,image: "all-food-icon.png",size: 60,text: "All Food",backgroundColor: Colors.transparent,),
                              AppIcon(isIcon :false,image: "pizza-icon.png",size: 60,text: "Pizza",backgroundColor: Colors.transparent),
                              AppIcon(isIcon :false,image: "burger-icon.png",size: 60,text: "Burger",backgroundColor: Colors.transparent),
                              AppIcon(isIcon :false,image: "sandwich-icon.png",size: 60,text: "Sandwich",backgroundColor: Colors.transparent),
                              AppIcon(isIcon :false,image: "dessert-icon.png",size: 60,text: "Dessert",backgroundColor: Colors.transparent),
                            
                                  ]
                              ),
                            )
                      ),
                      Container(
                          
                          height: 465,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: 20,right: 20),
                          decoration:  const BoxDecoration(
                          color:Colors.white,
                          
                          ),
                          child:  TabBarView(
                            controller: _tabController,
                            children: [
                              //Controooooollleeeer heeeeeeeere |||||||
                              //Controooooollleeeer heeeeeeeere vvvvvvv
                              //Controooooollleeeer heeeeeeeere
                              GetBuilder<ProductController>(builder: (product) {
                                return product.isLoaded?GridView.builder(
                                gridDelegate:   const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1/1.4
                                  ),
                        
                                itemCount: product.productList.length,
                                scrollDirection: Axis.vertical,
                                
                                itemBuilder: (BuildContext context,int index){
                                    return  GestureDetector(
                                      onTap: (() {
                                        Get.toNamed(RouteHelper.getProductDetail(index));
                                      }),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URL+product.productList[index].img!),
                                              fit: BoxFit.cover
                                                  )
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                              Container(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AppText(text:product.productList[index].name ,size:15,),
                                                    Row(
                                                      
                                                      children:  [
                                                        const Icon(Icons.star_outline_outlined),
                                                        
                                                        Text("(${product.productList[index].stars})"),
                                                        const Text((' . ')),
                                                        Text("Price \$ ${product.productList[index].price}")
                                                    
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                    );  
                                }, 
                                
                                ):Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
                              },),
                              const Center(child: Text("pizza")),
                              const Center(child: Text("burger")),
                              const Center(child: Text("sandwich")),
                              const Center(child: Text("dessert")),
                        
                            
                            ]
                          ),
                    ),

                    ],
                  )),

          ]
        ),
      ),
    );
  }
}



class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   debugPrint(size.width.toString());
   // ignore: unnecessary_new
  var path = new Path();
  
  path.lineTo(0,size.height);//start path 
  var start = Offset(size.width/5, size.height);
  var end = Offset(size.width/2.5, size.height-50);
  path.quadraticBezierTo(start.dx, start.dy, end.dx, end.dy);
  var secondStart = Offset(size.width-(size.width/3.24), size.height-105);
  var SecondEnd = Offset(size.width, size.height-10);
  path.quadraticBezierTo(secondStart.dx, secondStart.dy,
   SecondEnd.dx, SecondEnd.dy);
  path.lineTo(size.width,0);
  path.close();
  return path;
    
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
 
}