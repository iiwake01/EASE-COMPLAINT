import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppBar extends BaseWidget<ProfileController>
    implements PreferredSizeWidget {
  const ProfileAppBar({super.key, this.height, this.widthGap, this.title});

  final double? height, widthGap;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      backgroundColor: Colors.white,
      height: height ?? kToolbarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: widthGap,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20))),
            ),
          ),
          Text(
            title ?? Constants.BLANK,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            // height: 100,
            // width: 100,
            right: widthGap,
            child: InkWell(
              customBorder: Border.all(color: Colors.black),
              onTap: () {
                controller.onPickFiles();
              },
              child: Obx(() {
                if (controller.hasFile.isTrue) {
                  return Container(
                    height: 150,
                    width: 150,
                    // clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: MemoryImage(controller.liveFileBytes.value),
                        fit: BoxFit.cover,
                        // scale: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  );
                } else if (controller.hasFile.isFalse &&
                    controller.photo.isBlank == true) {
                  return const Column(
                    children: [
                      Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.green,
                        size: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Add/Update Image",
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CachedNetworkImage(
                      imageUrl: controller.photo.value,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, error, stackTrace) => const Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.red,
                        size:
                            50, // Adjust the size of the icon to match the circle size
                      ),
                    ),
                  );
                }
              }),
              // Column(
              //   children: [

              //     // Column(
              //     //   children: [
              //     //     const SizedBox(
              //     //       height: 30,
              //     //     ),
              //     //     const Icon(
              //     //       CupertinoIcons.plus_circle_fill,
              //     //       color: Colors.green,
              //     //     ),
              //     //     Text(
              //     //       AppLocalizations.of(context)
              //     //           .translate('add_or_change_photo'),
              //     //       style: const TextStyle(
              //     //         fontSize: 10,
              //     //       ),
              //     //     ),
              //     //   ],
              //     // )
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
