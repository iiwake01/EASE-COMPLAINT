import 'package:app/controllers/home_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/admin_home_appbar.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends BaseView<HomedController> {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminHomeAppbar(
        height: MediaQuery.of(context).size.height * .20,
        widthGap: MediaQuery.of(context).size.width * .05,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdminHomeWidget(
                  onpressed: () {
                    controller.launchManageResident();
                  },
                  title: 'MANGE RESIDENT\nACCOUNTS',
                ),
                const SizedBox(
                  height: 40,
                ),
                AdminHomeWidget(
                  onpressed: () {
                    controller.launchManageResident();
                  },
                  title: 'MANGE STAFF\nACCOUNTS',
                ),
                const SizedBox(
                  height: 40,
                ),
                AdminHomeWidget(
                  onpressed: () {
                    controller.launchManageResident();
                  },
                  title: 'CREATE NEW STAFF\nACCOUNTS',
                )
              ],
            ),
          )),
    );
  }
}

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({
    super.key,
    required this.title,
    this.onpressed,
  });

  final VoidCallback? onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        width: MediaQuery.of(context).size.width * .22,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 26, 59, 27),
            elevation: 1,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(36)),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
