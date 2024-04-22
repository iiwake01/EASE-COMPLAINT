import 'package:app/controllers/resident_information_controller.dart';
import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/models/resident_information_model.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/complaint_view_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsInformationPage
    extends BaseView<ResidentsInformationController> {
  const ResidentsInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: "Resident Information",
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: SingleChildScrollView(
                child: Card(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              elevation: 2,
              child: ResidentInformationDataBox(
                model: controller.observeResidentInformation().value,
              ),
            )),
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

  final ResidentModel? model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .07,
                    width: MediaQuery.of(context).size.width * .175,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First Name",
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
                    width: MediaQuery.of(context).size.width * .175,
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
                    width: MediaQuery.of(context).size.width * .175,
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
                    "Sex",
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
                    width: MediaQuery.of(context).size.width * .065,
                    color: Colors.white,
                    child: Text(
                      model?.sex ?? Constants.BLANK,
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
                    "Age",
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
                    width: MediaQuery.of(context).size.width * .065,
                    color: Colors.white,
                    child: Text(
                      model?.age ?? Constants.BLANK,
                      style: TextStyle(
                          color: Constants.standardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    width: MediaQuery.of(context).size.width * .12,
                    color: Colors.white,
                    child: Text(
                      model?.birth ?? Constants.BLANK,
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
                    width: MediaQuery.of(context).size.width * .155,
                    color: Colors.white,
                    child: Text(
                      model?.contact ?? Constants.BLANK,
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
                    "Status",
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
                      model?.status ?? Constants.BLANK,
                      style: TextStyle(
                          color: Constants.standardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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
                    "Zone",
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
                    width: MediaQuery.of(context).size.width * .25,
                    color: Colors.white,
                    child: Text(
                      model?.zone ?? Constants.BLANK,
                      style: TextStyle(
                          color: Constants.standardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "House Number, Street Name",
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
                    width: MediaQuery.of(context).size.width * .35,
                    color: Colors.white,
                    child: Text(
                      model?.houseStreet ?? Constants.BLANK,
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
                    width: MediaQuery.of(context).size.width * .35,
                    color: Colors.white,
                    child: Text(
                      model?.email ?? Constants.BLANK,
                      style: TextStyle(
                          color: Constants.standardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: model?.residency ?? Constants.BLANK,
              width: MediaQuery.of(context).size.width * .5,
              height: 300,
              alignment: Alignment.center,
              placeholder: (context, url) {
                return const CircularProgressIndicator();
              },
              errorWidget: (context, error, StackTrace) {
                return const Icon(
                  Icons.broken_image,
                  color: Colors.red,
                  size: 24,
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "LAST LOG-IN: ${model?.lastLogin ?? Constants.BLANK}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
