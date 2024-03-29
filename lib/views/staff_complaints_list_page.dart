import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffComplaintsListPage extends BaseView<StaffComplaintsListController> {
  const StaffComplaintsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: AppLocalizations.of(context).translate('records_of_complaints'),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .775,
              decoration: BoxDecoration(
                color: Constants.appBarColor,
                borderRadius: BorderRadius.all(Radius.circular(36)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 50),
                        child: Text(
                          "Filed Complaints",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .7,
                        // margin: EdgeInsets.symmetric(horizontal: 90),
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleWidget(
                                  title: "Complainant's Name",
                                ),
                                TitleWidget(
                                  title: "Zone",
                                ),
                                TitleWidget(
                                  title: "Complaint Type",
                                ),
                                TitleWidget(
                                  title: "Date Filled",
                                ),
                                TitleWidget(
                                  title: "Status",
                                ),
                                TitleWidget(title: "        ")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .7,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(36)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DataWidget(
                              data: "John Richard Alix",
                            ),
                            DataWidget(
                              data: "Zone 6",
                            ),
                            DataWidget(
                              data: "Environmental Problems",
                            ),
                            DataWidget(
                              data: "10/12/24",
                            ),
                            DataWidget(
                              data: "Single",
                            ),
                            TextButton(
                                onPressed: () => controller.launchView(),
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 20,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: Constants.standardColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white,
      ),
    );
  }
}
