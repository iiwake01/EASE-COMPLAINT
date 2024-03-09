import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class ResidentsListController extends BaseController {

  ResidentsListController() {
    debugPrint("ResidentsListController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentsListController onClose");
    super.onClose();
  }
}