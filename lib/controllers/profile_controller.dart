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

  ProfileController(FirebaseAuthService this._auth, FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  PageController pageController = new PageController(initialPage: 0);
  final RxBool isLoading = false.obs;
  TextEditingController? firstNameController, lastNameController, middleNameController, 
  ageController, contactNumberController, houseStreetController;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ProfileController onInit");
    //checkSession();
    pageController.addListener(() {
      debugPrint("pageController Listener");
    });
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    middleNameController = TextEditingController();
    ageController = TextEditingController();
    contactNumberController = TextEditingController();
    houseStreetController = TextEditingController();
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

  void launchReadOnly() {
    debugPrint("ProfileController launchReadOnly");
    pageController.jumpToPage(0);
  }

  void launchEditMode() {
    debugPrint("ProfileController launchEditMode");
    //TODO: Save Information
    pageController.jumpToPage(1);
  }

  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}