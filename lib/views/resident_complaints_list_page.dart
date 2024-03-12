import 'package:app/controllers/resident_complaints_list_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentComplaintsListPage extends BaseView<ResidentComplaintsListController> {

  const ResidentComplaintsListPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('record_of_your_complaints'),),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Card (
            color: const Color.fromRGBO(169, 202, 174, 1),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            elevation: 1.0,
            shadowColor: const Color.fromARGB(255, 196, 233, 202),
            child: ListTileTheme (
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              textColor: const Color.fromARGB(255, 106, 129, 107),
              tileColor: Colors.green[100],
              style: ListTileStyle.list,
              dense: true, 
              child: ListView.builder (
                itemCount: controller.getListCount(),
                itemBuilder: (context, index) => Card (
                  clipBehavior: Clip.antiAlias,
                  child: ListTile (
                    leading: Text(controller.getType(index)),
                    title: Text(controller.getDate(index)),
                    trailing: Row (
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text( controller.getStatus(index) ),
                        TextButton (
                          onPressed: () => controller.launchView(),
                          child: Text(AppLocalizations.of(context).translate('view'),style: const TextStyle(decoration: TextDecoration.underline,decorationColor: Color.fromARGB(255, 156, 204, 156),decorationStyle: TextDecorationStyle.solid,decorationThickness: 2,fontSize: 20),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }        
      }),
    );
  }
}