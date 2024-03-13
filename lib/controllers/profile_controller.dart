import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController implements ProtocolController {

  ProfileController(FirebaseAuthService this._auth, FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ProfileController onInit");
    checkSession();
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("ProfileController is user signed in ${_auth.isUserSignedIn()}");
      Get.offAndToNamed(Routes.LOGIN, arguments: "Session Expired Please Login again");
    }
  }
  
  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}