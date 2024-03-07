import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class DashboardController extends BaseController {

  DashboardController() {
    debugPrint("DashboardController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("DashboardController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}