import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/card_home_widget.dart';

class ResidentHomeWidget extends BaseWidget<HomedController> {
  const ResidentHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.9, // Adjusted width
      height: screenHeight * 0.3, // Adjusted height
      child: CardHomeWidget(
        firstWidget: SizedBox(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2, // Adjusted width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.graph_square,
                color: Colors.white,
              ),
              const SizedBox(width: 8), // Adding some space between icon and text
              Text(
                AppLocalizations.of(context).translate('view_dashboard'),
                style: const TextStyle(fontSize: 16), // Adjust text size
              ),
            ],
          ),
        ),
        secondWidget: SizedBox(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2, // Adjusted width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.folder_open,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context).translate('file_a_complaint'),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        thirdWidget: SizedBox(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2, // Adjusted width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.gobackward,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)
                    .translate('view_record_of_complaints'),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        onPressedFirst: () {
          controller.launchDashboard();
        },
        onPressedSecond: () {
          controller.launchFileComplaint();
        },
        onPressedThird: () {
          controller.launchResidentComplaintList();
        },
      ),
    );
  }
}
