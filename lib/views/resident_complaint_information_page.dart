import 'package:app/controllers/resident_complaint_information_controller.dart';
import 'package:app/models/complaint.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/complaint_view_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintInformationPage
    extends BaseView<ResidentsComplaintInformationController> {
  const ResidentsComplaintInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComplaintAppbar(
          height: MediaQuery.of(context).size.height * 0.20,
          widthGap: MediaQuery.of(context).size.width * 0.05,
          // title: "Complaint Information",
        ),
        backgroundColor: Constants.standardColor,
        body: Obx(() {
          if (controller.observeLoading().isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            controller.observeResidentInformation();
            controller.observeComplaintInformation();
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    // Title Header
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * .25,
                      height: MediaQuery.of(context).size.width * .035,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Center(
                        child: Text(
                          "Complaint Form",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Resident Information Container
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Complainant's Information",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContainerField(
                                    fieldTitle: "Complaints Full Name:",
                                    widthMultiplier: .35,
                                    value:
                                        "${controller.observeResidentInformation().value?.first} ${controller.observeResidentInformation().value?.last}"),
                                SizedBox(
                                  width: 10,
                                ),
                                ContainerField(
                                  fieldTitle: "Zone:",
                                  widthMultiplier: .25,
                                  value: controller
                                          .observeResidentInformation()
                                          .value
                                          ?.zone ??
                                      Constants.BLANK,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContainerField(
                                  fieldTitle: "Contact Number:",
                                  widthMultiplier: .2,
                                  value: controller
                                          .observeResidentInformation()
                                          .value
                                          ?.contact ??
                                      Constants.BLANK,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ContainerField(
                                  fieldTitle: "Email Address:",
                                  widthMultiplier: .2,
                                  value: controller
                                          .observeResidentInformation()
                                          .value
                                          ?.email ??
                                      Constants.BLANK,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ContainerField(
                                  fieldTitle: "Age:",
                                  widthMultiplier: .19,
                                  value: controller
                                          .observeResidentInformation()
                                          .value
                                          ?.age ??
                                      Constants.BLANK,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Row(
                                children: [
                                  ContainerField(
                                      fieldTitle: "Date Complaint Filed:",
                                      widthMultiplier: .2,
                                      value: controller
                                              .observeComplaintInformation()
                                              .value
                                              ?.date ??
                                          Constants.BLANK),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
}

class ContainerField extends StatelessWidget {
  const ContainerField({
    super.key,
    required this.fieldTitle,
    required this.widthMultiplier,
    required this.value,
  });

  final String fieldTitle;
  final double widthMultiplier;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: TextStyle(
              color: Constants.standardColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        Container(
          width: MediaQuery.of(context).size.width * widthMultiplier,
          height: MediaQuery.of(context).size.width * .02,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(value),
          ),
        )
      ],
    );
  }
}
