import 'package:app/controllers/base_controller.dart';
import 'package:app/controllers/protocol_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController implements ProtocolController {

  ProfileController(this._auth, this._service, this._storage) {
    debugPrint("ProfileController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  PageController pageController = new PageController(initialPage: 0);
  final RxBool isLoading = false.obs;
  TextEditingController? firstNameController, lastNameController, middleNameController, genderController, 
  ageController, contactNumberController,  statusController, zoneController, houseStreetController, emailController;
  //final List<String> genderList = [AppLocalizations.of(Get.context!).translate('sex'), AppLocalizations.of(Get.context!).translate('male'), AppLocalizations.of(Get.context!).translate('female')];
  //final List<String> statusList = [AppLocalizations.of(Get.context!).translate('status'), AppLocalizations.of(Get.context!).translate('single'),];
  //final List<String> zoneList = [AppLocalizations.of(Get.context!).translate('select_the_zone_your_reside_in_'), AppLocalizations.of(Get.context!).translate('zone_6'),];
  //RxString selectedGender = "".obs, selectedStatus = "".obs, selectedZone = "".obs, liveFile = "".obs;
  final Rx<TextEditingController?> birthdateController = TextEditingController().obs;

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

  @override
  Future<void> checkSession() async {
    if(_auth.isUserSignedIn() == false) {
      debugPrint("ProfileController is user signed in ${_auth.isUserSignedIn()}");
      DialogWidget.timeoutDialog (
        "Session Expired Please Login again", 
        AppLocalizations.of(Get.context!).translate('yes'), 
        () { Get.offAndToNamed(Routes.LOGIN); }
      );
    }
  }

  Future<void> fetch() async {
    try {
      debugPrint("ProfileController fetch");
      isLoading(true);
      final User? user = _auth.getUser();
      final ResidentModel? resident = await _service.getResident(user?.uid ?? "007");
      final StaffModel? staff = await _service.getStaff(user?.uid ?? "007");
      debugPrint("ProfileController user uid ${user?.uid}");
      debugPrint("ProfileController resident ${resident?.toString()}");
      debugPrint("ProfileController staff ${staff?.toString()}");
      firstNameController = TextEditingController(text: resident?.first ?? staff?.first ?? "");
      lastNameController = TextEditingController(text: resident?.last ?? staff?.last ?? "");
      middleNameController = TextEditingController(text: resident?.middle ?? staff?.middle ?? "");
      genderController = TextEditingController(text: resident?.sex ?? staff?.sex ?? "");
      ageController = TextEditingController(text: resident?.age ?? staff?.age ?? "");
      birthdateController( TextEditingController(text: resident?.birth ?? staff?.birth ?? "") );
      contactNumberController = TextEditingController(text: resident?.contact ?? staff?.contact ?? "");
      statusController = TextEditingController(text: resident?.status ?? staff?.status ?? "");
      zoneController = TextEditingController(text: resident?.zone ?? staff?.zone ?? "");
      houseStreetController = TextEditingController(text: resident?.houseStreet ?? staff?.houseStreet);
      emailController = TextEditingController(text: resident?.email ?? staff?.email);
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
      final ResidentModel? resident = await _service.getResident(user?.uid ?? "007");
      final StaffModel? staff = await _service.getStaff(user?.uid ?? "007");
      if (resident != null) {
        final ResidentModel updatedModel = ResidentModel (
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

  void launchReadOnly() {
    debugPrint("ProfileController launchReadOnly");
    _updateProfile();
    pageController.jumpToPage(0);
  }

  void launchEditMode() {
    debugPrint("ProfileController launchEditMode");
    isLoading(true);
    pageController.jumpToPage(1);
    isLoading(false);
  }

  @override
  void onClose() {
    debugPrint("ProfileController onClose");
    super.onClose();
  }
}