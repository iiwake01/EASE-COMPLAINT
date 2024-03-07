import 'package:app/controllers/sign_up_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends BaseWidget<SignUpController> {
  
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardMargin = MediaQuery.of(context).size.width * 0.20;
    return Card (
      margin: EdgeInsets.only(left: cardMargin, top: 0, right: cardMargin, bottom: 0),
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
                Flexible(child: TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('name'),),),
                SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                Flexible(child: TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('username'),),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
            TextFieldWidget(textEditingController: null, labelText: AppLocalizations.of(context).translate('email'),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
            Center (
              child: ElevatedButton (
                style: ElevatedButton.styleFrom (
                  backgroundColor: Colors.grey, 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                  textStyle: const TextStyle(fontSize: 20)
                ),
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