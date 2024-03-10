import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/dashboard_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:get/get.dart';

class DashboardBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<DashboardController> ( 
      () => DashboardController (
        Get.find<FirestoreService>(),
      )
    );
  }
}