import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends BaseWidget {
  
  const SignUpWidget({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(AppLocalizations.of(context).translate('make_a_new_account_'), style: const TextStyle(color: Colors.green, fontSize: 20),),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Expanded(child: TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('name'),),),
                Expanded(child: TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('username'),),),
              ],
            ),
            TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('email'),),
            Center (
              child: ElevatedButton (
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {  },
                child: Text(AppLocalizations.of(context).translate('sign_up'), style: const TextStyle(color: Colors.white, fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    ); 
  }
}