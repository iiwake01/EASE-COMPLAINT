import 'package:app/controllers/base_controller.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/models/resident_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResidentsListController extends BaseController {

  ResidentsListController(FirestoreService this._service,) {
    debugPrint("ResidentsListController Constructor");
  }

  final FirestoreService _service;
  final RxBool _isLoading = false.obs;
  final RxList<ResidentModel> _residentList = new List<ResidentModel>.empty().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ResidentsListController onInit");
    fetch();
  }

  Future<void> fetch() async {
    try {
      _isLoading(true);
      _residentList.clear();
      _residentList.add( ResidentModel(photo: "Photo 0", last: "Last 0", first: "First 0", zone: "Zone 0", age: "0") );
      _residentList.add( ResidentModel(photo: "Photo 1", last: "Last 1", first: "First 1", zone: "Zone 1", age: "1") );
      _residentList.add( ResidentModel(photo: "Photo 2", last: "Last 2", first: "First 2", zone: "Zone 2", age: "2") );
      _residentList.add( ResidentModel(photo: "Photo 3", last: "Last 3", first: "First 3", zone: "Zone 3", age: "3") );
      _residentList.add( ResidentModel(photo: "Photo 4", last: "Last 4", first: "First 4", zone: "Zone 4", age: "4") );
      _residentList.add( ResidentModel(photo: "Photo 5", last: "Last 5", first: "First 5", zone: "Zone 5", age: "5") );
    } catch (exception) {
      onShowAlert("Error", "Fetch Failed");
    } finally {
      _isLoading(false);
    }
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  List<ResidentModel> getList() {
    return _residentList;
  }
  
  @override
  void onClose() {
    debugPrint("ResidentsListController onClose");
    super.onClose();
  }
}