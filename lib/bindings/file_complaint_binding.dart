import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/file_complaint_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:get/get.dart';

class FileComplaintBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<FileComplaintController> ( 
      () => FileComplaintController (
        Get.find<FirebaseAuthService>(),
      )
    );
  }
}