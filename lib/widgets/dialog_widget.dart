import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget {

  static loadingDialog () {
    Get.dialog (
      AlertDialog (
        backgroundColor: Constants.transparentColor,
        elevation: 0.00,
        content: const Center (
          child: CircularProgressIndicator()
        ),
        surfaceTintColor: Constants.transparentColor,
      ),
      barrierDismissible: false,
    );
  }
  
  static logoutDialog (
    String title, textPositive, textNegative,
    GestureTapCallback onPressedPositive, GestureTapCallback onPressedNegative
  ) {
    Get.dialog (
      AlertDialog (
        actions: [
          ElevatedButton (
            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, foregroundColor: Colors.white, textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedPositive, 
            child: Text (textPositive,),
          ),
          ElevatedButton (
            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, foregroundColor: Colors.white, textStyle: const TextStyle(fontSize: 20)),
            onPressed: onPressedNegative, 
            child: Text(textNegative,),
          ),
        ],
        alignment: Alignment.center,
        backgroundColor: Colors.green,
        content: null,
        title: Text(title,),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      barrierDismissible: true,
    );
  }
}