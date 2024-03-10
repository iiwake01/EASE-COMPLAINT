import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class StaffComplaintsListBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<StaffComplaintsListController> ( 
      () => StaffComplaintsListController (
        Get.find<FirestoreService>(),
      )
    );
  }
}