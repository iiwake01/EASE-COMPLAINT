import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/resident_home_app_bar_widget.dart';
import 'package:app/widgets/resident_home_widget.dart';
import 'package:flutter/material.dart';

class ResidentHomePage extends BaseView<HomedController> {

  const ResidentHomePage( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: ResidentHomeAppBarWidget(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05,),
      backgroundColor: Colors.white,
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text( AppLocalizations.of(context).translate('hello_resident_'), style: const TextStyle(color: Colors.green, fontSize: 13), ),
          Text( AppLocalizations.of(context).translate('how_can_we_can_help_you_'), style: const TextStyle(color: Colors.green, fontSize: 13), ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
          const ResidentHomeWidget()
        ]
      ),
    ); 
  }
}