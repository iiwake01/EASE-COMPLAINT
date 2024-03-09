import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/residents_list_binding.dart';
import 'package:get/get.dart';

class ResidentsListBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ResidentsListController> ( 
      () => ResidentsListController (
      
      )
    );
  }
}