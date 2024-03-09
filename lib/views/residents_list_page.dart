import 'package:app/controllers/residents_list_binding.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class ResidentsListPage extends BaseView<ResidentsListController> {

  const ResidentsListPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("ResidentsListPage")) ,
      ),
    );
  }
}