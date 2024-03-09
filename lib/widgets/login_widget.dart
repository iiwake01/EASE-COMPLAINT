import 'package:app/controllers/login_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends BaseWidget<LoginController> {

  const LoginWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    final widthGap = MediaQuery.of(context).size.width * 0.05;
    final widthGapCorner = MediaQuery.of(context).size.width * 0.20;
    return Column (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Text( AppLocalizations.of(context).translate('welcome_to_ease_complaint'), style: const TextStyle(color: Colors.green, fontSize: 20), ),
        Row (
          children: <Widget> [
            SizedBox(width: widthGapCorner,),
            Flexible (
              child: AspectRatio (
                aspectRatio: 2/0.9,
                child: ElevatedButton (
                  style: ElevatedButton.styleFrom (
                    backgroundColor: Colors.green,
                    elevation: 1, 
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.greenAccent, width: 5),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)
                  ),
                  onPressed: () { controller.launchLoginResident(); },
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                      const Icon(CupertinoIcons.house_fill, color: Colors.white,),
                      Text(AppLocalizations.of(context).translate('resident')), 
                    ],
                  ),
                ),
              )
            ),
            SizedBox(width: widthGap,),
            Flexible (
              child: AspectRatio (
              aspectRatio: 2/0.9,
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom (
                    backgroundColor: Colors.green,
                    elevation: 1, 
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.greenAccent, width: 5),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)
                  ),
                  onPressed: () { controller.launchLoginStaff(); },
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.home_repair_service_sharp, color: Colors.white,),
                      Text(AppLocalizations.of(context).translate('staff'))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: widthGapCorner,),
          ],
        ),
        Text( AppLocalizations.of(context).translate('log_in_as_'), style: const TextStyle(color: Colors.green, fontSize: 20),),
      ],
    );
  }
}