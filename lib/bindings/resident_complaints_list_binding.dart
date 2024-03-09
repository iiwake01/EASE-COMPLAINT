import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/resident_complaints_list_controller.dart';
import 'package:get/get.dart';

class ResidentComplaintsListBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ResidentComplaintsListController> ( 
      () => ResidentComplaintsListController (
      
      )
    );
  }
}