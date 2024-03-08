import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomedController extends BaseController {

  HomedController(FirebaseAuthService this._auth,) {
    debugPrint("HomedController Constructor");
  }

  final FirebaseAuthService _auth;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("HomedController onInit");
  }
  //#region Home App Bar Methods
  void launchNotification() {
    debugPrint("HomedController launchNotification");
  }

  void launchProfile() {
    debugPrint("HomedController launchProfile");
  }

  void promptLogout() {
    debugPrint("HomedController promptLogout");
    //Todo: Create Alert Dialog Box for Confirmation
    _launchLogout();
  }
  
  void _launchLogout() {
    debugPrint("HomedController _launchLogout");
    Get.offAndToNamed(Routes.LOGIN);
    //_auth.signOut();
  }
  //#endregion
  void launchDashboard() {
    debugPrint("HomedController launchDashboard");
    Get.toNamed(Routes.DASHBOARD);
  }
  //#region Resident Methods
  void launchFileComplaint() {
    debugPrint("HomedController launchFileComplaint");
  }

  void launchSelfComplaintsList() {
    debugPrint("HomedController launchSelfComplaintsList");
  }
  //#endregion
  //#region Staff Methods
  void launchComplaintsList() {
    debugPrint("HomedController launchComplaintsList");
  }

  void launchResidentsList() {
    debugPrint("HomedController launchResidentsList");
  }
  //#endregion  
  @override
  void onClose() {
    debugPrint("HomedController onClose");
    super.onClose();
  }
}