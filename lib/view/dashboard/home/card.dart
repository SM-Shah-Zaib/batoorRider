import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Card1 extends StatelessWidget{
  Card1({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset('assets/images/card.png', 
      width: Get.width*1,
      fit: BoxFit.cover,),
    );
    throw UnimplementedError();
  }
}