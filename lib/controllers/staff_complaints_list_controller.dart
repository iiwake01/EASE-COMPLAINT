import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StaffComplaintsListController extends BaseController implements ProtocolController {

  StaffComplaintsListController(FirebaseAuthService this._auth, FirestoreService this._service,) {
    debugPrint("StaffComplaintsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ComplaintModel> _complaintList = new List<ComplaintModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("StaffComplaintsListController onInit");
    //checkSession();
    fetch();
  }

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("StaffComplaintsListController is user signed in ${_auth.isUserSignedIn()}");
      DialogWidget.timeoutDialog (
        "Session Expired Please Login again", 
        AppLocalizations.of(Get.context!).translate('yes'), 
        () { Get.offAndToNamed(Routes.LOGIN); }
      );
    }
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