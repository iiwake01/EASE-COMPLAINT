import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAppBarWidget extends BaseWidget implements PreferredSizeWidget {
  
  const HeaderAppBarWidget( { 
    super.key,
    this.height = kToolbarHeight,
  } );

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget (
      height: MediaQuery.of(context).size.height * 0.20,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          const Icon(CupertinoIcons.photo,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
          Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Text( AppLocalizations.of(context).translate('barangay_bonbon'), style: const TextStyle(color: Colors.white, fontSize: 13), ),
              Text( AppLocalizations.of(context).translate('app_name'), style: const TextStyle(color: Colors.white, fontSize: 20), ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
          const Icon(CupertinoIcons.photo,),
        ],
      ),
    );
  }
  

}