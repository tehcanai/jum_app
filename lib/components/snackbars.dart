import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static std(String title, String message) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(20));
  }
}
