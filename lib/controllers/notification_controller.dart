import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:flutter/material.dart';

class NotificationController extends BaseController {

  NotificationController(this._auth, this._service, this._storage) {
    debugPrint("NotificationController Constructor");
  }

  final FirebaseAuthService _auth;
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