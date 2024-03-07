import 'package:app/bindings/login_binding.dart';
import 'package:app/firebase/firebase_auth_service.dart';
import 'package:app/firebase/firebase_options.dart';
import 'package:app/firebase/firebase_storage_service.dart';
import 'package:app/firebase/firestore_service.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(new FirestoreService());
  Get.put(new FirebaseStorageService());
  Get.put(new FirebaseAuthService());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: true,
    initialBinding: LoginBinding(),
    initialRoute: Routes.LOGIN,
    localizationsDelegates: Constants.localizationsDelegates,
    localeResolutionCallback: (deviceLocale, supportedLocales) {
      for (var locale in supportedLocales) {
        if (locale.languageCode == deviceLocale!.languageCode &&
            locale.countryCode == deviceLocale.countryCode) {
          return deviceLocale;
        }
      }
      return supportedLocales.first;
    },
    supportedLocales: Constants.supportedLocales,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}