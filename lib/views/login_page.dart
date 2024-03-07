import 'package:app/controllers/login_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseView<LoginController> {

  const LoginPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBarWidget (
        height: MediaQuery.of(context).size.height * 0.20,
        child: const Row(),
      ),
      backgroundColor: Colors.white,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("LoginPage")) ,
      ),
    );
  }
}