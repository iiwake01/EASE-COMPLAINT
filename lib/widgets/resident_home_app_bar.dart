import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
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
      backgroundColor: Constants.standardColor,
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
            setController: () => controller.launchNotification(),
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
            setController: () => controller.launchProfile(),
          ),
          SizedBox(width: widthGap),
          TitledIconButtons(
            controller: controller,
            iconName: "Log-out",
            setIcon: Icons.logout_rounded,
            setController: () => controller.promptLogout(),
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
    this.setController,
  });

  final iconName;
  final setIcon;
  final setController;

  final HomedController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: setController,
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
