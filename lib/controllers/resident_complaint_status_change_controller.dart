import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentComplaintStatusChangeController extends BaseController {
  ResidentComplaintStatusChangeController(this._auth, this._service) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ComplaintModel?> _complaintInformation = ComplaintModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
  }

  Future<void> updateStatus(String status) async {
    if (checkSession(_auth)) {
      final ComplaintModel? complaint = await _service.getComplaint(arguments);
      _service.updateComplaint(
        ComplaintModel(
          id: complaint?.id,
          uid: complaint?.uid,
          urgency: complaint?.urgency,
          location: complaint?.location,
          narrative: complaint?.narrative,
          attacthment: complaint?.attacthment,
          previousActionTaken: complaint?.previousActionTaken,
          witnessName: complaint?.witnessName,
          witnessContact: complaint?.witnessContact,
          resolutionRequest: complaint?.resolutionRequest,
          photo: complaint?.photo,
          name: complaint?.name,
          zone: complaint?.zone,
          type: complaint?.type,
          date: complaint?.date,
          status: status,
        ),
      );
      final NotificationModel? notification = await _service.getNotification(
        complaint?.id,
      );
      _service.updateNotification(NotificationModel(
        uid: notification?.uid,
        complaintId: notification?.id,
        message: "Your filed complaint has been updated.",
        dateFilled: notification?.dateFilled,
        lastUpdate: Timestamp.now(),
        hasRead: false,
      ));
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  Rx<ComplaintModel?> observeComplaintInformation() {
    return _complaintInformation;
  }
}
