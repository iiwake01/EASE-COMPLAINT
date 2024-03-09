import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentHomeWidget extends BaseWidget<HomedController> {
  
  const ResidentHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardMargin = MediaQuery.of(context).size.width * 0.20;
    return Card (
      margin: EdgeInsets.only(left: cardMargin, top: 0, right: cardMargin, bottom: 0),
      elevation: 1.0,
      shadowColor: Colors.greenAccent,
      child: Padding (
        padding: const EdgeInsets.only(top: 13, left: 20.0, right: 20.0, bottom: 13),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                ElevatedButton (
                  style: ElevatedButton.styleFrom (
                    backgroundColor: Colors.green,
                    elevation: 1, 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)
                  ),
                  onPressed: () { controller.launchDashboard(); },
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                      const Icon(CupertinoIcons.graph_square, color: Colors.white,),
                      Text(AppLocalizations.of(context).translate('view_dashboard')), 
                    ],),
                ),
                ElevatedButton (
                  style: ElevatedButton.styleFrom (
                    backgroundColor: Colors.green,
                    elevation: 1, 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)
                  ),
                  onPressed: () { controller.launchFileComplaint(); },
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                      const Icon(CupertinoIcons.folder_open, color: Colors.white,),
                      Text(AppLocalizations.of(context).translate('file_a_complaint')), 
                    ],),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
            ElevatedButton (
              style: ElevatedButton.styleFrom (
                backgroundColor: Colors.green,
                elevation: 1, 
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                textStyle: const TextStyle(fontSize: 20)
              ),
              onPressed: () { controller.launchFileComplaint(); },
              child: Row (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  const Icon(CupertinoIcons.gobackward, color: Colors.white,),
                  Text(AppLocalizations.of(context).translate('view_view_record_of_complaints')), 
                ],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025,),            
          ],
        ),
      ),
    ); 
  }
}