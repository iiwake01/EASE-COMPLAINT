import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StaffComplaintsListController extends BaseController {
  StaffComplaintsListController(
    this._auth,
    this._service,
  ) {
    debugPrint("StaffComplaintsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ComplaintModel> _complaintList =
      List<ComplaintModel>.empty().obs;

  final List<String> sortList = [
    //"Sort by ->",
    AppLocalizations.of(Get.context!).translate("pending"),
    AppLocalizations.of(Get.context!).translate("resolved"),
    AppLocalizations.of(Get.context!).translate("unresolved"),
    AppLocalizations.of(Get.context!).translate("environmental_problem"),
    AppLocalizations.of(Get.context!).translate("community_conflict"),
    AppLocalizations.of(Get.context!).translate("crime_related"),
    AppLocalizations.of(Get.context!).translate("public_disturbance"),
  ];

  RxString selectedRepute = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("StaffComplaintsListController onInit");
    //checkSession();
    fetch();
    selectedRepute(sortList.first);
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      if (checkSession(_auth)) {
        final List<ComplaintModel> snapshot = await _service.getComplaints();
        _complaintList.assignAll(snapshot);
      } else {
        _complaintList.clear();
      }
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

  Future<void> updateRepute(String? repute) async {
    updateRepute(repute);
  }

  // void launchView() {
  //   debugPrint("StaffComplaintsListController launchView");
  //   if(checkSession(_auth)) onShowAlert("Under Construction", "On Going . . .");
  // }

  void launchView(final String? uid, final String? complaintId) {
    debugPrint("StaffComplaintsListController launchView");
    if (checkSession(_auth)) {
      Get.toNamed(
        Routes.RESIDENTCOMPLAINTINFORMATION,
        arguments: [uid, complaintId],
      );
    }
  }

  @override
  void onClose() {
    debugPrint("StaffComplaintsListController onClose");
    super.onClose();
  }
}