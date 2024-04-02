import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentsInformationController extends BaseController {

  ResidentsInformationController(this._auth, this._service) {
    debugPrint("ResidentsInformationController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ResidentModel?> _residentInformation = ResidentModel().obs;
  
  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsInformationController onInit");
    //checkSession();
    fetch();
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      if (checkSession(_auth) && arguments != null && arguments is String) {
        final ResidentModel? snapshot = await _service.getResident(arguments);
        _residentInformation(snapshot);
      } else {
        _residentInformation();
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
}