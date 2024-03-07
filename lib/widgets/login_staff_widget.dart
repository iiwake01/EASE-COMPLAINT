import 'package:app/controllers/login_controller.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class LoginStaffWidget extends BaseWidget<LoginController> {

  const LoginStaffWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.grey,
      child: const Center( child: Text("LoginStaffWidget")) ,
    );
  }
}