import 'package:app/controllers/staff_complaints_list_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffComplaintsListPage extends BaseView<StaffComplaintsListController> {

  const StaffComplaintsListPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('records_of_complaints'),),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return DataTable (
            columns: <DataColumn> [
              const DataColumn(label: SizedBox()),
              DataColumn(label: Text(AppLocalizations.of(context).translate('complaint_s_name'), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text(AppLocalizations.of(context).translate('zone'), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text(AppLocalizations.of(context).translate('complaint_type'), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text(AppLocalizations.of(context).translate('date_filled'), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text(AppLocalizations.of(context).translate('status'), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              const DataColumn(label: SizedBox()),
            ], 
            rows: controller.getList().map((model) => DataRow(cells: <DataCell> [
              DataCell (
                CachedNetworkImage (
                  imageUrl: model.photo ?? Constants.BLANK,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  placeholder: (context, url) {
                    return const CircularProgressIndicator();
                  },
                  errorWidget: ( (context, error, stackTrace) {
                    return const Icon(CupertinoIcons.person_circle, color: Colors.grey,);
                  } ),
                ),
              ),
              DataCell(Text(model.name ?? Constants.BLANK, style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.zone ?? Constants.BLANK, style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.type ?? Constants.BLANK, style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.date ?? Constants.BLANK, style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.status ?? Constants.BLANK, style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(
                TextButton (
                  onPressed: () => controller.launchView(),
                  child: Text(AppLocalizations.of(context).translate('view'),style: const TextStyle(color: Color.fromARGB(255, 106, 129, 107),decoration: TextDecoration.underline,decorationColor: Color.fromARGB(255, 156, 204, 156),decorationStyle: TextDecorationStyle.solid,decorationThickness: 2,fontSize: 20),),
                )
              )
            ])).toList()
          );
        }
      } ),
    );
  }
}