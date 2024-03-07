import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  LoginController() {
    debugPrint("LoginController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("LoginController _launchLogin");
  }

  void _launchLoginResident() {
    debugPrint("LoginController _launchLoginResident");
    Get.toNamed(Routes.LOGINRESIDENT);
  }

  void _launchLoginStaff() {
    debugPrint("LoginController _launchLoginStaff");
    Get.toNamed(Routes.LOGINSTAFF);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}