import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
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
    Get.toNamed(Routes.NOTIFICATION);
  }

  void launchProfile() {
    debugPrint("HomedController launchProfile");
    Get.toNamed(Routes.PROFILE);
  }

  void promptLogout() {
    debugPrint("HomedController promptLogout");    
    DialogWidget.logoutDialog (
      AppLocalizations.of(Get.context!).translate('are_you_sure_you_want_to_log_out_'), 
      AppLocalizations.of(Get.context!).translate('yes'), 
      AppLocalizations.of(Get.context!).translate('no'), 
      () => _launchLogout(), () { if (Get.isDialogOpen == true) { Get.back(); } }
    );
  }
  
  void _launchLogout() {
    debugPrint("HomedController _launchLogout");
    if (Get.isDialogOpen == true) { Get.back(); }
    DialogWidget.loadingDialog();
    if (Get.isDialogOpen == true) { Get.back(); }
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
    Get.toNamed(Routes.FILECOMPLAINT);
  }

  void launchResidentComplaintList() {
    debugPrint("HomedController launchResidentComplaintList");
    Get.toNamed(Routes.RESIDENTCOMPLAINTSLIST);
  }
  //#endregion
  //#region Staff Methods
  void launchStaffComplaintList() {
    debugPrint("HomedController launchStaffComplaintsList");
    Get.toNamed(Routes.STAFFCOMPLAINTSLIST);
  }

  void launchResidentsList() {
    debugPrint("HomedController launchResidentsList");
    Get.toNamed(Routes.RESIDENTSLIST);
  }
  //#endregion  
  @override
  void onClose() {
    debugPrint("HomedController onClose");
    super.onClose();
  }
}