import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<LoginController> ( 
      () => LoginController (
      
      )
    );
  }
}