import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';

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
    onShowAlert("Under Construction", "On Going . . .");
  }

  void launchCommunityConflicts() {
    debugPrint("FileComplaintController launchCommunityConflicts");
    onShowAlert("Under Construction", "On Going . . .");
  }

  void launchPublicDisturbances() {
    debugPrint("FileComplaintController launchPublicDisturbances");
    onShowAlert("Under Construction", "On Going . . .");
  }

  void launchCrimeRelated() {
    debugPrint("FileComplaintController launchCrimeRelated");
    onShowAlert("Under Construction", "On Going . . .");
  }

  void launchOtherTypeProblem() {
    debugPrint("FileComplaintController launchOtherTypeProblem");
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("FileComplaintController onClose");
    super.onClose();
  }
}