import 'package:app/controllers/login_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/app_bar_widget.dart';
import 'package:app/widgets/login_resident_widget.dart';
import 'package:app/widgets/login_staff_widget.dart';
import 'package:app/widgets/login_widget.dart';
import 'package:app/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseView<LoginController> {

  const LoginPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBarWidget (
        height: MediaQuery.of(context).size.height * 0.20,
        child: Row(),
      ),
      backgroundColor: Colors.white,
      body: PageViewWidget (
        pageController: controller.pageController, 
        isLoading: controller.isLoading, 
        widgets: const <Widget> [
          LoginWidget(),
          LoginResidentWidget(),
          LoginStaffWidget(),
        ],
      ),
    );
  }
}