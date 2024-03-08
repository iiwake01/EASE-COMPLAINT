import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class ResidentHomePage extends BaseView {

  const ResidentHomePage( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("ResidentHomePage")) ,
      ),
    ); 
  }
}