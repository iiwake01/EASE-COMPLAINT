import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/dialog_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StaffController extends BaseController {
  StaffController(
    this._auth,
    this._service,
  ) {
    debugPrint("StaffController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  TextEditingController? emailController,
      passwordController,
      confirmPasswordController,
      firstNameController,
      lastNameController,
      middleNameController,
      positionController,
      contactNumberController;
  final RxList<StaffModel> _staffList = List<StaffModel>.empty().obs;
  final TextEditingController searchController = TextEditingController();
  final Rx<TextEditingController?> birthdateController =
      TextEditingController().obs;
  final Rx<StaffModel?> _staffInformation = StaffModel().obs;
  final arguments = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("StaffController onInit");
  }

  Future<void> onInitTextEditingControllers() async {
    //TODO: Use this for NewStaffAccountCreationPage
    debugPrint("StaffController onInitTextEditingControllers");
    firstNameController = TextEditingController();
    emailController = TextEditingController();
    lastNameController = TextEditingController();
    contactNumberController = TextEditingController();
    middleNameController = TextEditingController();
    positionController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  Future<void> validate() async {
    //TODO: add some validations for the inputs needed!
    //final isAgeInvalid = age == null || age.isBlank == true || age.isNegative == true || age == 0;
    final isPhoneValid = contactNumberController?.text.isPhoneNumber;
    final isfirstNameValid = firstNameController?.text
        .split(' ')
        .where((first) => first.isBlank == true || first.isAlphabetOnly != true)
        .isEmpty;
    final islastNameValid = lastNameController?.text
        .split(' ')
        .where((last) => last.isBlank == true || last.isAlphabetOnly != true)
        .isEmpty;
    final isMiddleNameValid = middleNameController?.text
        .split(' ')
        .where(
            (middle) => middle.isBlank == true || middle.isAlphabetOnly != true)
        .isEmpty;
    debugPrint(
        "StaffController validate isPhoneValid $isPhoneValid isfirstNameValid $isfirstNameValid islastNameValid $islastNameValid isMiddleNameValid $isMiddleNameValid");
    if (isfirstNameValid == false ||
        islastNameValid == false ||
        isMiddleNameValid == false) {
      onShowAlert("Error", "Name is Invalid");
      debugPrint("StaffController Name is Invalid");
    } else if (passwordController?.text != confirmPasswordController?.text) {
      onShowAlert("Error", "Password and Confrim Password is not equal");
      debugPrint(
          "StaffController Password and Confrim Password is not equal ${passwordController?.text} ${confirmPasswordController?.text}");
    } else if (isPhoneValid == false) {
      onShowAlert("Error", "Contact is invalid");
      debugPrint("StaffController Contact is invalid");
    } else {
      onShowAlert("Creating", "Now Creating Account");
      DialogWidget.loadingDialog();
      _createAccount();
    }
  }

  Future<void> _createAccount() async {
    debugPrint("StaffController createAccount");
    _auth.registerCredential(
      emailController?.text ?? "",
      passwordController?.text ?? "",
      (userCredential) =>
          debugPrint('StaffController UserCredential $userCredential'),
      (user) =>
          debugPrint('StaffController User Id ${user!.uid} registered: $user '),
      (uid) {
        _addStaff(uid);
      },
      (firebaseAuthException) {
        debugPrint(
            'StaffController createAccount FirebaseAuthException ${firebaseAuthException.toString()}}');
        if (firebaseAuthException.code == 'weak-password') {
          onShowAlert("Error!", 'The password provided is too weak.');
        } else if (firebaseAuthException.code == 'email-already-in-use') {
          onShowAlert("Error!", 'The account already exists for that email.');
        }
      },
      (exception) {
        debugPrint(
            'StaffController registerCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      },
    );
  }

  Future<void> _addStaff(String? uid) async {
    debugPrint("StaffController _addStaff");
    try {
      _auth.sendEmailVerification(
          () {}, (firebaseException) {}, (exception) {});
      //TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(residencyFile);
      final StaffModel staff;
      /*
      if (taskSnapshot != null && taskSnapshot.state == TaskState.success) {
        staff = StaffModel(
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
      */
      staff = StaffModel(
        uid: uid,
        email: emailController?.text,
        first: firstNameController?.text,
        last: lastNameController?.text,
        middle: middleNameController?.text,
        birth: birthdateController.value?.text,
        contact: contactNumberController?.text,
        position: positionController?.text,
      );
      //}
      await _service.createStaff(staff.toMap());
    } catch (exception) {
      debugPrint("StaffController Invalid $exception");
      onShowAlert("Error", "Please Try again $exception");
    } finally {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      DialogWidget.staffCreatedDialog(
        emailController?.text,
        passwordController?.text,
        () {
          if (Get.isDialogOpen == true) {
            Get.back();
          }
          Get.offAndToNamed(Routes.ADMINHOME);
        },
      );
    }
  }

  //#region StaffAccountsPage Methods
  Future<void> onInitList() async {
    debugPrint("StaffController onInitList");
    _fetch();
    onTextChangeListener();
  }

  void onTextChangeListener() {
    String previousText = '';
    searchController.addListener(() {
      debugPrint("SearchController text: ${searchController.text}");
      debugPrint("Previous text: $previousText");
      debugPrint(
          "SearchController isNotBlank ${searchController.text.trim().isNotEmpty}");
      if (searchController.text.trim() != previousText) {
        previousText = searchController.text.trim();
        if (searchController.text.trim().isNotEmpty) {
          _filter();
        } else {
          _fetch();
        }
      }
    });
  }

  Future<void> fetchArguments() async {
    try {
      _isLoading(true);

      if (checkSession(_auth) && arguments != null && arguments is String) {
        final StaffModel? snapshot = await _service.getStaff(arguments);
        _staffInformation(snapshot);
      } else {
        _staffInformation();
      }
    } catch (exception) {
      onShowAlert("Error:", "Error fetching staffInformation");
      debugPrint("StaffInformation fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> _fetch() async {
    try {
      _isLoading(true);

      if (checkSession(_auth)) {
        final List<StaffModel> snapshot = await _service.getStaffs();
        _staffList.assignAll(snapshot);
      } else {
        _staffList.clear();
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("StaffController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> _filter() async {
    try {
      _isLoading(true);
      final snapshot = await _service.getStaffs();
      if (snapshot.isNotEmpty) {
        _staffList.assignAll(snapshot);
      } else if (snapshot.isEmpty) {
        _staffList.clear();
      }
      final List<StaffModel> filtered = _staffList
          .where((model) =>
              (model.first
                      ?.toLowerCase()
                      ?.contains(searchController.text.toLowerCase()) ??
                  false) ||
              (model.last
                      ?.toLowerCase()
                      ?.contains(searchController.text.toLowerCase()) ??
                  false) ||
              (model.age?.contains(searchController.text) ?? false) ||
              (model.zone
                      ?.toLowerCase()
                      ?.contains(searchController.text.toLowerCase()) ??
                  false))
          .toList();
      _staffList.assignAll(filtered);
    } catch (exception) {
      onShowAlert("Error", "Filter Failed");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> onRemove(StaffModel? model) async {
    DialogWidget.removeDialog(
        AppLocalizations.of(Get.context!)
            .translate('are_you_sure_you_want_to_delete_this_account_'),
        AppLocalizations.of(Get.context!).translate('yes'),
        AppLocalizations.of(Get.context!).translate('no'),
        () => _remove(model), () {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    });
  }

  Future<void> _remove(StaffModel? model) async {
    _service.deleteStaff(model);
    _fetch();
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  List<StaffModel> observeList() {
    return _staffList;
  }

  void launchView(final String? uid) {
    if (checkSession(_auth)) {
      Get.toNamed(Routes.STAFFINFORMATION, arguments: uid);
      debugPrint("uid: $uid");
    }
  }

  Rx<StaffModel?> observeStaffInformation() {
    return _staffInformation;
  }

  //#endregion
  @override
  void onClose() {
    debugPrint("StaffController onClose");
    super.onClose();
    searchController.dispose();
  }
}
