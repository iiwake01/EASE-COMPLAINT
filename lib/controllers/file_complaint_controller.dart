import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FileComplaintController extends BaseController {

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

  void launchEnvironmentalProblems() {
    debugPrint("FileComplaintController launchEnvironmentalProblems");
    if (checkSession(_auth)) Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('environmental_problem'));    
  }

  void launchCommunityConflicts() {
    debugPrint("FileComplaintController launchCommunityConflicts");
    if (checkSession(_auth)) Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('community_conflict'));
  }

  void launchPublicDisturbances() {
    debugPrint("FileComplaintController launchPublicDisturbances");
    if (checkSession(_auth)) Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('public_disturbance'));
  }

  void launchCrimeRelated() {
    debugPrint("FileComplaintController launchCrimeRelated");
    if (checkSession(_auth)) Get.toNamed(Routes.COMPLAINTFORM, arguments: AppLocalizations.of(Get.context!).translate('crime_related'));
  }

  void launchOtherTypeProblem() {
    debugPrint("FileComplaintController launchOtherTypeProblem");
    if (checkSession(_auth)) Get.toNamed(Routes.COMPLAINTFORM);
  }
  
  @override
  void onClose() {
    debugPrint("FileComplaintController onClose");
    super.onClose();
  }
}