import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurant_app/misc/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

late Animation<double> animation ;
late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image(image: AssetImage("images/logo.png"),
            width: 150,
            ),
            SizedBox(
              height: 150,
            ),
            SpinKitFadingCube(
                  color: AppColors.mainColor,
                  size: 30.0,
                  
                )

          ],
        ),
      ),
    );
  }
}