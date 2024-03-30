import 'package:app/controllers/dashboard_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/top_complaints_text.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DashboardPage extends BaseView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title:
            AppLocalizations.of(context).translate('dashboard_of_complaints'),
      ),
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Colors.deepPurple.shade200,
            child: Container(
              width: 800,
              height: 650,
              padding:
                  EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 100),
              child: Stack(
                // alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(),
                      Center(
                        child: Text(
                          "Top Complaints in\nBarangay Bonbon",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 40,
                            ),
                            child: Column (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller.getTopComplaintsList().mapIndexed((index, topComplaint) => 
                                TopComplaintsText (
                                  iteration: '${index + 1}.',
                                  data: topComplaint,
                                ),
                              ).toList(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  color: Colors.green.shade100,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: 600,
                        height: 150,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate('solved_complaints'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Divider(
                                  color: Colors.white, thickness: 1.0),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: Colors.white),
                              child: Text(
                                controller.getSolvedComplaints(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Card(
                  color: Colors.orange.shade100,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: 600,
                        height: 150,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('pending_complaints'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Divider(
                                  color: Colors.white, thickness: 1.0),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  controller.getPendingComplaints(),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
              Card(
                  color: Colors.blue.shade100,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 600,
                        height: 150,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate('complaints_submitted_today'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Divider(
                                  color: Colors.white, thickness: 1.0),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36),
                                    color: Colors.white),
                                child: Text(
                                  controller.getComplaintsSubmittedToday(),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}