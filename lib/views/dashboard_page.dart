import 'package:app/controllers/dashboard_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class DashboardPage extends BaseView<DashboardController> {

  const DashboardPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("DashboardPage")) ,
      ),
    );
  }
}