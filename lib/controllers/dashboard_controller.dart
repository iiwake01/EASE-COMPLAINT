import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/top_complaint_model.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  DashboardController(
    this._auth,
    this._service,
  ) {
    debugPrint("DashboardController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;

  final RxList<TopComplaintModel?> _topComplaintsList =
      List<TopComplaintModel?>.empty().obs;
  final RxString _solvedComplaints = "".obs,
      _pendingComplaints = "".obs,
      _todayComplaints = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("DashboardController onInit");
    if (checkSession(_auth)) {
      _isLoading(false);

      final User? user = _auth.getUser();
      final ResidentModel? resident = await _service.getResident(user?.uid);
      if (resident != null) {
        _topComplaintsList(await _service.getComplaintsTop(user?.uid));
        _solvedComplaints(
            "${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('resolved'), resident.uid)}");
        _pendingComplaints(
            "${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('pending'), resident.uid)}");
        _todayComplaints("${await _service.getNotificationsToday(user?.uid)}");
      } else {
        _topComplaintsList(await _service.getComplaintsTop(null));
        _solvedComplaints(
            "${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('resolved'), null)}");
        _pendingComplaints(
            "${await _service.getComplaintsStatus(AppLocalizations.of(Get.context!).translate('pending'), null)}");
        _todayComplaints("${await _service.getNotificationsToday(null)}");
      }
    }
    debugPrint("DashboardController onInit done");
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  int getTopComplaintsCount() {
    return _topComplaintsList.length;
  }

  RxList<TopComplaintModel?> observeTopComplaintsList() {
    return _topComplaintsList;
  }

  RxString observeSolvedComplaints() {
    return _solvedComplaints;
  }

  RxString observePendingComplaints() {
    return _pendingComplaints;
  }

  RxString observeComplaintsSubmittedToday() {
    return _todayComplaints;
  }

  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}
