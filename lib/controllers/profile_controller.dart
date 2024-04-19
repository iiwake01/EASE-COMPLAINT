import 'dart:io';
import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  ProfileController(this._auth, this._service, this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  PageController pageController = new PageController(initialPage: 0);
  final RxBool isLoading = false.obs;
  TextEditingController? firstNameController,
      lastNameController,
      middleNameController,
      genderController,
      ageController,
      contactNumberController,
      statusController,
      zoneController,
      houseStreetController,
      emailController,
      positionController;
  //final List<String> genderList = [AppLocalizations.of(Get.context!).translate('sex'), AppLocalizations.of(Get.context!).translate('male'), AppLocalizations.of(Get.context!).translate('female')];
  //final List<String> statusList = [AppLocalizations.of(Get.context!).translate('status'), AppLocalizations.of(Get.context!).translate('single'),];
  //final List<String> zoneList = [AppLocalizations.of(Get.context!).translate('select_the_zone_your_reside_in_'), AppLocalizations.of(Get.context!).translate('zone_6'),];
  RxString photo = ""
      .obs; //selectedGender = "".obs, selectedStatus = "".obs, selectedZone = "".obs, liveFile = "".obs;
  final Rx<TextEditingController?> birthdateController =
      TextEditingController().obs;
  PlatformFile? _profileFile;
  RxBool hasFile = false.obs;
  Rx<Uint8List> liveFileBytes = Uint8List.fromList([0]).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ProfileController onInit");
    //checkSession();
    pageController.addListener(() {
      debugPrint("pageController Listener");
    });
    fetch();
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
    return await FilePicker.platform
        .pickFiles(type: type, allowedExtensions: extensions);
  }

  Future<void> _openFile(PlatformFile? file) async {
    debugPrint("ProfileController openFile(PlatformFile name ${file?.name})");
    debugPrint("ProfileController openFile(PlatformFile size ${file?.size})");
    debugPrint(
        "ProfileController openFile(PlatformFile extension ${file?.extension})");
    debugPrint("ProfileController openFile(PlatformFile bytes ${file?.bytes})");
    if (file != null) DialogWidget.loadingDialog();
    _profileFile = file;
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    final bool isImage =
        file.extension?.toLowerCase().contains("jpg") == true ||
            file.extension?.toLowerCase().contains("png") == true ||
            file.extension?.toLowerCase().contains("webp") == true;
    if (isImage && file.bytes != null) {
      hasFile(true);
      liveFileBytes(file?.bytes);
    } else if (isImage && file.path != null) {
      debugPrint("ProfileController openFile(PlatformFile path ${file.path})");
      final File mobileFile = File(file.path!);
      List<int> bytes = await mobileFile.readAsBytes();
      Uint8List uint8List = Uint8List.fromList(bytes);
      _profileFile = PlatformFile(
          path: file.path,
          name: file.name,
          size: file.size,
          bytes: uint8List,
          readStream: file.readStream,
          identifier: file.identifier);
      hasFile(true);
      liveFileBytes(uint8List);
    } else {
      hasFile(false);
      throw Exception("File is Null");
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  //#endregion
  Future<void> fetch() async {
    try {
      debugPrint("ProfileController fetch");
      isLoading(true);
      final User? user = _auth.getUser();
      final ResidentModel? resident = await _service.getResident(user?.uid);
      final StaffModel? staff = await _service.getStaff(user?.uid);
      debugPrint("ProfileController user uid ${user?.uid}");
      debugPrint("ProfileController resident ${resident?.toString()}");
      debugPrint("ProfileController staff ${staff?.toString()}");
      firstNameController =
          TextEditingController(text: resident?.first ?? staff?.first ?? "");
      lastNameController =
          TextEditingController(text: resident?.last ?? staff?.last ?? "");
      middleNameController =
          TextEditingController(text: resident?.middle ?? staff?.middle ?? "");
      genderController =
          TextEditingController(text: resident?.sex ?? staff?.sex ?? "");
      ageController =
          TextEditingController(text: resident?.age ?? staff?.age ?? "");
      birthdateController(
          TextEditingController(text: resident?.birth ?? staff?.birth ?? ""));
      contactNumberController = TextEditingController(
          text: resident?.contact ?? staff?.contact ?? "");
      statusController =
          TextEditingController(text: resident?.status ?? staff?.status ?? "");
      zoneController =
          TextEditingController(text: resident?.zone ?? staff?.zone ?? "");
      houseStreetController = TextEditingController(
          text: resident?.houseStreet ?? staff?.houseStreet);
      emailController =
          TextEditingController(text: resident?.email ?? staff?.email);
      positionController =
          TextEditingController(text: staff?.position ?? staff?.position);
      photo(resident?.photo ?? staff?.photo ?? Constants.BLANK);
      debugPrint(
          "ProfileController photo ${photo.value} isBlank ${photo.value.isBlank}");
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("ProfileController fetch $exception");
    } finally {
      isLoading(false);
    }
  }

  Future<void> _updateProfile() async {
    try {
      isLoading(true);
      final User? user = _auth.getUser();
      final ResidentModel? resident = await _service.getResident(user?.uid);
      final StaffModel? staff = await _service.getStaff(user?.uid);
      TaskSnapshot? taskSnapshot =
          await _storage.uploadPlatformFiles(_profileFile);
      _service.updateResident(resident);
      _service.updateStaff(staff);
      if (taskSnapshot != null &&
          taskSnapshot.state == TaskState.success &&
          resident != null) {
        final ResidentModel updatedModel = ResidentModel(
          id: resident.id,
          uid: resident.uid,
          photo: await taskSnapshot.ref.getDownloadURL(),
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: genderController?.text, //Must be Edited
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: statusController?.text, //Must be edited
          zone: zoneController?.text, //Must be edited
          houseStreet: houseStreetController?.text,
          email: resident.email,
          residency: resident.residency,
        );
        _service.updateResident(updatedModel);
      } else if (taskSnapshot != null &&
          taskSnapshot.state == TaskState.success &&
          staff != null) {
        final StaffModel updatedModel = StaffModel(
          id: staff.id,
          uid: staff.uid,
          photo: await taskSnapshot.ref.getDownloadURL(),
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: genderController?.text, //Must be edited
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: statusController?.text, //Must be edited
          zone: zoneController?.text, //Must be edited
          houseStreet: houseStreetController?.text,
          email: staff.email,
          residency: staff.residency,
        );
        _service.updateStaff(updatedModel);
      } else if (resident != null) {
        final ResidentModel updatedModel = ResidentModel(
          id: resident.id,
          uid: resident.uid,
          photo: resident.photo,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: genderController?.text, //Must be Edited
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: statusController?.text, //Must be edited
          zone: zoneController?.text, //Must be edited
          houseStreet: houseStreetController?.text,
          email: resident.email,
          residency: resident.residency,
        );
        _service.updateResident(updatedModel);
      } else if (staff != null) {
        final StaffModel updatedModel = StaffModel(
          id: staff.id,
          uid: staff.uid,
          photo: staff.photo,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: genderController?.text, //Must be edited
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: statusController?.text, //Must be edited
          zone: zoneController?.text, //Must be edited
          houseStreet: houseStreetController?.text,
          email: staff.email,
          residency: staff.residency,
        );
        _service.updateStaff(updatedModel);
      }
    } catch (exception) {
      onShowAlert("Error", "Update Failed");
      debugPrint("ProfileController update profile $exception");
    } finally {
      isLoading(false);
    }
  }

  Future<void> launchReadOnly() async {
    debugPrint("ProfileController launchReadOnly");
    if (checkSession(_auth)) {
      await _updateProfile();
      pageController.jumpToPage(0);
    }
  }

  void launchEditMode() {
    debugPrint("ProfileController launchEditMode");
    if (checkSession(_auth)) {
      isLoading(true);
      pageController.jumpToPage(1);
      isLoading(false);
    }
  }

  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}
