import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

class FileComplaintController extends BaseController {

  FileComplaintController() {
    debugPrint("FileComplaintController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("FileComplaintController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("FileComplaintController onClose");
    super.onClose();
  }
}