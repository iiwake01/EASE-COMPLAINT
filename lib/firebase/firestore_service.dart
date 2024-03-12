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
}