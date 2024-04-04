import 'package:app/controllers/resident_complaint_information_controller.dart';
import 'package:app/models/complaint.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:app/widgets/complaint_view_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintReviewPage
    extends BaseView<ResidentsComplaintInformationController> {
  const ResidentsComplaintReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetch();
    return Scaffold(
        appBar: BackAppBar(
          height: MediaQuery.of(context).size.height * 0.20,
          widthGap: MediaQuery.of(context).size.width * 0.05,
          title: "Complaint Information",
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
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 200),
                      color: Colors.white.withOpacity(.5),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ContainerField(
                                      fieldTitle: "Complaints Full Name:",
                                      // widthMultiplier: .4,
                                      value:
                                          "${controller.observeResidentInformation().value?.first} ${controller.observeResidentInformation().value?.last}"),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Zone:",
                                    // widthMultiplier: .3,
                                    value: controller
                                            .observeResidentInformation()
                                            .value
                                            ?.zone ??
                                        Constants.BLANK,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Contact Number:",
                                    // widthMultiplier: .22,
                                    value: controller
                                            .observeResidentInformation()
                                            .value
                                            ?.contact ??
                                        Constants.BLANK,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Email Address:",
                                    // widthMultiplier: .22,
                                    value: controller
                                            .observeResidentInformation()
                                            .value
                                            ?.email ??
                                        Constants.BLANK,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Age:",
                                    // widthMultiplier: .22,
                                    value: controller
                                            .observeResidentInformation()
                                            .value
                                            ?.age ??
                                        Constants.BLANK,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .1,
                                  child: ContainerField(
                                    fieldTitle: "Date Complaint Filed:",
                                    // widthMultiplier: .2,
                                    value: controller
                                            .observeComplaintInformation()
                                            .value
                                            ?.date ??
                                        Constants.BLANK,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 200),
                      color: Colors.white.withOpacity(.5),
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Complaint Details".toUpperCase(),
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
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Urgency of Problem:",
                                    // widthMultiplier: .23,
                                    value: controller
                                            .observeComplaintInformation()
                                            .value
                                            ?.urgency ??
                                        Constants.BLANK,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Specific Type of Problem:",
                                    // widthMultiplier: .23,
                                    value: controller
                                            .observeComplaintInformation()
                                            .value
                                            ?.type ??
                                        Constants.BLANK,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ContainerField(
                                    fieldTitle: "Date of Incident:",
                                    // widthMultiplier: .23,
                                    value: controller
                                            .observeComplaintInformation()
                                            .value
                                            ?.date ??
                                        Constants.BLANK,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: ContainerField(
                                fieldTitle: "Full Location of Incident:",
                                // widthMultiplier: .5,
                                value: controller
                                        .observeComplaintInformation()
                                        .value
                                        ?.location ??
                                    Constants.BLANK,
                              ),
                            ),
                            Center(
                              child: ContainerAttachment(
                                fieldTitle: "Attachment:",
                                controller: controller
                                        .observeComplaintInformation()
                                        .value
                                        ?.attacthment ??
                                    Constants.BLANK,
                              ),
                            ),
                            NarrativeField(
                              fieldTitle: "Narrative Report",
                              value: controller
                                      .observeComplaintInformation()
                                      .value
                                      ?.narrative ??
                                  Constants.BLANK,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .1,
                              child: ContainerField(
                                fieldTitle: "Previous Action Taken:",
                                // widthMultiplier: .2,
                                value: controller
                                        .observeComplaintInformation()
                                        .value
                                        ?.previousActionTaken ??
                                    Constants.BLANK,
                              ),
                            ),
                            Center(
                              heightFactor: 2,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                width: MediaQuery.of(context).size.height * .5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: Colors.white.withOpacity(.5),
                                ),
                                child: Center(
                                  child: Text(
                                    "Witness/Involved Parties(if applicable):",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ContainerField(
                                        fieldTitle: "Name:",
                                        value: controller
                                                .observeComplaintInformation()
                                                .value
                                                ?.witnessName ??
                                            Constants.BLANK,
                                      ),
                                      ContainerField(
                                        fieldTitle: "Contact:",
                                        value: controller
                                                .observeComplaintInformation()
                                                .value
                                                ?.witnessContact ??
                                            Constants.BLANK,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 4,
                                  child: NarrativeField(
                                    fieldTitle: "Resolution Request:",
                                    value: controller
                                            .observeComplaintInformation()
                                            .value
                                            ?.resolutionRequest ??
                                        Constants.BLANK,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
    Key? key,
    required this.fieldTitle,
    required this.value,
  }) : super(key: key);

  final String fieldTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style: TextStyle(
              color: Constants.standardColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerAttachment extends StatelessWidget {
  const ContainerAttachment({
    super.key,
    required this.fieldTitle,
    required this.controller,
  });

  final String fieldTitle;
  final String controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 15),
      child: Column(
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
          CachedNetworkImage(
            imageUrl: controller,
            height: 400,
            width: 400,
          ),
        ],
      ),
    );
  }
}

class NarrativeField extends StatelessWidget {
  const NarrativeField({
    Key? key,
    required this.fieldTitle,
    required this.value,
  }) : super(key: key);

  final String fieldTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style: TextStyle(
              color: Constants.standardColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
