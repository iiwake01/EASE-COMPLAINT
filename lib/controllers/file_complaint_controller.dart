import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FileComplaintController extends BaseController {

  FileComplaintController() {
    debugPrint("FileComplaintController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("FileComplaintController onInit");
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