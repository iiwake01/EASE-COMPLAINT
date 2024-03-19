import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentsListController extends BaseController {

  ResidentsListController(this._auth, this._service,) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ResidentModel> _residentList = List<ResidentModel>.empty().obs;

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
      if(checkSession(_auth)) {
        final List<ResidentModel> snapshot = await _service.getResidents();
        _residentList.assignAll(snapshot);
      } else {
        _residentList.clear();
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

  List<ResidentModel> getList() {
    return _residentList;
  }

  void launchView() {
    if(checkSession(_auth)) onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentsListController onClose");
    super.onClose();
  }
}