import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppBar extends BaseWidget<ProfileController> implements PreferredSizeWidget {
  
  const ProfileAppBar( {
    super.key,
    this.height,
    this.widthGap,
    this.title
  } );

  final double? height, widthGap;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget (
      backgroundColor: Colors.white,
      height: height ?? kToolbarHeight,
      child: Stack (
        alignment: Alignment.center,
        children: <Widget>[
          Positioned (
            left: widthGap,
            child: IconButton (
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
              style: IconButton.styleFrom (
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric (
                      vertical: 1.0, horizontal: 25.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20))),
            ),
          ),
          Text (
            title?? Constants.BLANK,
            style: const TextStyle(color: Colors.green, fontSize: 20),
          ),
          Positioned (
            right: widthGap,
            child: OutlinedButton (
              onPressed: () { controller.onPickFiles(); },
              child: Column (
                children: [
                  Obx(() {
                    if(controller.hasFile.isTrue && controller.photo.isBlank == true) {
                      return Image.memory (
                        controller.liveFileBytes.value,
                        fit: BoxFit.scaleDown,
                        height: 50,
                        width: 50,
                      );
                    } else if (controller.photo.isBlank == true) {
                      return const Icon (
                        CupertinoIcons.profile_circled,
                        color: Colors.green,
                      );
                     } else {
                      return CachedNetworkImage (
                        imageUrl: controller.photo.value,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, error, stackTrace) => const Icon (CupertinoIcons.profile_circled, color: Colors.red,)
                      );
                    }
                  }),
                  Row (
                    children: [
                      const Icon (
                        CupertinoIcons.plus_circle_fill,
                        color: Colors.green,
                      ),
                      Text (
                        AppLocalizations.of(context).translate('add_or_change_photo'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}