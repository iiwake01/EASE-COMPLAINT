import 'package:app/controllers/login_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends BaseWidget<LoginController> {

  const LoginWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Text( AppLocalizations.of(context).translate('welcome_to_ease_complaint'), style: const TextStyle(color: Colors.green, fontSize: 20), ),
        Row ( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            ElevatedButton (
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.greenAccent, textStyle: const TextStyle(fontSize: 20)),
              onPressed: () { controller.launchLoginResident(); },
              child: Column ( 
                children: [ 
                  const Icon(CupertinoIcons.house_fill, color: Colors.white,),
                  Text(AppLocalizations.of(context).translate('resident'), style: const TextStyle(color: Colors.white)), 
                ],),
            ),
             ElevatedButton (
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.greenAccent, textStyle: const TextStyle(fontSize: 20)),
              onPressed: () { controller.launchLoginStaff(); },
              child: Column(
                children: [
                  const Icon(Icons.home_repair_service_sharp, color: Colors.white,),
                  Text(AppLocalizations.of(context).translate('staff'), style: const TextStyle(color: Colors.white))
                ],
              ),
            ),
          ],
        ),
        Text( AppLocalizations.of(context).translate('log_in_as_'), style: const TextStyle(color: Colors.green, fontSize: 20),),
      ],
    );
  }
}