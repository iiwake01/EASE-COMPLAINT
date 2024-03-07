import 'dart:ui';
import 'package:app/utils/app_localizations.dart';
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
}