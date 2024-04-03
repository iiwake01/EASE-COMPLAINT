import 'package:app/routes/app_pages.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/staff_home_page.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintAppbar extends BaseWidget implements PreferredSizeWidget {
  const ComplaintAppbar({super.key, this.height, this.widthGap, this.title});

  final double? height, widthGap;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      backgroundColor: Constants.standardColor,
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
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20))),
            ),
          ),
          const Spacer(),
          HomeButton(widthGap: widthGap),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.widthGap,
  });

  final double? widthGap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: widthGap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Get.offAndToNamed(Routes.STAFFHOME),
            icon: const Icon(
              Icons.house_rounded,
              size: 35,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(backgroundColor: Colors.green.shade200),
          ),
          SizedBox(
            height: 5,
          ),
          const Text(
            "Return Home",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
