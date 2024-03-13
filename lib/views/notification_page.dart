import 'package:app/controllers/notification_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends BaseView<NotificationController> {
  
  const NotificationPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('your_notifications'),),
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("NotificationPage")) ,
      ),
    );
  }
}