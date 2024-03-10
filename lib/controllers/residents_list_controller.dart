import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:flutter/foundation.dart';

class ResidentsListController extends BaseController {

  ResidentsListController(FirestoreService this._service,) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirestoreService _service;

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