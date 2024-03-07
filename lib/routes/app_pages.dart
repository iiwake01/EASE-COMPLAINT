import 'package:app/bindings/login_binding.dart';
import 'package:app/bindings/sign_up_binding.dart';
import 'package:app/views/login_page.dart';
import 'package:app/views/sign_up_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage (
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.SIGNUP,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}