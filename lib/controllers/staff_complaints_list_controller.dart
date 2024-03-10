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
      _complaintList.clear();
      _complaintList.add( ComplaintModel(photo: "Photo 0", name: "name 0", zone: "Zone 0", type: "Complaint Type 0", date: "Date 0", status: "Status 0") );
      _complaintList.add( ComplaintModel(photo: "Photo 1", name: "name 1", zone: "Zone 1", type: "Complaint Type 1", date: "Date 1", status: "Status 1") );
      _complaintList.add( ComplaintModel(photo: "Photo 2", name: "name 2", zone: "Zone 2", type: "Complaint Type 2", date: "Date 2", status: "Status 2") );
      _complaintList.add( ComplaintModel(photo: "Photo 3", name: "name 3", zone: "Zone 3", type: "Complaint Type 3", date: "Date 3", status: "Status 3") );
      _complaintList.add( ComplaintModel(photo: "Photo 4", name: "name 4", zone: "Zone 4", type: "Complaint Type 4", date: "Date 4", status: "Status 4") );
      _complaintList.add( ComplaintModel(photo: "Photo 6", name: "name 6", zone: "Zone 6", type: "Complaint Type 6", date: "Date 6", status: "Status 6") );
      _complaintList.add( ComplaintModel(photo: "Photo 7", name: "name 7", zone: "Zone 7", type: "Complaint Type 7", date: "Date 7", status: "Status 7") );
      _complaintList.add( ComplaintModel(photo: "Photo 8", name: "name 8", zone: "Zone 8", type: "Complaint Type 8", date: "Date 8", status: "Status 8") );
      _complaintList.add( ComplaintModel(photo: "Photo 9", name: "name 9", zone: "Zone 9", type: "Complaint Type 9", date: "Date 9", status: "Status 9") );
      _complaintList.add( ComplaintModel(photo: "Photo a", name: "name a", zone: "Zone a", type: "Complaint Type a", date: "Date a", status: "Status a") );
      _complaintList.add( ComplaintModel(photo: "Photo b", name: "name b", zone: "Zone b", type: "Complaint Type b", date: "Date b", status: "Status b") );
      _complaintList.add( ComplaintModel(photo: "Photo c", name: "name c", zone: "Zone c", type: "Complaint Type c", date: "Date c", status: "Status c") );
      _complaintList.add( ComplaintModel(photo: "Photo d", name: "name d", zone: "Zone d", type: "Complaint Type d", date: "Date d", status: "Status d") );
      _complaintList.add( ComplaintModel(photo: "Photo e", name: "name e", zone: "Zone e", type: "Complaint Type e", date: "Date e", status: "Status e") );
      _complaintList.add( ComplaintModel(photo: "Photo f", name: "name f", zone: "Zone f", type: "Complaint Type f", date: "Date f", status: "Status f") );
      _complaintList.add( ComplaintModel(photo: "Photo g", name: "name g", zone: "Zone g", type: "Complaint Type g", date: "Date g", status: "Status g") );
      _complaintList.add( ComplaintModel(photo: "Photo h", name: "name h", zone: "Zone h", type: "Complaint Type h", date: "Date h", status: "Status h") );
      _complaintList.add( ComplaintModel(photo: "Photo i", name: "name i", zone: "Zone i", type: "Complaint Type i", date: "Date i", status: "Status i") );
      _complaintList.add( ComplaintModel(photo: "Photo j", name: "name j", zone: "Zone j", type: "Complaint Type j", date: "Date j", status: "Status j") );
      _complaintList.add( ComplaintModel(photo: "Photo k", name: "name k", zone: "Zone k", type: "Complaint Type k", date: "Date k", status: "Status k") );
      _complaintList.add( ComplaintModel(photo: "Photo l", name: "name l", zone: "Zone l", type: "Complaint Type l", date: "Date l", status: "Status l") );
      _complaintList.add( ComplaintModel(photo: "Photo m", name: "name m", zone: "Zone m", type: "Complaint Type m", date: "Date m", status: "Status m") );
      _complaintList.add( ComplaintModel(photo: "Photo n", name: "name n", zone: "Zone n", type: "Complaint Type n", date: "Date n", status: "Status n") );
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
    debugPrint("StaffComplaintsListController launchView");
    onShowAlert("Under Construction", "On Going . . .");
  }
  
  @override
  void onClose() {
    debugPrint("StaffComplaintsListController onClose");
    super.onClose();
  }
}