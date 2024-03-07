import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpModel {

  SignUpModel ( {
    this.name, this.username, this.email,
    this.firstName, this.lastName, this.middleName,
    this.sex, this.age, this.birthdate, this.contactNumber, this.status,
    this.zone, this.street, this.residencyProof, 
    this.password, this.confirmPassword,
  } );

  final String? name, username, email, 
  firstName, lastName, middleName, 
  sex, age, birthdate, contactNumber, status, 
  zone, street, residencyProof,
  password, confirmPassword;

  @override
  String toString() {
    return "SignUpModel name $name username $username email $email firstName $firstName lastName $lastName middleName $middleName sex $sex age $age birthdate $birthdate contactNumber $contactNumber status $status zone $zone street $street residencyProof $residencyProof password $password confirmPassword $confirmPassword" ?? super.toString();
  }
}