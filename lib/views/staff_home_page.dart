import 'package:app/views/base_view.dart';
import 'package:app/widgets/staff_home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class StaffHomePage extends BaseView {

  const StaffHomePage( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: StaffHomeAppBarWidget(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05,),
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("StaffHomePage")),        
      ),
    ); 
  }
}