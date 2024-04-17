import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/staff_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StaffInformationController extends BaseController {

  StaffInformationController(
    this._auth,
    this._service,
  ) {
    debugPrint("StaffInformationController Constructor");
  }
  
  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final Rx<StaffModel?> _staffInformation = StaffModel().obs;
  final arguments = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchArguments();
  }

  Future<void> fetchArguments() async {
    try {
      _isLoading(true);
      if (checkSession(_auth) && arguments != null && arguments is String) {
        debugPrint("StaffInformationController fetchArguments $arguments");
        final StaffModel? snapshot = await _service.getStaff(arguments);
        _staffInformation(snapshot);
      } else {
        debugPrint("StaffInformationController fetchArguments $arguments");
        _staffInformation();
      }
      debugPrint("StaffInformationController fetchArguments ${_staffInformation.value}");
    } catch (exception) {
      onShowAlert("Error:", "Error fetching staffInformation");
      debugPrint("StaffInformation fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  Rx<StaffModel?> observeStaffInformation() {
    return _staffInformation;
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  @override
  void onClose() {
    super.onClose();
  }
}