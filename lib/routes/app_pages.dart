import 'package:app/bindings/dashboard_binding.dart';
import 'package:app/bindings/file_complaint_binding.dart';
import 'package:app/bindings/home_binding.dart';
import 'package:app/bindings/login_binding.dart';
import 'package:app/bindings/notification_binding.dart';
import 'package:app/bindings/profile_binding.dart';
import 'package:app/bindings/resident_complaints_list_binding.dart';
import 'package:app/bindings/residents_list_binding.dart';
import 'package:app/bindings/sign_up_binding.dart';
import 'package:app/bindings/staff_complaints_list_binding.dart';
import 'package:app/views/dashboard_page.dart';
import 'package:app/views/file_complaint_page.dart';
import 'package:app/views/login_page.dart';
import 'package:app/views/notification_page.dart';
import 'package:app/views/profile_page.dart';
import 'package:app/views/resident_complaints_list_page.dart';
import 'package:app/views/resident_home_page.dart';
import 'package:app/views/residents_list_page.dart';
import 'package:app/views/sign_up_page.dart';
import 'package:app/views/staff_complaints_list_page.dart';
import 'package:app/views/staff_home_page.dart';
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
    GetPage (
      name: Routes.RESIDENTHOME,
      page: () => const ResidentHomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.STAFFHOME,
      page: () => const StaffHomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
     GetPage (
      name: Routes.NOTIFICATION,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.FILECOMPLAINT,
      page: () => const FileComplaintPage(),
      binding: FileComplaintBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.RESIDENTCOMPLAINTSLIST,
      page: () => const ResidentComplaintsListPage(),
      binding: ResidentComplaintsListBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.STAFFCOMPLAINTSLIST,
      page: () => const StaffComplaintsListPage(),
      binding: StaffComplaintsListBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.RESIDENTSLIST,
      page: () => const ResidentsListPage(),
      binding: ResidentsListBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}