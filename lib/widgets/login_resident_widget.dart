import 'package:app/controllers/login_controller.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class LoginResidentWidget extends BaseWidget<LoginController> {

  const LoginResidentWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.grey,
      child: const Center( child: Text("LoginResidentWidget")) ,
    );
  }
}