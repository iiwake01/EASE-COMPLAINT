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
    try {
      isLoading(true);
      /*
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword (
        email: emailController?.text ?? "", 
        password: passwordController?.text ?? ""
      );
      debugPrint("LoginController validateCredential credential ${credential.toString()}");
      debugPrint("LoginController validateCredential user ${credential.user}");
      */
      _launchDashboard();
    } catch (exception) {
      debugPrint('LoginController validateCredential exception ${exception.toString()}}');
      onShowAlert("Error!", "Invalid Credential Please Try Again");
    } finally {
      isLoading(false);
    }
  }

  void _launchDashboard() {
    debugPrint("LoginController launchLoginStaff");
    Get.offAndToNamed(Routes.DASHBOARD);
  }

  void launchSignUp() {
    Get.toNamed(Routes.SIGNUP);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}