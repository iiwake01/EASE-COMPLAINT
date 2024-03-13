import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController implements ProtocolController {

  DashboardController(FirebaseAuthService this._auth, FirestoreService this._service,) {
    debugPrint("DashboardController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  List<String> _topComplaintsList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("DashboardController onInit");
    checkSession();
    _topComplaintsList = ["Sample First", "Sample Second", "Sample Third"]; //TODO: Get Data from Firestore Database
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("DashboardController not signed in ${_auth.isUserSignedIn()}");
      Get.offAndToNamed(Routes.LOGIN);
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

  String getSolvedComplaints() {
    return "Sample for Solved Complaints"; //TODO: Get Data from Firestore Database
  }

  String getPendingComplaints() {
    return "Sample for Pending Complaints"; //TODO: Get Data from Firestore Database
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