import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentComplaintsListController extends BaseController {

  ResidentComplaintsListController(FirestoreService this._service,) {
    debugPrint("ResidentComplaintsListController Constructor");
  }

  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ComplaintModel> _complaintList = new List<ComplaintModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentComplaintsListController onInit");
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      _complaintList.clear();
      _complaintList.add( ComplaintModel(type: "Complaint Type 0", date: "Date 0", status: "Status 0") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 1", date: "Date 1", status: "Status 1") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 2", date: "Date 2", status: "Status 2") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 3", date: "Date 3", status: "Status 3") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 4", date: "Date 4", status: "Status 4") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 6", date: "Date 6", status: "Status 6") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 7", date: "Date 7", status: "Status 7") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 8", date: "Date 8", status: "Status 8") );
      _complaintList.add( ComplaintModel(type: "Complaint Type 9", date: "Date 9", status: "Status 9") );
      _complaintList.add( ComplaintModel(type: "Complaint Type a", date: "Date a", status: "Status a") );
      _complaintList.add( ComplaintModel(type: "Complaint Type b", date: "Date b", status: "Status b") );
      _complaintList.add( ComplaintModel(type: "Complaint Type c", date: "Date c", status: "Status c") );
      _complaintList.add( ComplaintModel(type: "Complaint Type d", date: "Date d", status: "Status d") );
      _complaintList.add( ComplaintModel(type: "Complaint Type e", date: "Date e", status: "Status e") );
      _complaintList.add( ComplaintModel(type: "Complaint Type f", date: "Date f", status: "Status f") );
      _complaintList.add( ComplaintModel(type: "Complaint Type g", date: "Date g", status: "Status g") );
      _complaintList.add( ComplaintModel(type: "Complaint Type h", date: "Date h", status: "Status h") );
      _complaintList.add( ComplaintModel(type: "Complaint Type i", date: "Date i", status: "Status i") );
      _complaintList.add( ComplaintModel(type: "Complaint Type j", date: "Date j", status: "Status j") );
      _complaintList.add( ComplaintModel(type: "Complaint Type k", date: "Date k", status: "Status k") );
      _complaintList.add( ComplaintModel(type: "Complaint Type l", date: "Date l", status: "Status l") );
      _complaintList.add( ComplaintModel(type: "Complaint Type m", date: "Date m", status: "Status m") );
      _complaintList.add( ComplaintModel(type: "Complaint Type n", date: "Date n", status: "Status n") );
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
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
    debugPrint("ResidentComplaintsListController launchView");
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("ResidentComplaintsListController onClose");
    super.onClose();
  }
}