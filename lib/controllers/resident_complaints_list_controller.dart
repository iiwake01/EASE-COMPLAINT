import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class ResidentComplaintsListController extends BaseController {

  ResidentComplaintsListController() {
    debugPrint("ResidentComplaintsListController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentComplaintsListController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentComplaintsListController onClose");
    super.onClose();
  }
}