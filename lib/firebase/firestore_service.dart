import 'package:app/models/admin_model.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/notification_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/models/top_complaint_model.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  final dbFirestore = FirebaseFirestore.instance;

  Future<DocumentReference> _create(String collectionPath, Map<String, dynamic> data) async {
    return await dbFirestore.collection(collectionPath).add(data);
  }

  Future<void> createResident(Map<String, dynamic> data) async {
    await _create("residents", data);
  }

  Future<DocumentReference> createComplaint(Map<String, dynamic> data) async {
    return await _create("complaints", data);
  }

  Future<void> createStaff(Map<String, dynamic> data) async {
    await _create("staffs", data);
  }

  Future<void> createAdmin(Map<String, dynamic> data) async {
    await _create("admins", data);
  }

  Future<void> createNotification(Map<String, dynamic> data) async {
    await _create("notifications", data);
  }

 Future<void> _update(String collectionPath, String? id, Map<String, dynamic> data) async {
    await dbFirestore.collection(collectionPath).doc(id).update(data);
  }

  Future<void> updateResident(ResidentModel? model) async {
    if (model != null) _update("residents", model.id, model.toMap()); 
    else throw Exception("ResidentModel is Null");
  }

  Future<void> updateComplaint(ComplaintModel? model) async {
    if (model != null) _update("complaints", model.id, model.toMap()); 
    else throw Exception("ComplaintModel is Null");
  }

  Future<void> updateStaff(StaffModel? model) async {
    if (model != null) _update("staffs", model.id, model.toMap()); 
    else throw Exception("StaffModel is Null");
  }

  Future<void> updateNotification(NotificationModel? model) async {
    if (model != null) _update("notifications", model.id, model.toMap());
     else throw Exception("NotificationModel is Null");
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _get(String collectionPath, {String? uid}) async {
    if (uid != null) {
      return await dbFirestore.collection(collectionPath).where(Constants.UID, isEqualTo: uid).get();
    } else {
      return await dbFirestore.collection(collectionPath).get();
    }
  }

  Future<ResidentModel?> getResident(String? uid) async {
    if (uid == null) return null;
    final response = await _get("residents", uid: uid);
    return response.docs.map((doc) => ResidentModel.fromSnapshot(doc)).toList().firstOrNull;
  }

  Future<StaffModel?> getStaff(String? uid) async {
    if (uid == null) return null;
    final response = await _get("staffs", uid: uid);
    return response.docs.map((doc) => StaffModel.fromSnapshot(doc)).toList().firstOrNull;
  }

  Future<List<StaffModel>> getStaffs() async {
    final response = await _get("staffs");
    return response.docs.map((doc) => StaffModel.fromSnapshot(doc)).toList();
  }

  Future<AdminModel?> getAdmin(String? uid) async {
    if (uid == null) return null;
    final response = await _get("admins", uid: uid);
    return response.docs.map((doc) => AdminModel.fromSnapshot(doc)).toList().firstOrNull;
  }

  Future<List<ResidentModel>> getResidents() async {
    final response = await _get("residents");
    return response.docs.map((doc) => ResidentModel.fromSnapshot(doc)).toList();
  }

  Future<List<ComplaintModel>> getResidentComplaints(String? uid) async {
    if (uid == null) return List.empty();
    final response = await _get("complaints", uid: uid);
    return response.docs.map((doc) => ComplaintModel.fromSnapshot(doc)).toList();
  }

  Future<ComplaintModel?> getComplaint(String? id) async {
    if (id == null) return null;
    final response = await dbFirestore.collection("complaints").doc(id).get();
    return ComplaintModel.fromSnapshot(response);
  }

  Future<List<ComplaintModel>> getComplaints() async {
    final response = await _get("complaints");
    return response.docs
        .map((doc) => ComplaintModel.fromSnapshot(doc))
        .toList();
  }

  Future<List<ComplaintModel>> getComplaintsStatus(String? status, String? uid) async {
    final QuerySnapshot<Map<String, dynamic>> response;
    if (uid != null) {
      response = await dbFirestore.collection("complaints").where(Constants.STATUS, isEqualTo: status).where(Constants.UID, isEqualTo: uid).get();
    } else {
      response = await dbFirestore.collection("complaints").where(Constants.STATUS, isEqualTo: status).get();
    }
    return response.docs.map((doc) => ComplaintModel.fromSnapshot(doc)).toList();
  }

  Future<int> getComplaintsStatusCount(String status, String? uid) async {
    final QuerySnapshot<Map<String, dynamic>> response;
    if (uid != null) {
      response = await dbFirestore.collection("complaints").where(Constants.STATUS, isEqualTo: status).where(Constants.UID, isEqualTo: uid).get();
    } else {
      response = await dbFirestore.collection("complaints").where(Constants.STATUS, isEqualTo: status).get();
    }
    return response.docs.length;
  }

  Future<List<ComplaintModel>> getComplaintsType(String? type, String? uid) async {
    final QuerySnapshot<Map<String, dynamic>> response;
    if (uid != null) {
      response = await dbFirestore
          .collection("complaints")
          .where(Constants.STATUS, isEqualTo: type)
          .where(Constants.UID, isEqualTo: uid)
          .get();
    } else {
      response = await dbFirestore
          .collection("complaints")
          .where(Constants.TYPE, isEqualTo: type)
          .get();
    }
    return response.docs
        .map((doc) => ComplaintModel.fromSnapshot(doc))
        .toList();
  }

  Future<List<TopComplaintModel?>> getComplaintsTop(String? uid) async {
    final QuerySnapshot<Map<String, dynamic>> response = await _get("complaints", uid: uid);
    final int environment, community, disturbance, crime, other;
    final List<TopComplaintModel> topComplaint = [];
    final List<ComplaintModel?> list = response.docs.map((doc) => ComplaintModel.fromSnapshot(doc)).toList();
    environment = list.where((complaint) =>complaint?.type ==AppLocalizations.of(Get.context!).translate('environmental_problem')).toList().length;
    community = list.where((complaint) => complaint?.type == AppLocalizations.of(Get.context!).translate('community_conflict')).toList().length;
    disturbance = list.where((complaint) => complaint?.type == AppLocalizations.of(Get.context!).translate('public_disturbance')).toList().length;
    crime = list.where((complaint) => complaint?.type == AppLocalizations.of(Get.context!).translate('crime_related')).toList().length;
    other = list.length - (environment + community + disturbance + crime);
    topComplaint.add(TopComplaintModel(type: AppLocalizations.of(Get.context!).translate('environmental_problem'),quanity: environment));
    topComplaint.add(TopComplaintModel(type: AppLocalizations.of(Get.context!).translate('community_conflict'), quanity: community));
    topComplaint.add(TopComplaintModel(type: AppLocalizations.of(Get.context!).translate('public_disturbance'), quanity: disturbance));
    topComplaint.add(TopComplaintModel(type: AppLocalizations.of(Get.context!).translate('crime_related'), quanity: crime));
    topComplaint.add(TopComplaintModel(type: AppLocalizations.of(Get.context!).translate('other_type_of_problem'), quanity: other));
    topComplaint.sort((modelA, modelB) => modelB.quanity!.compareTo(modelA.quanity));
    return topComplaint;
  }

  Future<NotificationModel?> getNotification(String? complaintId) async {
    if (complaintId == null) return null;
    final response = await dbFirestore.collection("notifications").where(Constants.COMPLIANTID, isEqualTo: complaintId).get();
    return response.docs.map((doc) => NotificationModel.fromSnapshot(doc)).toList().firstOrNull;
  }

  Future<List<NotificationModel>> getNotifications(String? uid) async {
    if (uid == null) return List.empty();
    final response = await dbFirestore.collection("notifications").where(Constants.UID, isEqualTo: uid).where(Constants.HASREAD, isEqualTo: false).orderBy(Constants.DATELASTUPDATED, descending: true).get();
    return response.docs.map((doc) => NotificationModel.fromSnapshot(doc)).toList();
  }

  Future<int> getNotificationsToday(String? uid) async {
    final DateTime now = DateTime.now();
    final DateTime dateTimeToday = DateTime(now.year, now.month, now.day);
    final DateTime dateTimeTomorrow = dateTimeToday.add(const Duration(days: 1));
    final Timestamp today = Timestamp.fromDate(dateTimeToday);
    final Timestamp tomorrow = Timestamp.fromDate(dateTimeTomorrow);
    try {
      final QuerySnapshot<Map<String, dynamic>> response;
      if (uid != null) {
        response = await dbFirestore.collection("notifications")
            .where(Constants.DATEFILLED, isGreaterThanOrEqualTo: today)
            .where(Constants.DATEFILLED, isLessThan: tomorrow)
            .where(Constants.UID, isEqualTo: uid)
            .get();
      } else {
        response = await dbFirestore
            .collection("notifications")
            .where(Constants.DATEFILLED, isGreaterThanOrEqualTo: today)
            .where(Constants.DATEFILLED, isLessThan: tomorrow)
            .get();
      }
      return response.docs.length;
    } catch (error) {
      debugPrint("FirestoreService getNotificationsToday error: $error");
      return 0;
    }
  }

  Future<void> _delete(String collectionPath, String id) async {
    await dbFirestore.collection(collectionPath).doc(id).delete();
  }
  
  Future<void> deleteResident(ResidentModel? model) async {
    if(model != null) await _delete("residents", model.id!);
    else throw Exception("Error deleting Resident");
  }

  Future<void> deleteStaff(StaffModel? model) async {
    if(model != null) await _delete("staffs", model.id!); 
    else throw Exception("Error deleting Staff");
  }
}