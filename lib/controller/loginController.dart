import 'package:batoorrider/view/dashboard.dart';

import '../constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/login.dart';
// import '../view/homeView.dart';
class LoginController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable Login model
  late Rx<LoginModel> login;

  // Track loading state (for API)
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    login = LoginModel(email: '', password: '').obs;
  }

  // Method to check login (you can replace this with actual API call)
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Update login model
    login.value = LoginModel(email: email, password: password);

    // Show loading state
    isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 2));

      // TODO: Replace this with actual API logic
      if (email == "" && password == "") {
        login.value.status.value = true;
        Get.to(Dashboard());
        Get.snackbar("Success", "Login Successful", snackStyle: SnackStyle.FLOATING,
  backgroundColor: AppColors.primary,
  colorText: Colors.white,);
      } else {
        login.value.status.value = false;
        Get.snackbar("Error", "Invalid credentials",  snackStyle: SnackStyle.FLOATING,
  backgroundColor: AppColors.primary,
  colorText: Colors.white,);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong",   snackStyle: SnackStyle.FLOATING,
  backgroundColor: AppColors.primary,
  colorText: Colors.white,);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

