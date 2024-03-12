import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {

  SignUpController(FirebaseAuthService this._auth,) {
    debugPrint("SignUpController Constructor");
  }

  final FirebaseAuthService _auth;
  TextEditingController? emailController, passwordController, confirmPasswordController,
  firstNameController, lastNameController, middleNameController, 
  ageController, contactNumberController, houseStreetController;
  final List<String> genderList = [AppLocalizations.of(Get.context!).translate('sex'), AppLocalizations.of(Get.context!).translate('male'), AppLocalizations.of(Get.context!).translate('female')];
  final List<String> statusList = [AppLocalizations.of(Get.context!).translate('status'), AppLocalizations.of(Get.context!).translate('single'),];
  final List<String> zoneList = [AppLocalizations.of(Get.context!).translate('select_the_zone_your_reside_in_'), AppLocalizations.of(Get.context!).translate('zone_6'),];
  String? selectedGender = null, selectedStatus = null, selectedZone = null;
  final Rx<TextEditingController?> birthdateController = TextEditingController().obs;
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
  }

  Future<void> updateGender(String? gender) async {
    selectedGender = gender;
  }

  Future<void> updateStatus(String? status) async {
    selectedStatus = status;
  }

  Future<void> updateZone(String? zone) async {
    selectedZone = zone;
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
    } if (isReadTerms.isFalse) {
      onShowAlert("Error", "Terms and Conditions need to be check");
      debugPrint("SignUpController Terms and Conditions need to be check");
    } else {
      onShowAlert("Creating", "Now Creating Account");
      _createAccount();
    }
  }

  Future<void> _createAccount() async {
    debugPrint("SignUpController createAccount");
    /*
    _auth.registerCredential(
      emailController?.text ?? "", 
      passwordController?.text ?? "", 
      (userCredential) => debugPrint('SignUpController UserCredential $userCredential'), 
      (user) => debugPrint('SignUpController User Id ${user!.uid} registered: ${user} '), 
      () => _launchLogin(), 
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
    */
  }

  void _launchLogin() {
    debugPrint("LoginController launchLoginStaff");
    Get.offAndToNamed(Routes.LOGIN);
  }
  
  @override
  void onClose() {
    debugPrint("SignUpController onClose");
    super.onClose();
  }
}