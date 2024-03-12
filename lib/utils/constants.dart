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
  static Color transparentColor = HexColor('00ffffff').withOpacity(0.00) ?? Colors.transparent;
}