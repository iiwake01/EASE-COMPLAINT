import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResidentModel {

  ResidentModel ( {
    this.id,
    this.uid,
    this.photo,
    this.first, 
    this.middle,
    this.last,
    this.sex,
    this.age,
    this.birth,
    this.contact,
    this.status,
    this.zone,
    this.houseStreet,
    this.email,
    this.residency,
    //this.phone,
    //this.email,
    //this.age,
    this.lastLogin,
  } );
  
  final String? id;
  final String? uid;
  final String? photo;
  final String? first;
  final String? middle;
  final String? last;
  final String? sex;
  final String? age;
  final String? birth;
  final String? contact;
  final String? status;
  final String? zone;
  final String? houseStreet;
  final String? email;
  final String? residency;
  final String? lastLogin;

  factory ResidentModel.fromJson(Map<String, dynamic> json) {
    return ResidentModel (
      id : json[Constants.ID],
      uid : json[Constants.UID],
      photo : json[Constants.PHOTO].toString(),
      first : json[Constants.FIRST].toString(),
      middle : json[Constants.MIDDLE].toString(),
      last : json[Constants.LAST].toString(),
      sex : json[Constants.SEX].toString(),
      age : json[Constants.AGE].toString(),
      birth : json[Constants.BIRTH].toString(),
      contact : json[Constants.CONTACT].toString(),
      status : json[Constants.STATUS].toString(),
      zone : json[Constants.ZONE].toString(),
      houseStreet : json[Constants.HOUSESTREET].toString(),
      email : json[Constants.EMAIL].toString(),
      residency : json[Constants.RESIDENCY].toString(),
    );
  }

  factory ResidentModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return ResidentModel (
      id : snapshot.id.toString(),
      uid : data [Constants.UID],
      photo : data [Constants.PHOTO],
      first : data[Constants.FIRST],
      middle : data[Constants.MIDDLE],
      last : data[Constants.LAST],
      sex : data[Constants.SEX],
      age : data[Constants.AGE],
      birth : data[Constants.BIRTH],
      contact : data[Constants.CONTACT],
      status : data[Constants.STATUS],
      zone : data[Constants.ZONE],
      houseStreet : data[Constants.HOUSESTREET],
      email : data[Constants.EMAIL],
      residency : data[Constants.RESIDENCY],
      lastLogin: data[Constants.LASTLOGIN]
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.UID: uid,
    Constants.PHOTO: photo,
    Constants.FIRST: first,
    Constants.MIDDLE: middle,
    Constants.LAST: last,
    Constants.SEX: sex,
    Constants.AGE: age,
    Constants.BIRTH: birth,
    Constants.CONTACT: contact,
    Constants.STATUS: status,
    Constants.ZONE: zone,
    Constants.HOUSESTREET: houseStreet,
    Constants.EMAIL: email,
    Constants.RESIDENCY: residency,
    Constants.LASTLOGIN: lastLogin,
  };

  Map<String, dynamic> toJson() {
    return {
      Constants.ID : id,
      Constants.UID : uid,
      Constants.PHOTO : photo,
      Constants.FIRST: first,
      Constants.MIDDLE: middle,
      Constants.LAST: last,
      Constants.SEX: sex,
      Constants.AGE: age,
      Constants.BIRTH: birth,
      Constants.CONTACT: contact,
      Constants.STATUS: status,
      Constants.ZONE: zone,
      Constants.HOUSESTREET: houseStreet,
      Constants.EMAIL: email,
      Constants.RESIDENCY: residency,
      Constants.LASTLOGIN: lastLogin,
    };
  }

  bool isSamePhoto(ResidentModel newModel) {
    return id == newModel.id && photo == newModel.photo;
  }

  bool isNotSamePhoto(ResidentModel newModel) {
    return id == newModel.id && photo != newModel.photo;
  }

  bool isSameFirst(ResidentModel newModel) {
    return id == newModel.id && first == newModel.first;
  }

  bool isNotSameFirst(ResidentModel newModel) {
    return id == newModel.id && first != newModel.first;
  }

  bool isSameMiddle(ResidentModel newModel) {
    return id == newModel.id && middle == newModel.middle;
  }

  bool isNotSameMiddle(ResidentModel newModel) {
    return id == newModel.id && middle != newModel.middle;
  }

  bool isSameLast(ResidentModel newModel) {
    return id == newModel.id && last == newModel.last;
  }

  bool isNotSameLast(ResidentModel newModel) {
    return id == newModel.id && last != newModel.last;
  }

  bool isSameSex(ResidentModel newModel) {
    return id == newModel.id && sex == newModel.sex;
  }

  bool isNotSameSex(ResidentModel newModel) {
    return id == newModel.id && sex != newModel.sex;
  }

  bool isSameAge(ResidentModel newModel) {
    return id == newModel.id && age == newModel.age;
  }

  bool isNotSameAge(ResidentModel newModel) {
    return id == newModel.id && age != newModel.age;
  }

  bool isSameBirth(ResidentModel newModel) {
    return id == newModel.id && birth == newModel.birth;
  }

  bool isNotSameBirth(ResidentModel newModel) {
    return id == newModel.id && birth != newModel.birth;
  }

  bool isSameContact(ResidentModel newModel) {
    return id == newModel.id && contact == newModel.contact;
  }

  bool isNotSameContact(ResidentModel newModel) {
    return id == newModel.id && contact != newModel.contact;
  }

  bool isSameStatus(ResidentModel newModel) {
    return id == newModel.id && status == newModel.status;
  }

  bool isNotSameStatus(ResidentModel newModel) {
    return id == newModel.id && status != newModel.status;
  }

  bool isSameZone(ResidentModel newModel) {
    return id == newModel.id && zone == newModel.zone;
  }

  bool isNotSameZone(ResidentModel newModel) {
    return id == newModel.id && zone != newModel.zone;
  }

  bool isSameHouseStreet(ResidentModel newModel) {
    return id == newModel.id && houseStreet == newModel.houseStreet;
  }

  bool isNotSameHouseStreet(ResidentModel newModel) {
    return id == newModel.id && houseStreet != newModel.houseStreet;
  }

  bool isSameEmail(ResidentModel newModel) {
    return id == newModel.id && email == newModel.email;
  }

  bool isNotSameEmail(ResidentModel newModel) {
    return id == newModel.id && email != newModel.email;
  }

  bool isSameResidency(ResidentModel newModel) {
    return id == newModel.id && residency == newModel.residency;
  }

  bool isNotSameResidency(ResidentModel newModel) {
    return id == newModel.id && residency != newModel.residency;
  }

  bool isSameContent(ResidentModel newModel) {
    return isSamePhoto(newModel) &&
    isSamePhoto(newModel) &&
    isSameFirst(newModel) &&
    isSameMiddle(newModel) &&
    isSameMiddle(newModel) &&
    isSameLast(newModel) &&
    isSameSex(newModel) &&
    isSameAge(newModel) &&
    isSameBirth(newModel) &&
    isSameContact(newModel) &&
    isSameStatus(newModel) &&
    isSameZone(newModel) &&
    isSameHouseStreet(newModel) &&
    isSameEmail(newModel) &&
    isSameResidency(newModel);
  }

  bool isNotSameContent(ResidentModel newModel) {
    return !isSameContent(newModel);
  }

  @override
  String toString() {
    return "ResidentModel id $id, photo $photo, first $first, middle $middle, last $last, sex $sex, age $age, birth $birth, contact $contact, status $status, zone $zone, houseStreet $houseStreet, email $email" ?? super.toString();
  }
}