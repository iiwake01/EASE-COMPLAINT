import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/card_home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentHomeWidget extends BaseWidget<HomedController> {
  
  const ResidentHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardHomeWidget(
      firstWidget: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          const Icon(CupertinoIcons.graph_square, color: Colors.white,),
          Text(AppLocalizations.of(context).translate('view_dashboard')), 
        ],
      ), 
      secondWidget: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          const Icon(CupertinoIcons.folder_open, color: Colors.white,),
          Text(AppLocalizations.of(context).translate('file_a_complaint')), 
        ],
      ), 
      thirdWidget: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.gobackward, color: Colors.white,),
          Text(AppLocalizations.of(context).translate('view_record_of_complaints')), 
        ],
      ),
      onPressedFirst:  () { controller.launchDashboard(); },
      onPressedSecond: () { controller.launchFileComplaint(); },
      onPressedThird: () { controller.launchSelfComplaintsList(); },
    ); 
  }
}