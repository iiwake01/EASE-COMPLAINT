import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  LoginController() {
    debugPrint("LoginController Constructor");
  }

  PageController pageController = new PageController(initialPage: 0);
  final RxBool isLoading = false.obs;
  TextEditingController? emailController, passwordController;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("LoginController onInit");
    pageController.addListener(() {
      debugPrint("pageController Listener");
      emailController = TextEditingController();
      passwordController = TextEditingController();
    });
  }

  void launchLoginResident() {
    debugPrint("LoginController launchLoginResident");
    pageController.jumpToPage(1);
  }

  void launchLoginStaff() {
    debugPrint("LoginController launchLoginStaff");
    pageController.jumpToPage(2);
  }

  Future<void> validateCredential() async {
    debugPrint("LoginController validateCredential");
    if(true) {
      _launchDashboard();
    } else {
      debugPrint('LoginController Invalid Credential');
      onShowAlert("Error!", "Invalid Credential!");
    }
  }

  void _launchDashboard() {
    debugPrint("LoginController launchLoginStaff");
    Get.offAndToNamed(Routes.DASHBOARD);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}