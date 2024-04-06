import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/models/resident_model.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/views/staff_complaints_list_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentTile extends BaseView<ResidentsListController> {

  const ResidentTile({super.key, required this.resident});
  final ResidentModel resident;

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
            child: CachedNetworkImage (
              imageUrl: resident.photo ?? Constants.BLANK,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
              alignment: Alignment.center,
              placeholder: (context, url) {
                return const CircularProgressIndicator();
              },
              errorWidget: (context, error, stackTrace) {
                return const Icon(
                  CupertinoIcons.person_circle,
                  color: Colors.grey,
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.last ?? Constants.BLANK),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            child: DataWidget(data: resident.first ?? Constants.BLANK),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .075,
            child: DataWidget(data: resident.zone ?? Constants.BLANK),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .06,
            child: DataWidget(data: resident.age ?? Constants.BLANK),
          ),
          TextButton(
            onPressed: () => controller.launchView(resident.uid),
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