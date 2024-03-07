import 'package:app/controllers/login_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginResidentWidget extends BaseWidget<LoginController> {

  const LoginResidentWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Card (
      margin: const EdgeInsets.all(50),
      elevation: 1.0,
      shadowColor: Colors.grey,
      child: Padding (
        padding: const EdgeInsets.only(top: 13, left: 20.0, right: 20.0, bottom: 13),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Text(AppLocalizations.of(context).translate('log_in_to_your_account'), style: const TextStyle(color: Colors.green, fontSize: 20),),
            TextFieldWidget(textEditingController: controller.emailController, labelText: AppLocalizations.of(context).translate('email'),),
            TextFieldWidget(textEditingController: controller.passwordController, labelText: AppLocalizations.of(context).translate('password'),),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( AppLocalizations.of(context).translate('dont_have_an_account_'), style: const TextStyle(color: Colors.green, fontSize: 20), ),
                TextButton ( onPressed: () { controller.launchSignUp(); }, child: Text(AppLocalizations.of(context).translate('sign_up_here'), style: const TextStyle(color: Colors.green, decoration:TextDecoration.underline, decorationColor: Colors.green, decorationStyle: TextDecorationStyle.solid, decorationThickness: 2, fontSize: 20),) ),
              ],
            ), 
            ElevatedButton (
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.greenAccent, textStyle: const TextStyle(fontSize: 20)),
              onPressed: () { controller.validateCredential(); },
              child: Text(AppLocalizations.of(context).translate('log_in'), style: const TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}