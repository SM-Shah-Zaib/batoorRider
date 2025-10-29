import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
// import 'view/registerCards.dart';
class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => LoginView()); // Navigates and removes SplashScreen from stack
    });
    // TODO: implement build
    return Scaffold(
body: Center(
  child: Image.asset("assets/images/splash.png",
              fit: BoxFit.cover,
  height: Get.height*1,
  width: Get.width*1,
  ),
),
    );
  }
}