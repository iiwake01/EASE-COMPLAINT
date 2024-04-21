import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  NotificationModel({
    this.id,
    this.uid,
    this.complaintId,
    //this.title,
    this.message,
    this.dateFilled,
    this.lastUpdate,
    this.hasRead,
  });

  final String? id;
  final String? uid;
  final String? complaintId;
  //final String? title;
  final String? message;
  // final DateTime? dateFilled, lastUpdate;
  final Timestamp? dateFilled, lastUpdate;
  final bool? hasRead;

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return NotificationModel(
      id: snapshot.id.toString(),
      uid: data[Constants.UID],
      complaintId: data[Constants.COMPLIANTID],
      message: data[Constants.MESSAGE],
      dateFilled: data[Constants.DATEFILLED] as Timestamp?,
      lastUpdate: data[Constants.DATELASTUPDATED] as Timestamp?,
      hasRead: data[Constants.HASREAD],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.UID: uid,
    Constants.COMPLIANTID: complaintId,
    //Constants.LOCATION: title,
    Constants.MESSAGE: message,
    Constants.DATEFILLED: dateFilled,
    Constants.DATELASTUPDATED: lastUpdate,
    Constants.HASREAD: hasRead,
  };

  @override
  String toString() {
    return "NotificationModel uid $uid complaintId $complaintId dateFilled $dateFilled lastUpdate $lastUpdate hasRead $hasRead" ?? super.toString();
  }
}