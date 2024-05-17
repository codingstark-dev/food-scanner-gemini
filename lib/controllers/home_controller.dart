import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/main_controller.dart';
import 'package:nutrition_app/models/stored_product.dart';
import 'package:nutrition_app/resources/auth_methods.dart';
import 'package:nutrition_app/resources/utils.dart';

class HomeController extends GetxController {
  List<StoredProduct> storedProducts = [];

  void logout() {
    storedProducts = [];

    AuthMethods().logout();
    Get.find<MainController>().setUser = null;
    Utils.showSnackBar('Logout successful', closePrevious: true);
    //Get.offAll(() => LoginPage());
  }

  void infoApp() {
    Get.defaultDialog(
      title: 'Food Scanner App',
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('App by CodingStark: @github.com/codingstark-dev'),
        ],
      ),
      textCancel: 'close',
    );
  }
}
