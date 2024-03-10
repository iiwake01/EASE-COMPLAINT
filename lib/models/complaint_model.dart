import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {

  ComplaintModel ( {
    this.id,
    this.photo,//Get from Resident User
    this.name,//Get from Resident User (first middle last)
    this.zone,//Get from Resident User
    this.type,
    this.date,
    this.status,
    //this.phone,
    //this.email,
    //this.age,
  } );
  
  final String? id;
  final String? photo;
  final String? name;
  final String? zone;
  final String? type;
  final String? date;
  final String? status;

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel (
      id : json[Constants.ID],
      photo : json[Constants.PHOTO].toString(),
      name : json[Constants.NAME].toString(),
      zone : json[Constants.ZONE].toString(),
      type : json[Constants.TYPE].toString(),
      status : json[Constants.STATUS].toString(),
    );
  }

  factory ComplaintModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return ComplaintModel (
      id : snapshot.id.toString(),
      photo : data [Constants.PHOTO],
      name : data [Constants.NAME],
      zone : data [Constants.ZONE],
      type : data [Constants.TYPE],
      status : data [Constants.STATUS],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.PHOTO: photo,
    Constants.NAME: name,
    Constants.ZONE: zone,
    Constants.TYPE: type,
    Constants.STATUS: status,
  };

  Map<String, dynamic> toJson() {
    return {
      Constants.ID : id,
      Constants.PHOTO : photo,
      Constants.NAME : name,
      Constants.ZONE : zone,
      Constants.TYPE : type,
      Constants.STATUS : status,
    };
  }

  bool isSamePhoto(ComplaintModel newModel) {
    return id == newModel.id && photo == newModel.photo;
  }

  bool isNotSamePhoto(ComplaintModel newModel) {
    return id == newModel.id && photo != newModel.photo;
  }

  bool isSameName(ComplaintModel newModel) {
    return id == newModel.id && name == newModel.name;
  }

  bool isNotSameName(ComplaintModel newModel) {
    return id == newModel.id && name != newModel.name;
  }

  bool isSameZone(ComplaintModel newModel) {
    return id == newModel.id && zone == newModel.zone;
  }

  bool isNotSameZone(ComplaintModel newModel) {
    return id == newModel.id && zone != newModel.zone;
  }

  bool isSameType(ComplaintModel newModel) {
    return id == newModel.id && type == newModel.type;
  }

  bool isNotSameType(ComplaintModel newModel) {
    return id == newModel.id && type != newModel.type;
  }

  bool isSameStatus(ComplaintModel newModel) {
    return id == newModel.id && status == newModel.status;
  }

  bool isNotSameStatus(ComplaintModel newModel) {
    return id == newModel.id && status != newModel.status;
  }

  bool isSameContent(ComplaintModel newModel) {
    return isSamePhoto(newModel) &&
    isSameName(newModel) &&
    isSameZone(newModel) &&
    isSameType(newModel) &&
    isSameStatus(newModel);
  }

  bool isNotSameContent(ComplaintModel newModel) {
    return !isSameContent(newModel);
  }

  @override
  String toString() {
    return "ComplaintModel id $id, photo $photo, name $name, zone $zone, type $type, status $status" ?? super.toString();
  }
}