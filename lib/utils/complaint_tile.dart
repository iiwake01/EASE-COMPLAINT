import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/models/complaint.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplaintTile extends BaseView<StaffComplaintsListController> {
  const ComplaintTile({Key? key, required this.resident}) : super(key: key);
  final Complaint resident;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width * .9,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: resident.photo,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
              alignment: Alignment.center,
              placeholder: (context, url) {
                return const CircularProgressIndicator();
              },
              errorWidget: (context, error, stackTrace) {
                // Display a placeholder or alternative image
                return const Icon(
                  CupertinoIcons.person_circle,
                  color: Colors.grey,
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.name),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.zone),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.complaintType),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .0675,
            child: DataWidget(data: resident.date),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.status),
          ),
          TextButton(
            onPressed: () => controller.launchView(),
            child: const Text(
              "View",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
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
