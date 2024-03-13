import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentsListController extends BaseController implements ProtocolController {

  ResidentsListController(FirebaseAuthService this._auth, FirestoreService this._service,) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ResidentModel> _residentList = new List<ResidentModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
    checkSession();
    fetch();
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("ResidentsListController not signed in ${_auth.isUserSignedIn()}");
    Get.offAndToNamed(Routes.LOGIN);
    }
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      final List<ResidentModel> snapshot = await _service.getResidents();
      _residentList.assignAll(snapshot);
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

  List<ResidentModel> getList() {
    return _residentList;
  }

  void launchView() {
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentsListController onClose");
    super.onClose();
  }
}