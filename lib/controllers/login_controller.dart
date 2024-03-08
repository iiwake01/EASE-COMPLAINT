import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  LoginController(FirebaseAuthService this._auth,) {
    debugPrint("LoginController Constructor");
  }

  final FirebaseAuthService _auth;
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

  Future<void> validateResidentCredential() async {
    debugPrint("LoginController validateCredential");
    _launchResidentHomePage();
    /*
    isLoading(true);
    _auth.checkCredential (
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint("LoginController validateCredential credential ${userCredential.toString()}");
        debugPrint("LoginController validateCredential user ${userCredential.user}");
      }, 
      () {
        _launchResidentHomePage();
      }, 
      (exception) {
        debugPrint('LoginController validateCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Invalid Credential Please Try Again");
      },
      () {
        isLoading(false);
      },
    );
    */
  }

  Future<void> validateStaffCredential() async {
    debugPrint("LoginController validateCredential");
    _launchStaffHomePage();
    /*
    isLoading(true);
    _auth.checkCredential (
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint("LoginController validateCredential credential ${userCredential.toString()}");
        debugPrint("LoginController validateCredential user ${userCredential.user}");
      }, 
      () {
        _launchStaffHomePage();
      }, 
      (exception) {
        debugPrint('LoginController validateCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Invalid Credential Please Try Again");
      },
      () {
        isLoading(false);
      },
    );
    */
  }

  void _launchResidentHomePage() {
    debugPrint("LoginController _launchResidentHomePage");
    Get.offAndToNamed(Routes.RESIDENTHOME);
  }

  void _launchStaffHomePage() {
    debugPrint("LoginController _launchStaffHomePage");
    Get.offAndToNamed(Routes.STAFFHOME);
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