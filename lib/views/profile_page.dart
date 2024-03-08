import 'package:app/controllers/profile_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends BaseView<ProfileController> {

  const ProfilePage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("ProfilePage")) ,
      ),
    );
  }
}