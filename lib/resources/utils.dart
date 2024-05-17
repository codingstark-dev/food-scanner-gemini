import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 2),
    bool? closePrevious,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    Widget? mainButton,
    EdgeInsets margin = const EdgeInsets.all(0.0),
  }) async {
    if (closePrevious ?? false) {
      await Get.closeCurrentSnackbar();
    }

    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: duration,
        animationDuration: const Duration(milliseconds: 300),
        snackPosition: snackPosition,
        margin: margin,
        snackStyle: SnackStyle.FLOATING,
        mainButton: mainButton ??
            TextButton(
              onPressed: () async {
                await Get.closeCurrentSnackbar();
              },
              child: const Text("Close"),
            ),
      ),
    );
  }

  static Color gradeColor(String grade) {
    switch (grade) {
      case 'a':
        return Colors.green;
      case 'b':
        return Colors.lightGreen;
      case 'c':
        return Colors.orange;
      case 'd':
        return Colors.deepOrange;
      case 'e':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
