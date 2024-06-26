import 'package:app/controllers/login_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/header_app_bar.dart';
import 'package:app/widgets/login_resident_widget.dart';
import 'package:app/widgets/login_staff_widget.dart';
import 'package:app/widgets/login_widget.dart';
import 'package:app/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.10,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/easebg.jpg"), // Replace "assets/background_image.jpg" with your image path]
            colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(.15),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: PageViewWidget(
          pageController: controller.pageController,
          isLoading: controller.isLoading,
          canScroll: false,
          widgets: const <Widget>[
            LoginWidget(),
            LoginResidentWidget(),
            LoginStaffWidget(),
          ],
        ),
      ),
    );
  }
}
