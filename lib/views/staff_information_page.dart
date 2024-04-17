import 'package:app/controllers/resident_information_controller.dart';
import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/controllers/staff_controller.dart';
import 'package:app/models/resident_information_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/models/staff_model.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/complaint_view_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class StaffInformationPage extends BaseView<StaffController> {
  const StaffInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchArguments();
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        // title: "User Information",
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 75, vertical: 100),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.black26, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .8,
              child: ResidentInformationDataBox(
                model: controller.observeStaffInformation().value,
              ),
            ),
          );
        }
      }),
    );
  }
}

class ResidentInformationDataBox extends StatelessWidget {
  const ResidentInformationDataBox({
    super.key,
    required this.model,
  });

  final StaffModel? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Constants.standardColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .2,
                  color: Colors.white,
                  child: Text(
                    model?.first ?? Constants.BLANK,
                    style: TextStyle(
                        color: Constants.standardColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Address",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .47,
                  color: Colors.white,
                  child: Text(
                    model?.email ?? Constants.BLANK,
                    style: TextStyle(
                      color: Constants.standardColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Last Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .2,
                  color: Colors.white,
                  child: Text(
                    model?.last ?? Constants.BLANK,
                    style: TextStyle(
                        color: Constants.standardColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Birthdate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .1,
                  color: Colors.white,
                  child: Text(
                    model?.birth ?? Constants.BLANK,
                    style: TextStyle(
                      color: Constants.standardColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Number",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .3,
                  color: Colors.white,
                  child: Text(
                    model?.contact ?? Constants.BLANK,
                    style: TextStyle(
                      color: Constants.standardColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Middle Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .2,
                  color: Colors.white,
                  child: Text(
                    model?.middle ?? Constants.BLANK,
                    style: TextStyle(
                        color: Constants.standardColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Position",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.standardColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .44,
                  color: Colors.white,
                  child: Text(
                    model?.position ?? Constants.BLANK,
                    style: TextStyle(
                      color: Constants.standardColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
