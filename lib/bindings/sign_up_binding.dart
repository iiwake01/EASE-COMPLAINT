import 'package:app/bindings/base_binding.dart';
import 'package:app/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<SignUpController> ( 
      () => SignUpController (
      
      )
    );
  }
}