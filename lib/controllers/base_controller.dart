import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  

  @protected
  void onShowAlert(String title, String message) {
    Timer (
      const Duration(milliseconds: 1000), ( () => Get.snackbar(title, message) )
    );
  }


}