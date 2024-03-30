import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/models/resident.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class ResidentTile extends BaseView<StaffComplaintsListController> {
  ResidentTile({super.key, required this.test});
  Test test;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .05,
      width: MediaQuery.of(context).size.width * .7,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DataWidget(data: test.name),
          DataWidget(data: test.zone),
          DataWidget(data: test.complaintType),
          DataWidget(data: test.date),
          DataWidget(data: test.status),
          TextButton(
              onPressed: () => controller.launchView(),
              child: const Text(
                "View",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ))
        ],
      ),
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
