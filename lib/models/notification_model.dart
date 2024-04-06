import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {

  NotificationModel ( {
    this.id,
    this.uid,
    this.complaintId,
    //this.title,
    //this.message,
    this.dateFilled,
    this.lastUpdate,
    this.hasRead,
  });

  final String? id;
  final String? uid;
  final String? complaintId;
  //final String? title;
  //final String? message;
  final DateTime? dateFilled, lastUpdate;
  final bool? hasRead;

   factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return NotificationModel (
      id : snapshot.id.toString(),
      uid : data [Constants.UID],
      complaintId : data [Constants.COMPLIANTID],
      dateFilled : DateTime.parse(data[Constants.DATEFILLED]),
      lastUpdate : DateTime.parse(data[Constants.DATELASTUPDATED]),
      hasRead : data[Constants.HASREAD],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.UID: uid,
    Constants.COMPLIANTID: complaintId,
    //Constants.LOCATION: title,
    //Constants.NARRATIVE: message,
    Constants.DATEFILLED: dateFilled,
    Constants.DATELASTUPDATED: lastUpdate,
    Constants.HASREAD: hasRead,
  };
}