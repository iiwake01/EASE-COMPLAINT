import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentComplaintsListController extends BaseController {

  ResidentComplaintsListController(FirebaseAuthService this._auth, FirestoreService this._service,) {
    debugPrint("ResidentComplaintsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ComplaintModel> _complaintList = new List<ComplaintModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentComplaintsListController onInit");
    fetch();
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      final User? user = _auth.getUser();
      final List<ComplaintModel> snapshot = await _service.getResidentComplaints(user?.uid ?? "000");
      _complaintList.assignAll(snapshot);
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

  int getListCount() {
    return _complaintList.length;
  }

  String getType(int index) {
    return _complaintList[index].type ?? Constants.BLANK;
  }

  String getDate(int index) {
    return _complaintList[index].date ?? Constants.BLANK;
  }

  String getStatus(int index) {
    return _complaintList[index].status ?? Constants.BLANK;
  }

  List<ComplaintModel> getList() {
    return _complaintList;
  }

  void launchView() {
    debugPrint("ResidentComplaintsListController launchView");
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentComplaintsListController onClose");
    super.onClose();
  }
}