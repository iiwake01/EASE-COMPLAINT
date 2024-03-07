import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/sign_up_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:get/get.dart';

class SignUpBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<SignUpController> ( 
      () => SignUpController (
        Get.find<FirebaseAuthService>(),
      )
    );
  }
}