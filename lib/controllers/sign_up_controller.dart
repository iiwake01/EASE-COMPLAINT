import 'dart:io';
import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {

  SignUpController(this._auth, this._service, this._storage) {
    debugPrint("SignUpController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  TextEditingController? emailController, passwordController, confirmPasswordController,
  firstNameController, lastNameController, middleNameController, 
  ageController, contactNumberController, houseStreetController;
  final List<String> genderList = [AppLocalizations.of(Get.context!).translate('sex'), AppLocalizations.of(Get.context!).translate('male'), AppLocalizations.of(Get.context!).translate('female')];
  final List<String> statusList = [AppLocalizations.of(Get.context!).translate('status'), AppLocalizations.of(Get.context!).translate('single'),];
  final List<String> zoneList = [AppLocalizations.of(Get.context!).translate('select_the_zone_your_reside_in_'), AppLocalizations.of(Get.context!).translate('zone_6'),];
  RxString selectedGender = "".obs, selectedStatus = "".obs, selectedZone = "".obs, liveFile = "".obs;
  final Rx<TextEditingController?> birthdateController = TextEditingController().obs;
  PlatformFile? residencyFile;
  RxBool isReadTerms = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("SignUpController onInit");
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    middleNameController = TextEditingController();
    ageController = TextEditingController();
    contactNumberController = TextEditingController();
    houseStreetController = TextEditingController();
    selectedGender(genderList.first);
    selectedStatus(statusList.first);
    selectedZone(zoneList.first);
  }

  Future<void> updateGender(String? gender) async {
    selectedGender(gender);
  }

  Future<void> updateStatus(String? status) async {
    selectedStatus(status);
  }

  Future<void> updateZone(String? zone) async {
    selectedZone(zone);
  }

  Future<void> toggleTerms() async {
    isReadTerms.toggle();
  }

  RxBool observedTerms() {
    return isReadTerms;
  }

  Future<void> validate() async {
    final age = num.tryParse(ageController?.text ?? "");
    final isAgeInvalid = age == null || age.isBlank == true || age.isNegative == true || age == 0;
    final isPhoneValid = contactNumberController?.text.isPhoneNumber;
    final isfirstNameValid = firstNameController?.text.isBlank == false && firstNameController?.text.isAlphabetOnly == true;
    final islastNameValid = lastNameController?.text.isBlank == false && lastNameController?.text.isAlphabetOnly == true;
    final isMiddleNameValid = middleNameController?.text.isBlank == false && middleNameController?.text.isAlphabetOnly == true;
    debugPrint("SignUpController validate age $age isAgeInvalid $isAgeInvalid isPhoneValid $isPhoneValid isfirstNameValid $isfirstNameValid islastNameValid $islastNameValid isMiddleNameValid $isMiddleNameValid");
    if (!isfirstNameValid || !islastNameValid || !isMiddleNameValid) {
      onShowAlert("Error", "Name is Invalid");
      debugPrint("SignUpController Name is Invalid");
    } else if (passwordController?.text != confirmPasswordController?.text) {
      onShowAlert("Error", "Password and Confrim Password is not equal");
      debugPrint("SignUpController Password and Confrim Password is not equal ${passwordController?.text} ${confirmPasswordController?.text}");
    } else if (isAgeInvalid) {
      onShowAlert("Error", "Age is invalid");
      onShowAlert("Error", "Age is invalid");
    } else if (isPhoneValid == false) {
      onShowAlert("Error", "Contact is invalid");
      debugPrint("SignUpController Contact is invalid");
    } else if (selectedGender.value == genderList.first) {
      onShowAlert("Error", "Gender is Invalid");
      debugPrint("SignUpController Gender is Invalid");
    } else if (selectedStatus.value == statusList.first) {
      onShowAlert("Error", "Status is Invalid");
      debugPrint("SignUpController Status is Invalid");
    } else if (selectedZone.value == zoneList.first) {
      onShowAlert("Error", "Zone is Invalid");
      debugPrint("SignUpController Zone is Invalid");
    } else if (isReadTerms.isFalse) {
      onShowAlert("Error", "Terms and Conditions need to be check");
      debugPrint("SignUpController Terms and Conditions need to be check");
    } else {
      onShowAlert("Creating", "Now Creating Account");
      DialogWidget.loadingDialog();
      _createAccount();
    }
  }

  Future<void> _createAccount() async {
    debugPrint("SignUpController createAccount");
    _auth.registerCredential (
      emailController?.text ?? "", 
      passwordController?.text ?? "", 
      (userCredential) => debugPrint('SignUpController UserCredential $userCredential'), 
      (user) => debugPrint('SignUpController User Id ${user!.uid} registered: $user '), 
      (uid) { _addResident(uid); }, 
      (firebaseAuthException) {
        debugPrint('SignUpController createAccount FirebaseAuthException ${firebaseAuthException.toString()}}');
        if (firebaseAuthException.code == 'weak-password') {
          onShowAlert("Error!", 'The password provided is too weak.');
        } else if (firebaseAuthException.code == 'email-already-in-use') {
          onShowAlert("Error!", 'The account already exists for that email.');
        }
      }, 
      (exception) {
        debugPrint('SignUpController registerCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      },
    );
  }

  Future<void> _addResident(String? uid) async {
    debugPrint("SignUpController _addResident");
    try {
      _auth.sendEmailVerification(() {}, (firebaseException){}, (exception) {});
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(residencyFile);
      final ResidentModel resident;
      if (taskSnapshot != null && taskSnapshot.state == TaskState.success) {
        resident = ResidentModel (
          uid: uid,
          email: emailController?.text,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: selectedGender.value,
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: selectedStatus.value,
          zone: selectedZone.value,
          houseStreet: houseStreetController?.text,
          residency: await taskSnapshot.ref.getDownloadURL(),
        );        
      } else {
        resident = ResidentModel (
          uid: uid,
          email: emailController?.text,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: selectedGender.value,
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: selectedStatus.value,
          zone: selectedZone.value,
          houseStreet: houseStreetController?.text,
        );
      }
      await _service.createResident(resident.toMap());
    } catch(exception) {
      debugPrint("SignUpController Invalid $exception");
      onShowAlert("Error", "Please Try again $exception");
    } finally {
      if (Get.isDialogOpen == true) { Get.back(); }
      _launchLogin();
    }
  }

  Future<void> _addStaff(String? uid) async {
    debugPrint("SignUpController _addStaff");
    try {
      _auth.sendEmailVerification(() {}, (firebaseException){}, (exception) {});
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(residencyFile);
      final StaffModel staff;
      if (taskSnapshot != null && taskSnapshot.state == TaskState.success) {
        staff = StaffModel (
          uid: uid,
          email: emailController?.text,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: selectedGender.value,
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: selectedStatus.value,
          zone: selectedZone.value,
          houseStreet: houseStreetController?.text,
          residency: await taskSnapshot.ref.getDownloadURL(),
        );        
      } else {
        staff = StaffModel (
          uid: uid,
          email: emailController?.text,
          first: firstNameController?.text,
          last: lastNameController?.text,
          middle: middleNameController?.text,
          sex: selectedGender.value,
          age: ageController?.text,
          birth: birthdateController.value?.text,
          contact: contactNumberController?.text,
          status: selectedStatus.value,
          zone: selectedZone.value,
          houseStreet: houseStreetController?.text,
        );
      }
      await _service.createStaff(staff.toMap());
    } catch(exception) {
      debugPrint("SignUpController Invalid $exception");
      onShowAlert("Error", "Please Try again $exception");
    } finally {
      if (Get.isDialogOpen == true) { Get.back(); }
      _launchLogin();
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
    residencyFile = file;
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
      residencyFile = PlatformFile (
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
  void _launchLogin() {
    debugPrint("SignUpController _launchLogin");
    Get.offAndToNamed(Routes.LOGIN);
  }
  
  @override
  void onClose() {
    debugPrint("SignUpController onClose");
    super.onClose();
  }
}