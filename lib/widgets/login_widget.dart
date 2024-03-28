import 'package:app/controllers/login_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends BaseWidget<LoginController> {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widthGap = MediaQuery.of(context).size.width * 0.05;
    final widthGapCorner = MediaQuery.of(context).size.width * 0.20;

    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate('welcome_to_ease_complaint')
                    .toUpperCase(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 39, 78, 40),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                AppLocalizations.of(context).translate('log_in_as_'),
                style: const TextStyle(
                  color: Color.fromARGB(255, 39, 78, 40),
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(131, 61, 94, 49),
                    ),
                    padding: const EdgeInsets.all(25),
                    // color: Colors.green,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 74, 107, 76),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        controller.launchLoginResident();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.house_fill,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            AppLocalizations.of(context).translate('resident'),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widthGap,
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(131, 61, 94, 49),
                    ),
                    padding: const EdgeInsets.all(25),
                    // color: Colors.green,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.standardColor,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        controller.launchLoginStaff();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.home_repair_service_sharp,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            AppLocalizations.of(context).translate('staff'),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
