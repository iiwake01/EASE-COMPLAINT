import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget {
  static loadingDialog() {
    Get.dialog (
      AlertDialog (
        backgroundColor: Constants.transparentColor,
        elevation: 0.00,
        content: const Center(child: CircularProgressIndicator()),
        surfaceTintColor: Constants.transparentColor,
      ),
      barrierDismissible: false,
    );
  }

  static timeoutDialog(String title, textPositive, GestureTapCallback onPressedPositive, ) {
    Get.dialog (
      AlertDialog (
        actions: [
          ElevatedButton (
            style: ElevatedButton.styleFrom (
              backgroundColor: const Color.fromARGB(255, 6, 141, 76),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20)
            ),
            onPressed: onPressedPositive,
            child: Text (
              textPositive,
            ),
          ),
        ],
        alignment: Alignment.center,
        backgroundColor: Colors.green,
        content: null,
        title: Text (title,),
        titleTextStyle: const TextStyle (color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), 
      ),
      barrierDismissible: true,
    );
  }

  static removeDialog (String title, textPositive, textNegative, GestureTapCallback onPressedPositive, GestureTapCallback onPressedNegative) {
    Get.dialog (
      AlertDialog (
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 141, 76),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedPositive,
            child: Text(
              textPositive,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 141, 76),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedNegative,
            child: Text(
              textNegative,
            ),
          ),
        ],
        alignment: Alignment.center,
        backgroundColor: Colors.green,
        content: null,
        title: Text(
          title,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      barrierDismissible: true,
    );
  }

  static logoutDialog (String title, textPositive, textNegative, GestureTapCallback onPressedPositive, GestureTapCallback onPressedNegative) {
    Get.dialog (
      AlertDialog (
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 141, 76),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedPositive,
            child: Text(
              textPositive,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 141, 76),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedNegative,
            child: Text(
              textNegative,
            ),
          ),
        ],
        alignment: Alignment.center,
        backgroundColor: Colors.green,
        content: null,
        title: Text(
          title,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      barrierDismissible: true,
    );
  }

  static submittedComplaintDialog(VoidCallback? onConfirm) {
    Get.defaultDialog (
      barrierDismissible: false,
      content: Text( AppLocalizations.of(Get.context!).translate('your_complaint_has_been_filed_to_baranggay_'), ),
      onConfirm: onConfirm,
      title: AppLocalizations.of(Get.context!).translate('confirmation_for_submission_of_complaint'),
    );
  }

  static staffCreatedDialog(String? email, String? password, VoidCallback? onConfirm) {
    Get.defaultDialog (
      barrierDismissible: false,
      content: Text( AppLocalizations.of(Get.context!).translate('account_successfully_created__please_remember_this:'), ),
      onConfirm: onConfirm,
      title: AppLocalizations.of(Get.context!).translate('confirmation_for_submission_of_complaint'),
      textConfirm: AppLocalizations.of(Get.context!).translate('ok')
    );
    Get.dialog (
      AlertDialog (
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 141, 76),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: onConfirm,
            child: Text(
              AppLocalizations.of(Get.context!).translate('ok'),
            ),
          ),
        ],
        alignment: Alignment.center,
        backgroundColor: Colors.green,
        content: Column (
          children: [
            Text("EMAIL: $email"),
            Text("PASSWORD: $password"),
          ],
        ),
        title: Text(AppLocalizations.of(Get.context!).translate('account_successfully_created__please_remember_this:'),
        ),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),

      ),
      barrierDismissible: false,
    );
  }
}