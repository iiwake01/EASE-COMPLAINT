import 'package:app/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {

  DashboardController() {
    debugPrint("DashboardController Constructor");
  }

  List<String> _topComplaintsList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("DashboardController onInit");
    _topComplaintsList = ["Sample First", "Sample Second", "Sample Third"]; //TODO: Get Data from Database
  }

  int getTopComplaintsCount() {
    return _topComplaintsList.length;
  }

  String getTopComplaints(int index) {
    return _topComplaintsList[index];
  }

  List<String> getTopComplaintsList() {
    return _topComplaintsList;
  }

  String getSolvedComplaints() {
    return "Sample for Solved Complaints"; //TODO: Get Data from Database
  }

  String getPendingComplaints() {
    return "Sample for Pending Complaints"; //TODO: Get Data from Database
  }

  String getComplaintsSubmittedToday() {
    return "Sample for Submitted Today"; //TODO: Get Data from Database
  }
  
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}