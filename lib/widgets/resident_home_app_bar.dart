import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentHomeAppBar extends BaseWidget<HomedController>
    implements PreferredSizeWidget {
  const ResidentHomeAppBar({
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
          SizedBox(width: widthGap),
          TitledIconButtons(
            controller: controller,
            iconName: "Notifications",
            setIcon: CupertinoIcons.bell_solid,
          ),
          const Spacer(),
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
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          const Spacer(),
          TitledIconButtons(
            controller: controller,
            iconName: "Profiles",
            setIcon: CupertinoIcons.profile_circled,
          ),
          SizedBox(width: widthGap),
          TitledIconButtons(
            controller: controller,
            iconName: "Log-out",
            setIcon: Icons.logout_rounded,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .035,
          ),
        ],
      ),
    );
  }
}

class TitledIconButtons extends StatelessWidget {
  const TitledIconButtons({
    super.key,
    required this.controller,
    this.iconName,
    this.setIcon,
  });

  final iconName;
  final setIcon;

  final HomedController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => controller.launchNotification(),
          icon: Icon(
            setIcon,
            color: Colors.white,
            size: 35,
          ),
        ),
        Text(
          iconName,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
