import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Constants {
  static const BLANK = "";
  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static const supportedLocales = [
    Locale('en', 'US'),
  ];
  static const ID = "id";
  static const UID = "user_id";
  static const PHOTO = "photo";
  static const NAME = "name";
  static const FIRST = "first";
  static const MIDDLE = "middle";
  static const LAST = "last";
  static const SEX = "sex";
  static const AGE = "age";
  static const BIRTH = "birth";
  static const CONTACT = "contact";
  static const ZONE = "zone";
  static const TYPE = "type";
  static const STATUS = "status";
  static const HOUSESTREET = "house_street";
  static const EMAIL = "email";
  static const RESIDENCY = "proof_of_residency";
  static const URGENCY = "urgency_of_problem";
  static const DATEINCIDENT = "date_of_incident";
  static const LOCATION = "location_of_incident";
  static const NARRATIVE = "narrative_report";
  static const ATTACHMENT = "attachment";
  static const PAT = "previous_action_taken";
  static const WITNESSNAME = "witness_name";
  static const WITNESSCONTACT = "witness_contract";
  static const RESOLUTIONREQUEST = "resolution_request";
  static Color transparentColor =
      HexColor('00ffffff').withOpacity(0.00) ?? Colors.transparent;
  static Color standardColor = const Color.fromARGB(255, 74, 107, 76);
  static Color primaryColor = const Color.fromARGB(255, 169, 202, 174);
  static Color appBarColor = const Color.fromARGB(131, 64, 90, 54);
}
