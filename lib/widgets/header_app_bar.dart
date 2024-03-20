import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends BaseWidget implements PreferredSizeWidget {
  const HeaderAppBar({
    super.key,
    this.height,
    this.widthGap,
  });

  final double? height, widthGap;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      height: height ?? kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage('assets/bonbon.png'),
            width: 150,
            height: 150,
          ),
          SizedBox(
            width: widthGap,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('barangay_bonbon'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 3,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('app_name'),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
            ],
          ),
          SizedBox(width: widthGap),
          Image(
            image: AssetImage('assets/ease.png'),
            width: 150,
            height: 150,
          )
        ],
      ),
    );
  }
}
