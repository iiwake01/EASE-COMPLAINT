import 'package:app/models/complaint_model.dart';
import 'package:app/models/resident_model.dart';
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
    await _create("staff", data);
  }

   Future<ResidentModel?> getResident(String uid) async {
    final response = await dbFirestore.collection("residents").where(Constants.UID, isEqualTo: uid).get();
    return response.docs.map((doc) => ResidentModel.fromSnapshot(doc)).toList().firstOrNull;
  }

  Future<List<ResidentModel>> getResidents() async {
    final response = await dbFirestore.collection("residents").get();
    return response.docs.map((doc) => ResidentModel.fromSnapshot(doc)).toList();
  }

  Future<List<ComplaintModel>> getResidentComplaints(String uid) async {
    final response = await dbFirestore.collection("complaints").where(Constants.UID, isEqualTo: uid).get();
    return response.docs.map((doc) => ComplaintModel.fromSnapshot(doc)).toList();
  }

  Future<List<ComplaintModel>> getComplaints() async {
    final response = await dbFirestore.collection("complaints").get();
    return response.docs.map((doc) => ComplaintModel.fromSnapshot(doc)).toList();
  }
}