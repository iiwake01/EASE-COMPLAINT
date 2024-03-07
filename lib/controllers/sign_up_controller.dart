import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {

  SignUpController() {
    debugPrint("SignUpController Constructor");
  }

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
    try {
      debugPrint('SignUpController registerCredential: ${emailController?.text} ${passwordController?.text}');
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword (
        email: emailController?.text ?? "",
        password: passwordController?.text ?? "",
      );
      User? user = userCredential.user;
      debugPrint('SignUpController User registered: ${user!.uid}');
      Get.offAndToNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (exception) {
      debugPrint('SignUpController registerCredential FirebaseAuthException ${exception.toString()}}');
      if (exception.code == 'weak-password') {
        onShowAlert("Error!", 'The password provided is too weak.');
      } else if (exception.code == 'email-already-in-use') {
        onShowAlert("Error!", 'The account already exists for that email.');
      }
    } catch (exception) {
      debugPrint('SignUpController registerCredential exception ${exception.toString()}}');
      onShowAlert("Error!", "Register failed Please Try Again");
    }
    */
  }
  
  @override
  void onClose() {
    debugPrint("SignUpController onClose");
    super.onClose();
  }
}