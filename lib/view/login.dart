import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/loginController.dart';
import '../../constants/appColors.dart';
// import 'CreateLogin.dart';
// import 'ForgetPasswordView.dart';

// import '../view/signup_view.dart'; // Uncomment when you have this view

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(child: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:SingleChildScrollView(
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: Get.height*0.3,),
           Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Login",
    style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
),


              SizedBox(height: 20),

              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  // border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  // border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Get.to((()=>ForgetPasswordView()));
                    // TODO: Add forget password navigation
                  },
                  child: Text(
                    "Forget password?",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),

              SizedBox(height: 10),

              controller.isLoading.value
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.loginUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Rounded corners
      ),
                        ),
                        child: Text("Login"),
                      ),
                    ),

              SizedBox(height: 30),

              // 🔹 OR Divider
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              SizedBox(height: 20),

              // 🔹 Social Login Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icons/google.png',
                    height: 32,
                    width: 32,
                  ),
                  SizedBox(width:25),
                  Image.asset(
                    'assets/images/icons/facebook.png',
                    height: 32,
                    width: 32,
                  ),
                ],
              ),

              SizedBox(height: 20),

              // 🔹 Create Account Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // TODO: Replace with your actual Signup screen
                      // Get.to(()=>CreateLogin());
                    },
                    child: Text("Create One", style: TextStyle(
                      color: AppColors.primary
                    ),),
                  ),
                ],
              ),
              SizedBox(height: Get.height*0.1,)
            ],
          ),
          )
        );
      }),),
    );
  }
}
