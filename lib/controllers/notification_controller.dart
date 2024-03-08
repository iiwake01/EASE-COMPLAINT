import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:flutter/material.dart';

class NotificationController extends BaseController {

  NotificationController(FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("NotificationController Constructor");
  }

  final FirestoreService _service;
  final FirebaseStorageService _storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("NotificationController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("NotificationController onClose");
    super.onClose();
  }
}