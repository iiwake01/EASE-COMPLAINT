import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends BaseController {

  SignUpController() {
    debugPrint("SignUpController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("SignUpController onInit");
  }

  void createAccount() {
    debugPrint("SignUpController createAccount");
    
  }
  
  @override
  void onClose() {
    debugPrint("SignUpController onClose");
    super.onClose();
  }
}