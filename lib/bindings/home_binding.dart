import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<HomedController> ( 
      () => HomedController (
      
      )
    );
  }
}