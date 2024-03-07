import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {

  SignUpController(FirebaseAuthService this._auth,) {
    debugPrint("SignUpController Constructor");
  }

  final FirebaseAuthService _auth;
  TextEditingController? emailController, passwordController;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("SignUpController onInit");
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> createAccount() async {
    debugPrint("SignUpController createAccount");
    /*
    _auth.registerCredential(
      emailController?.text ?? "", 
      passwordController?.text ?? "", 
      (userCredential) => debugPrint('SignUpController UserCredential $userCredential'), 
      (user) => debugPrint('SignUpController User Id ${user!.uid} registered: ${user} '), 
      () => _launchLogin(), 
      (firebaseAuthException) {
        debugPrint('SignUpController createAccount FirebaseAuthException ${firebaseAuthException.toString()}}');
        if (firebaseAuthException.code == 'weak-password') {
          onShowAlert("Error!", 'The password provided is too weak.');
        } else if (firebaseAuthException.code == 'email-already-in-use') {
          onShowAlert("Error!", 'The account already exists for that email.');
        }
      }, 
      (exception) {
        debugPrint('SignUpController registerCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      },
    );
    */
  }

  void _launchLogin() {
    debugPrint("LoginController launchLoginStaff");
    Get.offAndToNamed(Routes.LOGIN);
  }
  
  @override
  void onClose() {
    debugPrint("SignUpController onClose");
    super.onClose();
  }
}