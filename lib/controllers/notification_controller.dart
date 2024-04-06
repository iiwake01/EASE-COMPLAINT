import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends BaseController {

  NotificationController(this._auth, this._service) {
    debugPrint("NotificationController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxList<NotificationModel> _notificationList = List<NotificationModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("NotificationController onInit");
    _fetch();
  }
  
  Future<void> _fetch() async {
     try {
      //_isLoading(true);
      if (checkSession(_auth)) {
        final List<NotificationModel> snapshot = await _service.getNotifications(_auth.getUser()?.uid);
        _notificationList.assignAll(snapshot);
      } else {
        _notificationList.clear();
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("NotificationController fetch $exception");
    } finally {
      //_isLoading(false);
    }
  }

  RxList<NotificationModel> observeNotifications() {
    return _notificationList;
  }

  void launchView() {
    //TODO: after lauching the Notification update the parameter Constants.HASREAD to true
  }
  
  @override
  void onClose() {
    debugPrint("NotificationController onClose");
    super.onClose();
  }
}