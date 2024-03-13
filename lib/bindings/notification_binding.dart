import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/notification_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class NotificationBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<NotificationController> ( 
      () => NotificationController (
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
        Get.find<FirebaseStorageService>(),
      )
    );
  }
}