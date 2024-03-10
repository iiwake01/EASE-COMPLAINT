import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class ResidentsListBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ResidentsListController> ( 
      () => ResidentsListController (
        Get.find<FirestoreService>(),
      )
    );
  }
}