import 'package:flutter/material.dart';
import 'home/card.dart';
import 'home/twoAvailable.dart';
class HomeDashboard extends StatelessWidget{
  HomeDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return SafeArea(child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
    child: Column(
      children: [
        Card1(),
          const SizedBox(height: 20),

        AvailableRequests()
      ],
    ),
  ));
  }
}