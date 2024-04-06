import 'dart:io';
import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/notification_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintFormController extends BaseController {

  ComplaintFormController(this._auth, this._service, this._storage) {
    debugPrint("ComplaintFormController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  final arguments = Get.arguments;
  TextEditingController? urgencyController, locationController, narrativeController, previousActionConroller, nameController, contactController, resolutionController;
  final Rx<TextEditingController?> typeController = TextEditingController().obs, incidentDateController = TextEditingController().obs;
  RxString liveFile = "".obs;
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
    if (!checkSession(_auth)) {

    } else if (!isUrgencyValid) {
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
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(attatchmentFile);
      final ComplaintModel complaint;
      final NotificationModel notification;
      final User? user = _auth.getUser();
      final ResidentModel? resident = await _service.getResident(user?.uid);
      if (taskSnapshot != null && taskSnapshot.state == TaskState.success) {
        complaint = ComplaintModel (
          uid: user?.uid,
          name: "${resident?.first} ${resident?.middle} ${resident?.last}",
          photo: resident?.photo,
          zone: resident?.zone,
          urgency: urgencyController?.text,
          type: typeController.value?.text,
          date: incidentDateController.value?.text,
          location: locationController?.text,
          narrative: narrativeController?.text,
          attacthment: await taskSnapshot.ref.getDownloadURL(),
          previousActionTaken: previousActionConroller?.text,
          witnessName: nameController?.text,
          witnessContact: contactController?.text,
          resolutionRequest: resolutionController?.text,
          status: AppLocalizations.of(Get.context!).translate('pending')
        );
      } else {
        complaint = ComplaintModel (
          uid: user?.uid,
          name: "${resident?.first} ${resident?.middle} ${resident?.last}",
          photo: resident?.photo,
          zone: resident?.zone,
          urgency: urgencyController?.text,
          type: typeController.value?.text,
          date: incidentDateController.value?.text,
          location: locationController?.text,
          narrative: narrativeController?.text,
          previousActionTaken: previousActionConroller?.text,
          witnessName: nameController?.text,
          witnessContact: contactController?.text,
          resolutionRequest: resolutionController?.text,
          status: AppLocalizations.of(Get.context!).translate('pending')
        );
      }
      final DocumentReference complaintDocument = await _service.createComplaint(complaint.toMap());
      notification = NotificationModel(
        uid: user?.uid,
        complaintId: complaintDocument.id,
        dateTime: DateTime.now(),
        hasRead: false,
      );
      await _service.createNotification(notification.toMap());
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
  //#region For Picking and displaying Image Files Methods
  Future<void> onPickFiles() async {
    const type = FileType.custom;
    final extensions = ['jpg', 'png', 'webp'];
    final result = await _pickFiles(type, extensions);
    _openFile(result?.files.single);
  }

  Future<FilePickerResult?> _pickFiles(
      FileType type, List<String>? extensions) async {
    return await FilePicker.platform.pickFiles(type: type, allowedExtensions: extensions);
  }

  Future<void> _openFile(PlatformFile? file) async {
    debugPrint("SignUpController openFile(PlatformFile name ${file?.name})");
    debugPrint("SignUpController openFile(PlatformFile size ${file?.size})");
    debugPrint("SignUpController openFile(PlatformFile extension ${file?.extension})");
    debugPrint("SignUpController openFile(PlatformFile bytes ${file?.bytes})");
    DialogWidget.loadingDialog();
    attatchmentFile = file;
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    liveFile("${file.name.split('.').first}.${file.extension} $fileSize");
    final bool isImage = file.extension?.toLowerCase().contains("jpg") == true || file.extension?.toLowerCase().contains("png") == true|| file.extension?.toLowerCase().contains("webp") == true;
    if (isImage && file.bytes != null) {
      //liveFileBytes(file?.bytes);
    } else if (isImage && file.path != null) {
      debugPrint("SignUpController openFile(PlatformFile path ${file.path})");
      final File mobileFile = File(file.path!);
      List<int> bytes = await mobileFile.readAsBytes();
      Uint8List uint8List = Uint8List.fromList(bytes);
      attatchmentFile = PlatformFile (
        path: file.path,
        name: file.name,
        size: file.size,
        bytes: uint8List,
        readStream: file.readStream,
        identifier: file.identifier
      );
      //liveFileBytes(_uint8List);
    } else {
      throw Exception("File is Null");
    }
    if (Get.isDialogOpen == true) { Get.back(); }
  }
  //#endregion
  @override
  void onClose() {
    super.onClose();
    debugPrint("ComplaintFormController onClose");
  }
}