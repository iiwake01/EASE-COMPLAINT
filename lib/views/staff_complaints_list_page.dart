import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/models/complaint_model.dart';
import 'package:app/models/complaint.dart';
import 'package:app/utils/complaint_tile.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/white_back_app_bar.dart';
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
                borderRadius: const BorderRadius.all(Radius.circular(36)),
              ),
              child: Column(
                children: [
                  const Row(
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
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .7,
                        // margin: EdgeInsets.symmetric(horizontal: 90),
                        // color: Colors.red,
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("        "),
                                TitleWidget(
                                  title: "Complainant's Name",
                                  multiplier: .1,
                                ),
                                TitleWidget(
                                  title: "Zone",
                                  multiplier: .1,
                                ),
                                TitleWidget(
                                  title: "Complaint Type",
                                  multiplier: .1,
                                ),
                                TitleWidget(
                                  title: "Date Filled",
                                  multiplier: .07,
                                ),
                                TitleWidget(
                                  title: "Status",
                                  multiplier: .15,
                                ),
                                // TitleWidget(title: "")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .5,
                        child: ListView.builder(
                          itemCount: controller.getList().length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            ComplaintModel model = controller.getList()[index];
                            Complaint complaint = Complaint(
                              photo: model.photo ?? Constants.BLANK,
                              name: model.name ?? Constants.BLANK,
                              zone: model.zone ?? Constants.BLANK,
                              complaintType: model.type ?? Constants.BLANK,
                              date: model.date ?? Constants.BLANK,
                              status: model.status ?? Constants.BLANK,
                            );
                            return ComplaintTile(resident: complaint);
                          },
                        ),
                      ),
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
    required this.multiplier,
  });

  final String title;
  final double multiplier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * multiplier,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
