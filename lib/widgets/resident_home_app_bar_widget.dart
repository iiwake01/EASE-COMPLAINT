import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentHomeAppBarWidget extends BaseWidget implements PreferredSizeWidget {
  
  const ResidentHomeAppBarWidget( { 
    super.key,
    this.height,
    this.widthGap,
  } );

  final double? height, widthGap;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget (
      height: height ?? kToolbarHeight,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(width: widthGap),
          const Icon(CupertinoIcons.bell_solid, color: Colors.white,),
          const Spacer(),
          Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Text( AppLocalizations.of(context).translate('barangay_bonbon'), style: const TextStyle(color: Colors.white, fontSize: 13), ),
              Text( AppLocalizations.of(context).translate('app_name'), style: const TextStyle(color: Colors.white, fontSize: 20), ),
            ],
          ),
          const Spacer(),
          const Icon(CupertinoIcons.person_circle, color: Colors.white,),
          SizedBox(width: widthGap),
          const Icon(Icons.logout, color: Colors.white,),
          SizedBox(width: widthGap),
        ],
      ),
    );
  }
}