import 'package:app/controllers/resident_complaint_status_change_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsComplaintChangeStatusPage
    extends BaseView<ResidentComplaintStatusChangeController> {
  const ResidentsComplaintChangeStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: "Update Status",
      ),
      backgroundColor: Colors.white,
      body: Obx( () {
        if (controller.observeLoading().isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                color: Colors.green.shade200.withOpacity(.5),
                border: Border.all(color: Colors.green.shade200),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusContainer(
                    statusTitle: "Unresolved",
                    colorBg: Colors.red.shade200,
                    onclick: () {
                      controller.updateStatus(AppLocalizations.of(context).translate('unresolved'));
                      Get.back();
                    },
                  ),
                  StatusContainer(
                    statusTitle: "Pending",
                    colorBg: Colors.yellow.shade200,
                    onclick: () {
                      controller.updateStatus(AppLocalizations.of(context).translate('pending'));
                      Get.back();
                    },
                  ),
                  StatusContainer(
                    statusTitle: "Resolved",
                    colorBg: Colors.green.shade200,
                    onclick: () {
                      controller.updateStatus(AppLocalizations.of(context).translate('resolved'));
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }, ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    super.key,
    required this.statusTitle,
    required this.colorBg,
    this.onclick,
  });

  final String statusTitle;
  final Color colorBg;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: BorderRadius.circular(100),
      ),
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height * .1,
      child: IconButton(
        onPressed: () => onclick!(),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              statusTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
