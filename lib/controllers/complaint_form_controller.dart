import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintFormController extends BaseController {

  ComplaintFormController(FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("ComplaintFormController Constructor");
  }

  final FirestoreService _service;
  final FirebaseStorageService _storage;
  final arguments = Get.arguments;
  TextEditingController? urgencyController, locationController, narrativeController, previousActionConroller, nameController, contactController, resolutionController;
  final Rx<TextEditingController?> typeController = TextEditingController().obs, incidentDateController = TextEditingController().obs;
  PlatformFile? attatchmentFile;

  @override
  void onInit() {
    super.onInit();
    debugPrint("ComplaintFormController onInit arguments $arguments");
    urgencyController = TextEditingController();
    locationController = TextEditingController();
    narrativeController = TextEditingController();
    previousActionConroller = TextEditingController();
    nameController = TextEditingController();
    contactController = TextEditingController();
    resolutionController = TextEditingController();
    if (arguments != null && arguments is String) {
      typeController(TextEditingController(text: arguments));
    }
  }

  Future<void> validate() async {
    final isUrgencyValid = urgencyController?.text.isBlank == false;
    final isTypeValid = typeController.value?.text.isBlank == false;
    final isLocationValid = locationController?.text.isBlank == false;
    final isNarrativeValid = narrativeController?.text.isBlank == false;
    final isPreviousActionValid = previousActionConroller?.text.isBlank == false;
    final isNameValid = nameController?.text.isBlank == false;
    final isContactValid = contactController?.text.isBlank == false;
    final isResolutionValid = resolutionController?.text.isBlank == false;
    debugPrint("ComplaintFormController isUrgencyValid");
    if (!isUrgencyValid) {
      onShowAlert("Error", "Urgency is Invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isTypeValid) {
      onShowAlert("Error", "Type is Invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isLocationValid) {
      onShowAlert("Error", "Location is Invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isNarrativeValid) {
      onShowAlert("Error", "Narrative is Invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isPreviousActionValid) {
      onShowAlert("Error", "PreviousAction is invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isNameValid) {
      onShowAlert("Error", "Name is invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isContactValid) {
      onShowAlert("Error", "Contact is invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else if (!isResolutionValid) {
      onShowAlert("Error", "Resolution is invalid");
      debugPrint("ComplaintFormController Name is Invalid");
    } else {
      onShowAlert("Creating", "Now Creating Account");
      DialogWidget.loadingDialog();
      _createComplaint();
    }
  }

  Future<void> _createComplaint() async {
    debugPrint("ComplaintFormController _createComplaint");  
    try {
      //TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(attatchmentFile);
      final ComplaintModel complaint;
      if (false/*taskSnapshot != null && taskSnapshot.state == TaskState.success*/) {
        complaint = ComplaintModel (
          uid: "000",
          name: "x y z",
          photo: "",
          zone: "Zone X",
          urgency: urgencyController?.text,
          type: typeController?.value?.text,
          date: incidentDateController?.value?.text,
          location: locationController?.text,
          narrative: narrativeController?.text,
          //attacthment: "",
          previousActionTaken: previousActionConroller?.text,
          witnessName: nameController?.text,
          witnessContact: contactController?.text,
          resolutionRequest: resolutionController?.text,
          status: AppLocalizations.of(Get.context!).translate('pending')
        );
      } else {
        complaint = ComplaintModel (
          uid: "000",
          name: "x y z",
          photo: "",
          zone: "Zone X",
          urgency: urgencyController?.text,
          type: typeController?.value?.text,
          date: incidentDateController?.value?.text,
          location: locationController?.text,
          narrative: narrativeController?.text,
          previousActionTaken: previousActionConroller?.text,
          witnessName: nameController?.text,
          witnessContact: contactController?.text,
          resolutionRequest: resolutionController?.text,
          status: AppLocalizations.of(Get.context!).translate('pending')
        );
      }
      await _service.createComplaint(complaint.toMap());
    } catch(exception) {
      debugPrint("ComplaintFormController Invalid $exception");
      onShowAlert("Error", "Please Try again $exception");
    } finally {
      if (Get.isDialogOpen == true) { Get.back(); }
      DialogWidget.submittedComplaintDialog(() {
        if (Get.isDialogOpen == true) { Get.back(); }
        Get.offAndToNamed(Routes.RESIDENTHOME);
      },);
    }
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("ComplaintFormController onClose");
  }
}