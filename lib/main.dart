import 'package:batoorrider/controller/orderController.dart';
import 'package:batoorrider/view/dashboard.dart';
import 'package:batoorrider/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(OrderController()); // ✅ only here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batoor Rider',
      home: SplashScreen(),
    );
  }
}
