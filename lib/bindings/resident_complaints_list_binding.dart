import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/resident_complaints_list_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class ResidentComplaintsListBinding extends BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<ResidentComplaintsListController>(
      () => ResidentComplaintsListController(
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
      )
    );
  }
}