import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/main_controller.dart';
import 'package:nutrition_app/resources/auth_methods.dart';
import 'package:nutrition_app/resources/utils.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    _authenticate(true);
  }

  void register() {
    _authenticate(false);
  }

  void _authenticate(bool isLogin) async {
    try {
      final UserCredential user;
      if (isLogin) {
        user = await AuthMethods().loginUser(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        user = await AuthMethods().registerUser(
          email: emailController.text,
          password: passwordController.text,
        );
      }

      Get.find<MainController>().setUser = user.user;
      Utils.showSnackBar(
        isLogin ? 'Login successful' : 'Registration successful',
        closePrevious: true,
      );
    } catch (e) {
      Utils.showSnackBar(e.toString().substring(e.toString().indexOf(']') + 1));
    }
  }
}
