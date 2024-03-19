import 'dart:async';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  

  @protected
  void onShowAlert(String title, String message) {
    Timer (
      const Duration(milliseconds: 1000), ( () => Get.snackbar(title, message) )
    );
  }

  bool checkSession(final FirebaseAuthService auth) {
    if(auth.isUserSignedIn() == false) {
      debugPrint("ComplaintFormController is user signed in ${auth.isUserSignedIn()}");
      DialogWidget.timeoutDialog (
        "Session Expired Please Login again", 
        AppLocalizations.of(Get.context!).translate('yes'), 
        () { Get.offAndToNamed(Routes.LOGIN); }
      );
    }
    return auth.isUserSignedIn();
  }
}