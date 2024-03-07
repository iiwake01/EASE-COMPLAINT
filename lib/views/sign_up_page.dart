import 'package:app/controllers/sign_up_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class SignUpPage extends BaseView<SignUpController> {

  const SignUpPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("SignUpPage")) ,
      ),
    );
  }
}