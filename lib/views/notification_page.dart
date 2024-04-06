import 'package:app/controllers/notification_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends BaseView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WhiteBackAppbar(
          height: MediaQuery.of(context).size.height * 0.20,
          widthGap: MediaQuery.of(context).size.width * 0.05,
          title: AppLocalizations.of(context).translate('your_notifications'),
        ),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (controller.observeLoading().isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Obx(() {
              if (controller.observeLoading().isTrue) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Card(
                  color: const Color.fromRGBO(169, 202, 174, 1),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  elevation: 1.0,
                  shadowColor: const Color.fromARGB(255, 196, 233, 202),
                  child: ListTileTheme(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    textColor: const Color.fromARGB(255, 106, 129, 107),
                    tileColor: Colors.green[100],
                    style: ListTileStyle.list,
                    dense: true,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: controller.getListCount(),
                      itemBuilder: (context, index) => Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          leading: Icon(
                            CupertinoIcons.bell_fill,
                            color: Constants.standardColor,
                          ),
                          title: Text(
                            controller
                                    .observeNotifications()
                                    .value?[index]
                                    .message ??
                                Constants.BLANK,
                          ),
                          trailing: TextButton(
                            onPressed: () => controller.launchView(),
                            child: Text(
                              AppLocalizations.of(context).translate('view'),
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green.shade300,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 2,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            });
          }
        }));
  }
}
