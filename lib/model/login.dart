import 'package:get/get.dart';

class LoginModel {
  final String email;
  final String password;
  RxBool status = false.obs;

  LoginModel({
    required this.email,
    required this.password,
  });
}
