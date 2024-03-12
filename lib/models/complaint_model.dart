import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {

  ComplaintModel ( {
    this.id,
    this.uid,
    this.urgency,
    this.location,
    this.narrative,
    this.attacthment,
    this.previousActionTaken,
    this.witnessName,
    this.witnessContact,
    this.resolutionRequest,
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
  final String? uid;
  final String? urgency;
  final String? location;
  final String? narrative;
  final String? attacthment;
  final String? previousActionTaken;
  final String? witnessName;
  final String? witnessContact;
  final String? resolutionRequest;
  final String? photo;
  final String? name;
  final String? zone;
  final String? type;
  final String? date;
  final String? status;

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel (
      id : json[Constants.ID],
      uid : json[Constants.UID].toString(),
      urgency : json[Constants.URGENCY].toString(),
      location : json[Constants.LOCATION].toString(),
      narrative : json[Constants.NARRATIVE].toString(),
      attacthment : json[Constants.ATTACHMENT].toString(),
      previousActionTaken : json[Constants.PAT].toString(),
      witnessName : json[Constants.WITNESSNAME].toString(),
      witnessContact : json[Constants.WITNESSCONTACT].toString(),
      resolutionRequest : json[Constants.RESOLUTIONREQUEST].toString(),
      photo : json[Constants.PHOTO].toString(),
      name : json[Constants.NAME].toString(),
      zone : json[Constants.ZONE].toString(),
      type : json[Constants.TYPE].toString(),
      date : json[Constants.DATEINCIDENT].toString(),
      status : json[Constants.STATUS].toString(),
    );
  }

  factory ComplaintModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return ComplaintModel (
      id : snapshot.id.toString(),
      uid : data[Constants.UID],
      urgency : data[Constants.URGENCY],
      location : data[Constants.LOCATION],
      narrative : data[Constants.NARRATIVE],
      attacthment : data[Constants.ATTACHMENT],
      previousActionTaken : data[Constants.PAT],
      witnessName : data[Constants.WITNESSNAME],
      witnessContact : data[Constants.WITNESSCONTACT],
      resolutionRequest : data[Constants.RESOLUTIONREQUEST],
      photo : data [Constants.PHOTO],
      name : data [Constants.NAME],
      zone : data [Constants.ZONE],
      type : data [Constants.TYPE],
      status : data [Constants.STATUS],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.UID: uid,
    Constants.URGENCY: urgency,
    Constants.LOCATION: location,
    Constants.NARRATIVE: narrative,
    Constants.ATTACHMENT: attacthment,
    Constants.PAT: previousActionTaken,
    Constants.WITNESSNAME: witnessName,
    Constants.WITNESSCONTACT: witnessContact,
    Constants.RESOLUTIONREQUEST: resolutionRequest,
    Constants.PHOTO: photo,
    Constants.NAME: name,
    Constants.ZONE: zone,
    Constants.TYPE: type,
    Constants.STATUS: status,
  };

  Map<String, dynamic> toJson() {
    return {
      Constants.ID : id,
      Constants.UID: uid,
      Constants.URGENCY: urgency,
      Constants.LOCATION: location,
      Constants.NARRATIVE: narrative,
      Constants.ATTACHMENT: attacthment,
      Constants.PAT: previousActionTaken,
      Constants.WITNESSNAME: witnessName,
      Constants.WITNESSCONTACT: witnessContact,
      Constants.RESOLUTIONREQUEST: resolutionRequest,
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