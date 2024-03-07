import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  LoginController() {
    debugPrint("LoginController Constructor");
  }

  PageController pageController = new PageController(initialPage: 0);

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("LoginController onInit");
    pageController.addListener(() {

    });
  }

  void launchLoginResident() {
    debugPrint("LoginController launchLoginResident");
    Get.toNamed(Routes.LOGINRESIDENT);
    pageController.jumpToPage(1);
  }

  void launchLoginStaff() {
    debugPrint("LoginController launchLoginStaff");
    pageController.jumpToPage(2);
  }

  void _launchDashboard() {
    debugPrint("LoginController launchLoginStaff");
    Get.toNamed(Routes.DASHBOARD);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}