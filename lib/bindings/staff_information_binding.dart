import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/staff_information_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class StaffInformationBinding extends BaseBinding {
  
  @override
  void dependencies() {
    Get.lazyPut<StaffInformationController> ( 
      () => StaffInformationController (
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
      )
    );
  }
}