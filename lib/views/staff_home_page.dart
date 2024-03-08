import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class StaffHomePage extends BaseView {

  const StaffHomePage( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("StaffHomePage")) ,
      ),
    ); 
  }
}