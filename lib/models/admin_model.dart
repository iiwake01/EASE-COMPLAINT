import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String? id;
  final String? uid;
  final String? email;

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json[Constants.ID],
      uid: json[Constants.UID],
      email: json[Constants.EMAIL],
    );
  }

  factory AdminModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AdminModel(
      id: snapshot.id.toString(),
      uid: data[Constants.UID],
      email: data[Constants.EMAIL],
    );
  }
  Map<String, dynamic> toMap() => {
        Constants.UID: uid,
        Constants.EMAIL: email,
      };

  Map<String, dynamic> toJson() {
    return {
      Constants.UID: uid,
      Constants.EMAIL: email,
    };
  }

  bool isSameEmail(AdminModel newModel) {
    return id == newModel.id && email == newModel.email;
  }

  bool isNotSameEmail(AdminModel newModel) {
    return id == newModel.id && email != newModel.email;
  }

  @override
  String toString() {
    return "StaffModel id $id, email $email" ?? super.toString();
  }

  AdminModel({this.id, this.uid, this.email});
}
