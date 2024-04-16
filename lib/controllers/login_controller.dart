import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  LoginController(
    this._auth,
    this._service,
  ) {
    debugPrint("LoginController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  PageController pageController = PageController(initialPage: 0);
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
    debugPrint("LoginController validateResidentCredential");
    //_launchResidentHomePage();
    isLoading(true);
    _auth.checkCredential(
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint(
            "LoginController validateResidentCredential credential ${userCredential.toString()}");
        debugPrint(
            "LoginController validateResidentCredential user ${userCredential.user}");
      },
      () async {
        if (await _service.getResident(_auth.getUser()?.uid) != null) {
          _launchResidentHomePage();
        } else {
          _auth.signOut();
          debugPrint(
              'LoginController validateResidentCredential user uid is not a Resident');
          onShowAlert("Error!",
              "Invalid Residential User, Please Login as a Resident User");
          isLoading(false);
        }
      },
      (exception) {
        debugPrint(
            'LoginController validateResidentCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Invalid Credential Please Try Again");
        isLoading(false);
      },
      () {},
    );
  }

  Future<void> validateStaffCredential() async {
    debugPrint("LoginController validateStaffCredential");
    //_launchStaffHomePage();
    isLoading(true);
    _auth.checkCredential(
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint(
            "LoginController validateStaffCredential credential ${userCredential.toString()}");
        debugPrint(
            "LoginController validateStaffCredential user ${userCredential.user}");
      },
      () async {
        if (await _service.getStaff(_auth.getUser()?.uid) != null) {
          _launchStaffHomePage();
        } else {
          _auth.signOut();
          debugPrint(
              'LoginController validateStaffCredential user uid is not a Resident}');
          onShowAlert(
              "Error!", "Invalid Staff User, Please Login as a Staff User");
          isLoading(false);
        }
      },
      (exception) {
        debugPrint(
            'LoginController validateStaffCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Invalid Credential Please Try Again");
        isLoading(false);
      },
      () {},
    );
  }

  Future<void> validateAdminCredential() async {
    debugPrint("LoginController validateAdminCredential");
    isLoading(true);
    _auth.checkCredential(
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint("LoginController validateAdminCredential credential ${userCredential.toString()}");
        debugPrint("LoginController validateAdminCredential user ${userCredential.user}");
      },
      () async {
        if (await _service.getAdmin(_auth.getUser()?.uid) != null) {
          onShowAlert("Success", "WELCOME");
          _launchAdminHomePage();
        } else {
          _auth.signOut();
          debugPrint('LoginController validateAdminCredential user uid is not a Resident}');
          onShowAlert("Error!", "Invalid Admin User, Please Login as a Admin User");
          isLoading(false);
        }
      },
      (exception) {
        debugPrint('LoginController validateAdminCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Invalid Credential Please Try Again");
        isLoading(false);
      },
      () {},
    );
  }

  void _launchResidentHomePage() {
    debugPrint("LoginController _launchResidentHomePage");
    Get.offAndToNamed(Routes.RESIDENTHOME);
  }

  void _launchStaffHomePage() {
    debugPrint("LoginController _launchStaffHomePage");
    Get.offAndToNamed(Routes.STAFFHOME);
  }

  void _launchAdminHomePage() {
    debugPrint("LoginController AdminHomePage");
    Get.offAndToNamed(Routes.ADMINHOME);
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