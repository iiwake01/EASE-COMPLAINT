import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/header_app_bar_widget.dart';
import 'package:app/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends BaseView {

  const SignUpPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: const HeaderAppBarWidget(),
      backgroundColor: Colors.white,
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text( AppLocalizations.of(context).translate('sign_up'), style: const TextStyle(color: Colors.green, fontSize: 13), ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
          const SignUpWidget()
        ]
      ),
    );
  }
}