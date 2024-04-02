import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/resident_complaint_information_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ResidentsComplaintsFormBinding extends BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<ResidentsComplaintInformationController>(
      () => ResidentsComplaintInformationController(
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
      ),
    );
  }
}
