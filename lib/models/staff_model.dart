import 'package:app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffModel {
  StaffModel(
      {this.id,
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
      this.position
      //this.phone,
      //this.email,
      //this.age,
      });

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
  final String? position;

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      id: json[Constants.ID],
      uid: json[Constants.UID],
      photo: json[Constants.PHOTO].toString(),
      first: json[Constants.FIRST].toString(),
      middle: json[Constants.MIDDLE].toString(),
      last: json[Constants.LAST].toString(),
      sex: json[Constants.SEX].toString(),
      age: json[Constants.AGE].toString(),
      birth: json[Constants.BIRTH].toString(),
      contact: json[Constants.CONTACT].toString(),
      status: json[Constants.STATUS].toString(),
      zone: json[Constants.ZONE].toString(),
      houseStreet: json[Constants.HOUSESTREET].toString(),
      email: json[Constants.EMAIL].toString(),
      residency: json[Constants.RESIDENCY].toString(),
      position: json[Constants.POSITION].toString(),
    );
  }

  factory StaffModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return StaffModel(
        id: snapshot.id.toString(),
        uid: data[Constants.UID],
        photo: data[Constants.PHOTO],
        first: data[Constants.FIRST],
        middle: data[Constants.MIDDLE],
        last: data[Constants.LAST],
        sex: data[Constants.SEX],
        age: data[Constants.AGE],
        birth: data[Constants.BIRTH],
        contact: data[Constants.CONTACT],
        status: data[Constants.STATUS],
        zone: data[Constants.ZONE],
        houseStreet: data[Constants.HOUSESTREET],
        email: data[Constants.EMAIL],
        residency: data[Constants.RESIDENCY],
        position: data[Constants.POSITION]);
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
        Constants.POSITION: position,
      };

  Map<String, dynamic> toJson() {
    return {
      Constants.ID: id,
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
      Constants.POSITION: position,
    };
  }

  bool isSamePhoto(StaffModel newModel) {
    return id == newModel.id && photo == newModel.photo;
  }

  bool isNotSamePhoto(StaffModel newModel) {
    return id == newModel.id && photo != newModel.photo;
  }

  bool isSameFirst(StaffModel newModel) {
    return id == newModel.id && first == newModel.first;
  }

  bool isNotSameFirst(StaffModel newModel) {
    return id == newModel.id && first != newModel.first;
  }

  bool isSameMiddle(StaffModel newModel) {
    return id == newModel.id && middle == newModel.middle;
  }

  bool isNotSameMiddle(StaffModel newModel) {
    return id == newModel.id && middle != newModel.middle;
  }

  bool isSameLast(StaffModel newModel) {
    return id == newModel.id && last == newModel.last;
  }

  bool isNotSameLast(StaffModel newModel) {
    return id == newModel.id && last != newModel.last;
  }

  bool isSameSex(StaffModel newModel) {
    return id == newModel.id && sex == newModel.sex;
  }

  bool isNotSameSex(StaffModel newModel) {
    return id == newModel.id && sex != newModel.sex;
  }

  bool isSameAge(StaffModel newModel) {
    return id == newModel.id && age == newModel.age;
  }

  bool isNotSameAge(StaffModel newModel) {
    return id == newModel.id && age != newModel.age;
  }

  bool isSameBirth(StaffModel newModel) {
    return id == newModel.id && birth == newModel.birth;
  }

  bool isNotSameBirth(StaffModel newModel) {
    return id == newModel.id && birth != newModel.birth;
  }

  bool isSameContact(StaffModel newModel) {
    return id == newModel.id && contact == newModel.contact;
  }

  bool isNotSameContact(StaffModel newModel) {
    return id == newModel.id && contact != newModel.contact;
  }

  bool isSameStatus(StaffModel newModel) {
    return id == newModel.id && status == newModel.status;
  }

  bool isNotSameStatus(StaffModel newModel) {
    return id == newModel.id && status != newModel.status;
  }

  bool isSameZone(StaffModel newModel) {
    return id == newModel.id && zone == newModel.zone;
  }

  bool isNotSameZone(StaffModel newModel) {
    return id == newModel.id && zone != newModel.zone;
  }

  bool isSameHouseStreet(StaffModel newModel) {
    return id == newModel.id && houseStreet == newModel.houseStreet;
  }

  bool isNotSameHouseStreet(StaffModel newModel) {
    return id == newModel.id && houseStreet != newModel.houseStreet;
  }

  bool isSameEmail(StaffModel newModel) {
    return id == newModel.id && email == newModel.email;
  }

  bool isNotSameEmail(StaffModel newModel) {
    return id == newModel.id && email != newModel.email;
  }

  bool isSameResidency(StaffModel newModel) {
    return id == newModel.id && residency == newModel.residency;
  }

  bool isNotSameResidency(StaffModel newModel) {
    return id == newModel.id && residency != newModel.residency;
  }

  bool isSamePosition(StaffModel newModel) {
    return id == newModel.position && position == newModel.position;
  }

  bool isNotSamePosition(StaffModel newModel) {
    return id == newModel.position && position != newModel.position;
  }

  bool isSameContent(StaffModel newModel) {
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
        isSameResidency(newModel) &&
        isSamePosition(newModel);
  }

  bool isNotSameContent(StaffModel newModel) {
    return !isSameContent(newModel);
  }

  @override
  String toString() {
    return "StaffModel id $id, photo $photo, first $first, middle $middle, last $last, sex $sex, age $age, birth $birth, contact $contact, status $status, zone $zone, houseStreet $houseStreet, email $email, position $position" ??
        super.toString();
  }
}
