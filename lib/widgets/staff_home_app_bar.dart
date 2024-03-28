import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/resident_home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffHomeAppBar extends BaseWidget<HomedController>
    implements PreferredSizeWidget {
  const StaffHomeAppBar({
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
        children: [
          SizedBox(width: widthGap),
          TitledIconButtons(
            controller: controller,
            iconName: "Profiles",
            setIcon: CupertinoIcons.person_circle,
            setController: () => controller.launchProfile(),
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
            iconName: "Log-out",
            setIcon: Icons.logout_rounded,
            setController: () => controller.promptLogout(),
          ),
          SizedBox(width: widthGap),
        ],
      ),
    );
  }
}
