import 'package:flutter/material.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/resident_home_app_bar.dart';
import 'package:app/widgets/resident_home_widget.dart';

class ResidentHomePage extends BaseView {
  const ResidentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResidentHomeAppBar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 87, 30),
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)
                        .translate('hello_resident_')
                        .split("Resident")[0],
                  ),
                  TextSpan(
                    text: "Resident",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)
                        .translate('hello_resident_')
                        .split("Resident")[1],
                  ),
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)
                  .translate('how_can_we_can_help_you_'),
              style: const TextStyle(
                  color: Color.fromARGB(255, 29, 87, 30), fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            const Expanded(child: ResidentHomeWidget()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
          ],
        ),
      ),
    );
  }
}
