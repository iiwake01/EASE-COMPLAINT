import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/login_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<LoginController> (
      () => LoginController (
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
      )
    );
  }
}