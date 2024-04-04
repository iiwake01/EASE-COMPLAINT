import 'package:app/models/complaint_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  final dbFirestore = FirebaseFirestore.instance;

  Future<void> _create(String collectionPath, Map<String, dynamic> data) async {
    await dbFirestore.collection(collectionPath).add(data);
  }

  Future<void> createResident(Map<String, dynamic> data) async {
    await _create("residents", data);
  }

  Future<void> createComplaint(Map<String, dynamic> data) async {
    await _create("complaints", data);
  }

  Future<void> createStaff(Map<String, dynamic> data) async {
    await _create("staffs", data);
  }

  Future<void> createNotification(Map<String, dynamic> data) async {
    await _create("notifications", data);
  }

  Future<void> updateResident(ResidentModel? model) async {
    if (model != null) {
      await dbFirestore
          .collection("residents")
          .doc(model.id)
          .update(model.toMap());
    } else {
      throw Exception("ResidentModel is Null");
    }
  }

  Future<void> updateComplaint(ComplaintModel? model) async {
    if (model != null) {
      await dbFirestore
          .collection("complaints")
          .doc(model.id)
          .update(model.toMap());
    } else {
      throw Exception("ComplaintModel is Null");
    }
  }

  Future<void> updateStaff(StaffModel? model) async {
    if (model != null) {
      await dbFirestore
          .collection("staffs")
          .doc(model.id)
          .update(model.toMap());
    } else {
      throw Exception("StaffModel is Null");
    }
  }

  Future<ResidentModel?> getResident(String? uid) async {
    if (uid == null) return null;
    final response = await dbFirestore
        .collection("residents")
        .where(Constants.UID, isEqualTo: uid)
        .get();
    return response.docs
        .map((doc) => ResidentModel.fromSnapshot(doc))
        .toList()
        .firstOrNull;
  }

  Future<StaffModel?> getStaff(String? uid) async {
    if (uid == null) return null;
    final response = await dbFirestore
        .collection("staffs")
        .where(Constants.UID, isEqualTo: uid)
        .get();
    return response.docs
        .map((doc) => StaffModel.fromSnapshot(doc))
        .toList()
        .firstOrNull;
  }

  Future<List<ResidentModel>> getResidents() async {
    final response = await dbFirestore.collection("residents").get();
    return response.docs.map((doc) => ResidentModel.fromSnapshot(doc)).toList();
  }

  Future<List<ComplaintModel>> getResidentComplaints(String? uid) async {
    if (uid == null) return List.empty();
    final response = await dbFirestore
        .collection("complaints")
        .where(Constants.UID, isEqualTo: uid)
        .get();
    return response.docs
        .map((doc) => ComplaintModel.fromSnapshot(doc))
        .toList();
  }

  Future<ComplaintModel?> getComplaint(String? id) async {
    final response = await dbFirestore.collection("complaints").doc(id).get();
    return ComplaintModel.fromSnapshot(response);
  }

  Future<List<ComplaintModel>> getComplaints() async {
    final response = await dbFirestore.collection("complaints").get();
    return response.docs
        .map((doc) => ComplaintModel.fromSnapshot(doc))
        .toList();
  }

  Future<int> getComplaintsStatus(String status) async {
    final response = await dbFirestore.collection("complaints").where(Constants.STATUS, isEqualTo: status).get();
    return response.docs.length;
  }
}
