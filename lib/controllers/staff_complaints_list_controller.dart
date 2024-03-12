import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StaffComplaintsListController extends BaseController {

  StaffComplaintsListController(FirestoreService this._service,) {
    debugPrint("StaffComplaintsListController Constructor");
  }

  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ComplaintModel> _complaintList = new List<ComplaintModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("StaffComplaintsListController onInit");
    fetch();
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      final List<ComplaintModel> snapshot = await _service.getComplaints();
      _complaintList.assignAll(snapshot);
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("StaffComplaintsListController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  List<ComplaintModel> getList() {
    return _complaintList;
  }

  void launchView() {
    debugPrint("StaffComplaintsListController launchView");
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("StaffComplaintsListController onClose");
    super.onClose();
  }
}