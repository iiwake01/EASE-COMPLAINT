import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ResidentsComplaintInformationController extends BaseController {
  ResidentsComplaintInformationController(this._auth, this._service) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ResidentModel?> _residentComplaintInformation = ResidentModel().obs;

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
      if (checkSession(_auth) && arguments != null && arguments is String) {
        final ResidentModel? snapshot = await _service.getResident(arguments);
        _residentComplaintInformation(snapshot);
      } else {
        _residentComplaintInformation();
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("ResidentsListController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  Rx<ResidentModel?> observeResidentInformation() {
    return _residentComplaintInformation;
  }
}
