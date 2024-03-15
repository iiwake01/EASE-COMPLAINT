import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FileComplaintController extends BaseController implements ProtocolController {

  FileComplaintController(this._auth,) {
    debugPrint("FileComplaintController Constructor");
  }

  final FirebaseAuthService _auth;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("FileComplaintController onInit");
    //checkSession();
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("FileComplaintController is user signed in ${_auth.isUserSignedIn()}");
      DialogWidget.timeoutDialog (
        "Session Expired Please Login again", 
        AppLocalizations.of(Get.context!).translate('yes'), 
        () { Get.offAndToNamed(Routes.LOGIN); }
      );
    }
  }

  void launchEnvironmentalProblems() {
    debugPrint("FileComplaintController launchEnvironmentalProblems");
    Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('environmental_problem'));
  }

  void launchCommunityConflicts() {
    debugPrint("FileComplaintController launchCommunityConflicts");
    Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('community_conflict'));
  }

  void launchPublicDisturbances() {
    debugPrint("FileComplaintController launchPublicDisturbances");
    Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('public_disturbance'));
  }

  void launchCrimeRelated() {
    debugPrint("FileComplaintController launchCrimeRelated");
    Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('crime_related'));
  }

  void launchOtherTypeProblem() {
    debugPrint("FileComplaintController launchOtherTypeProblem");
    Get.toNamed(Routes.COMPLAINTFORM);
  }
  
  @override
  void onClose() {
    debugPrint("FileComplaintController onClose");
    super.onClose();
  }
}