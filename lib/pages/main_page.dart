import 'package:flutter/material.dart';
import 'package:restaurant_app/misc/app_colors.dart';
import 'package:restaurant_app/pages/cart_page.dart';
import 'package:restaurant_app/pages/home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages =[
       HomePage(),
       CartPage(),
       Container(child: Center(child: Text("My favourite"),),),
       Container(child: Center(child: Text("My profile"),),),

  ];
  int currentIndex = 0 ;
  void onTap(int index){
    setState(() {
      currentIndex = index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        
        items: const [
            BottomNavigationBarItem(label:"Home",icon:Icon(Icons.apps)),
            BottomNavigationBarItem(label:"Cart",icon:Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(label:"Favourite",icon:Icon(Icons.favorite)),
            BottomNavigationBarItem(label:"My",icon:Icon(Icons.person)),
        ]
        ) ,
    );
  }
}