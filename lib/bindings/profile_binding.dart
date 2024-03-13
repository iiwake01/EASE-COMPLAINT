import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/profile_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class ProfileBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ProfileController> ( 
      () => ProfileController (
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
        Get.find<FirebaseStorageService>(),
      )
    );
  }
}