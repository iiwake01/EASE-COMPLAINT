import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class StaffComplaintsListController extends BaseController {

  StaffComplaintsListController() {
    debugPrint("StaffComplaintsListController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("StaffComplaintsListController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("StaffComplaintsListController onClose");
    super.onClose();
  }
}