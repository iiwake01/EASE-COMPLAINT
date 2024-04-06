import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentComplaintStatusChangeController extends BaseController {

  ResidentComplaintStatusChangeController(this._auth, this._service) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final arguments = Get.arguments;
  final RxBool _isLoading = false.obs;
  final Rx<ComplaintModel?> _complaintInformation = ComplaintModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
  }

  Future<void> updatePending() async {
    if (checkSession(_auth)) {
      final ComplaintModel? snapshot = await _service.getComplaint(arguments);
      _service.updateComplaint(
        ComplaintModel(
          id: snapshot!.id,
          uid: snapshot.uid,
          urgency: snapshot.urgency,
          location: snapshot.location,
          narrative: snapshot.narrative,
          attacthment: snapshot.attacthment,
          previousActionTaken: snapshot.previousActionTaken,
          witnessName: snapshot.witnessName,
          witnessContact: snapshot.witnessContact,
          resolutionRequest: snapshot.resolutionRequest,
          photo: snapshot.photo,
          name: snapshot.name,
          zone: snapshot.zone,
          type: snapshot.type,
          date: snapshot.date,
          status: AppLocalizations.of(Get.context!).translate('pending'),
        ),
      );
    }
  }

  Future<void> updateUnresolved() async {
    if(checkSession(_auth)) {
      final ComplaintModel? snapshot = await _service.getComplaint(arguments);
      _service.updateComplaint(
        ComplaintModel(
          id: snapshot!.id,
          uid: snapshot.uid,
          urgency: snapshot.urgency,
          location: snapshot.location,
          narrative: snapshot.narrative,
          attacthment: snapshot.attacthment,
          previousActionTaken: snapshot.previousActionTaken,
          witnessName: snapshot.witnessName,
          witnessContact: snapshot.witnessContact,
          resolutionRequest: snapshot.resolutionRequest,
          photo: snapshot.photo,
          name: snapshot.name,
          zone: snapshot.zone,
          type: snapshot.type,
          date: snapshot.date,
          status: AppLocalizations.of(Get.context!).translate('unresolved'),
        ),
      );
    }
  }

  Future<void> updateResolved() async {
    if(checkSession(_auth)) {
      final ComplaintModel? snapshot = await _service.getComplaint(arguments);
      _service.updateComplaint(
        ComplaintModel(
          id: snapshot!.id,
          uid: snapshot.uid,
          urgency: snapshot.urgency,
          location: snapshot.location,
          narrative: snapshot.narrative,
          attacthment: snapshot.attacthment,
          previousActionTaken: snapshot.previousActionTaken,
          witnessName: snapshot.witnessName,
          witnessContact: snapshot.witnessContact,
          resolutionRequest: snapshot.resolutionRequest,
          photo: snapshot.photo,
          name: snapshot.name,
          zone: snapshot.zone,
          type: snapshot.type,
          date: snapshot.date,
          status: AppLocalizations.of(Get.context!).translate('resolved'),
        ),
      );
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  Rx<ComplaintModel?> observeComplaintInformation() {
    return _complaintInformation;
  }
}