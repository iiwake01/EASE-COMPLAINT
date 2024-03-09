import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class StaffComplaintsListPage extends BaseView<StaffComplaintsListController> {

  const StaffComplaintsListPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("StaffComplaintsListPage")) ,
      ),
    );
  }
}