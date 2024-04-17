import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsListController extends BaseController {

  ResidentsListController(this._auth, this._service,) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirebaseAuthService _auth;
  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ResidentModel> _residentList = List<ResidentModel>.empty().obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
    _fetch();
    onTextChangeListener();
  }

  void onTextChangeListener() {
    String previousText = '';
    searchController.addListener(() {
      debugPrint("SearchController text: ${searchController.text}");
      debugPrint("Previous text: $previousText");
      debugPrint("SearchController isNotBlank ${searchController.text.trim().isNotEmpty}");
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

  Future<void> _fetch() async {
    try {
      _isLoading(true);
      if (checkSession(_auth)) {
        final List<ResidentModel> snapshot = await _service.getResidents();
        _residentList.assignAll(snapshot);
      } else {
        _residentList.clear();
      }
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
      debugPrint("ResidentsListController fetch $exception");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> _filter() async {
    try {
      _isLoading(true);
      final snapshot = await _service.getResidents();
      if (snapshot.isNotEmpty) {
        _residentList.assignAll(snapshot);
      } else if (snapshot.isEmpty) {
        _residentList.clear();
      }
      final List<ResidentModel> filtered = _residentList.where((model) => 
        (model.first?.toLowerCase()?.contains(searchController.text.toLowerCase()) ?? false) ||
        (model.last?.toLowerCase()?.contains(searchController.text.toLowerCase()) ?? false) ||
        (model.age?.contains(searchController.text) ?? false) ||
        (model.zone?.toLowerCase()?.contains(searchController.text.toLowerCase()) ?? false))
      .toList();
      _residentList.assignAll(filtered);
    } catch (exception) {
      onShowAlert("Error", "Filter Failed");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> remove(ResidentModel? model) async {
    _service.deleteResident(model);
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  List<ResidentModel> getList() {
    return _residentList;
  }

  void launchView(final String? uid) {
    if (checkSession(_auth)) {
      Get.toNamed(Routes.RESIDENTINFORMATION, arguments: uid);
    }
  }

  @override
  void onClose() {
    debugPrint("ResidentsListController onClose");
    super.onClose();
    searchController.dispose();
  }
}