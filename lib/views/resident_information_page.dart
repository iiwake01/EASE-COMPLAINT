import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ResidentsInformationPage extends BaseView<ResidentsListController> {
  const ResidentsInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: "User Information",
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
              child: Column(
                children: [
                  Row(
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
                            width: MediaQuery.of(context).size.width * .175,
                            color: Colors.white,
                            child: Text(
                              "John Richard",
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
                              "Alix",
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
                              "Badong",
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
                              "Male",
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
                              "20",
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
                              "10/18/2003",
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
                              "09103294272",
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
                              "Single",
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
                              "#2278 Macajalar",
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
                              "Camaman-an",
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
                              "jalix2003@gmail.com",
                              style: TextStyle(
                                  color: Constants.standardColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
