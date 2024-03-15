import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController implements ProtocolController {

  ProfileController(this._auth, this._service, this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ProfileController onInit");
    //checkSession();
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("ProfileController is user signed in ${_auth.isUserSignedIn()}");
      DialogWidget.timeoutDialog (
        "Session Expired Please Login again", 
        AppLocalizations.of(Get.context!).translate('yes'), 
        () { Get.offAndToNamed(Routes.LOGIN); }
      );
    }
  }
  
  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}