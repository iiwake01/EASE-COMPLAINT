import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintReviewController extends BaseController {
  ResidentsComplaintReviewController(this._auth, this._service) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ResidentModel?> _residentInformation = ResidentModel().obs;
  final Rx<ComplaintModel?> _complaintInformation = ComplaintModel().obs;

  RxString selectStatus = "Pending".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsComplaintReviewController onInit");
    fetch();
  }

  Future<void> fetch() async {
    try {
      print("Fetching data...");
      debugPrint("ResidentsComplaintReviewController fetch");
      _isLoading(true);
      if (checkSession(_auth) && arguments != null && arguments is List) {
        final ResidentModel? resident =
            await _service.getResident(arguments[0]);
        final ComplaintModel? complaint =
            await _service.getComplaint(arguments[1]);
        _residentInformation(resident);
        _complaintInformation(complaint);
        debugPrint(
            "ResidentsComplaintReviewController resident ${resident?.toString()}");
        debugPrint(
            "ResidentsComplaintReviewController complaint ${complaint?.toString()}");
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("ResidentsComplaintReviewController catch $exception");
    } finally {
      _isLoading(false);
      debugPrint("ResidentsComplaintReviewController finally");
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

  @override
  void onClose() {
    debugPrint("ResidentsComplaintReviewController onClose");
    super.onClose();
  }
}
