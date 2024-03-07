import 'package:app/controllers/login_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseView<LoginController> {

  const LoginPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("LoginPage")) ,
      ),
    );
  }
}