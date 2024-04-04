import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {

  DashboardController(this._auth, this._service,) {
    debugPrint("DashboardController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  List<String> _topComplaintsList = [];
  final RxString _solvedComplaints = "".obs, _pendingComplaints = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("DashboardController onInit");
    //checkSession();
    if (checkSession(_auth)) {
      _topComplaintsList = ["Sample First", "Sample Second", "Sample Third"]; //TODO: Get Data from Firestore Database
      _solvedComplaints("${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('resolved'))}");
      _pendingComplaints("${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('pending'))}");
    }
  }

  int getTopComplaintsCount() {
    return _topComplaintsList.length;
  }

  String getTopComplaints(int index) {
    return _topComplaintsList[index];
  }

  List<String> getTopComplaintsList() {
    return _topComplaintsList;
  }

  RxString observeSolvedComplaints() {
    return _solvedComplaints;
  }

  RxString observePendingComplaints() {
    return _pendingComplaints;
  }

  String getComplaintsSubmittedToday() {
    return "Sample for Submitted Today"; //TODO: Get Data from Firestore Database
  }
  
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}