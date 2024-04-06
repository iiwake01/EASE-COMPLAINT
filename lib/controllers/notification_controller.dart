import 'package:app/bindings/complaint_form_finding.dart';
import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/notification_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends BaseController {
  NotificationController(this._auth, this._service) {
    debugPrint("NotificationController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxList<ComplaintModel> _complaintList =
      List<ComplaintModel>.empty().obs;

  final RxBool _isLoading = false.obs;

  final RxList<NotificationModel> _notificationList =
      List<NotificationModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("NotificationController onInit");
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      _isLoading(true);
      if (checkSession(_auth)) {
        final List<NotificationModel> snapshot =
            await _service.getNotifications(_auth.getUser()?.uid);
        _notificationList.assignAll(snapshot);
      } else {
        _notificationList.clear();
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("NotificationController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  RxList<NotificationModel> observeNotifications() {
    return _notificationList;
  }

  int getListCount() {
    return _notificationList.length;
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  void launchView(final String? complaintId) {
    debugPrint("NotificationController launchView");
    if (checkSession(_auth)) {
      Get.toNamed(Routes.RESIDENTCOMPLAINTVIEW, arguments: [
        _auth.getUser()?.uid,
        complaintId,
      ]);
    }
  }

  @override
  void onClose() {
    debugPrint("NotificationController onClose");
    super.onClose();
  }
}
