import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsListPage extends BaseView<ResidentsListController> {

  const ResidentsListPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.observeLoading().isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return DataTable (
            columns: const <DataColumn> [
              DataColumn(label: SizedBox()),
              DataColumn(label: Text("Last Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text("First Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text("Zone", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: Text("Age", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataColumn(label: SizedBox()),
            ], 
            rows: controller.getList().map((model) => DataRow(cells: <DataCell> [
              DataCell (
                CachedNetworkImage (
                  imageUrl: model.photo ?? "",
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
              DataCell(Text(model.last ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.first ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.zone ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(Text(model.age ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
              DataCell(
                TextButton (
                  onPressed: () {},
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