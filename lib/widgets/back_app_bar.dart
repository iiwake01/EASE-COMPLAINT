import 'package:app/utils/constants.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackAppBar extends BaseWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, this.height, this.widthGap, this.title});

  final double? height, widthGap;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      backgroundColor: Constants.appBarColor,
      height: height ?? kToolbarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: widthGap,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: Constants.standardColor,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.green.shade50,
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20))),
            ),
          ),
          Text(
            title ?? Constants.BLANK,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
