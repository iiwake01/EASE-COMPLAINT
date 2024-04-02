import 'package:app/controllers/resident_complaint_information_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintInformationPage extends BaseView<ResidentsComplaintInformationController> {
  const ResidentsComplaintInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WhiteBackAppbar(
          height: MediaQuery.of(context).size.height * 0.20,
          widthGap: MediaQuery.of(context).size.width * 0.05,
          title: "Complaint Information",
        ),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (controller.observeLoading().isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //controller.observeResidentInformation
            //controller.observeComplaintInformation()
            return Center(
              child: Column(
                children: [Text("Basta center")],
              ),
            );
          }
        }));
  }
}
