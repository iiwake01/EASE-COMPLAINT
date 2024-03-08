import 'package:app/controllers/notification_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class NotificationPage extends BaseView<NotificationController> {
  
  const NotificationPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("NotificationPage")) ,
      ),
    );
  }
}