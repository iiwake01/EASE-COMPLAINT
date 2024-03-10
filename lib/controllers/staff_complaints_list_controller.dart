import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:flutter/foundation.dart';

class StaffComplaintsListController extends BaseController {

  StaffComplaintsListController(FirestoreService this._service,) {
    debugPrint("StaffComplaintsListController Constructor");
  }

  final FirestoreService _service;

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