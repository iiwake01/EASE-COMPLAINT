import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintInformationController extends BaseController {
  
  ResidentsComplaintInformationController(this._auth, this._service) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ResidentModel?> _residentInformation = ResidentModel().obs;
  final Rx<ComplaintModel?> _complaintInformation = ComplaintModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
    //checkSession();
    fetch();
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      if (checkSession(_auth)) {
        final User? user = _auth.getUser();
        final ResidentModel? snapshot = await _service.getResident(user?.uid);
        _residentInformation(snapshot);
      }
      if (checkSession(_auth) && arguments != null && arguments is String) {
        final ComplaintModel? snapshot = await _service.getComplaint(arguments);
        _complaintInformation(snapshot);
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("ResidentsInformationController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  Rx<ResidentModel?> observeResidentInformation() {
    return _residentInformation;
  }

  Rx<ComplaintModel?> observeComplaintInformation() {
    return _complaintInformation;
  }
}
