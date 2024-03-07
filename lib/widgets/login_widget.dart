import 'package:app/controllers/login_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class LoginWidget extends BaseWidget<LoginController> {

  const LoginWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget> [
        Text( AppLocalizations.of(context).translate('welcome_to_ease_complaint') ),
        Row ( 
          children: <Widget>[
            ElevatedButton (
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                controller.launchLoginResident();
              },
              child: Text(AppLocalizations.of(context).translate('resident')),
            ),
             ElevatedButton (
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                controller.launchLoginStaff();
              },
              child: Text(AppLocalizations.of(context).translate('staff')),
            ),
          ],
        ),
        Text( AppLocalizations.of(context).translate('log_in_as_') ),
      ],
    );
  }
}