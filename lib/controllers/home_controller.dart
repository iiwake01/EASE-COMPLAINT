import 'package:app/controllers/base_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomedController extends BaseController {

  HomedController() {
    debugPrint("HomedController Constructor");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("HomedController onInit");
  }
  //#region Home App Bar Methods
  void launchNotification() {

  }

  void launchProfile() {
    
  }
  
  void launchLogout() {

  }
  //#endregion
  void launchDashboard() {
    debugPrint("HomedController launchDashboard");
    Get.offAndToNamed(Routes.DASHBOARD);
  }
  //#region Resident Methods
  void launchFileComplaint() {

  }

  void launchSelfComplaintsList() {

  }
  //#endregion
  //#region Staff Methods
  void launchComplaintsList() {
    
  }

  void launchResidentsList() {
    
  }
  //#endregion  
  @override
  void onClose() {
    debugPrint("HomedController onClose");
    super.onClose();
  }
}