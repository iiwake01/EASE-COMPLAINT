import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {

  NotificationModel ( {
    this.id,
    this.uid,
    this.complaintId,
    //this.title,
    //this.message,
    this.dateTime,
    this.hasRead,
  });

  final String? id;
  final String? uid;
  final String? complaintId;
  //final String? title;
  //final String? message;
  final DateTime? dateTime;
  final bool? hasRead;

   factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return NotificationModel (
      id : snapshot.id.toString(),
      uid : data [Constants.UID],
      complaintId : data [Constants.COMPLIANTID],
      dateTime : DateTime.parse(data["date"]),
      hasRead : data[Constants.MIDDLE],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.UID: uid,
    Constants.COMPLIANTID: complaintId,
    //Constants.LOCATION: title,
    //Constants.NARRATIVE: message,
    Constants.DATEFILLED: dateTime,
    Constants.HASREAD: hasRead,
  };
}