import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:flutter/material.dart';

class ProfileController extends BaseController {

  ProfileController(FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirestoreService _service;
  final FirebaseStorageService _storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ProfileController onInit");
  }
  
  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}