import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/resident_information_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ResidentsInformationBinding extends BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<ResidentsInformationController>(
      () => ResidentsInformationController(
        Get.find<FirebaseAuthService>(),
        Get.find<FirestoreService>(),
      ),
    );
  }
}
