import 'package:app/controllers/residents_list_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/views/staff_complaints_list_page.dart';
import 'package:app/widgets/resident_tile.dart';
import 'package:app/widgets/search_view_widget.dart';
import 'package:app/widgets/white_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentsListPage extends BaseView<ResidentsListController> {
  const ResidentsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteBackAppbar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: AppLocalizations.of(context).translate('list_of_residents'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width * .775,
          decoration: BoxDecoration(
            color: Constants.appBarColor,
            borderRadius: const BorderRadius.all(Radius.circular(36)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 50),
                    child: Text(
                      "Resident List",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SearchViewWidget(
                    textEditingController: controller.searchController,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .7,
                    // margin: EdgeInsets.symmetric(horizontal: 90),
                    // color: Colors.red,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(""),
                            TitleWidget(
                              title: "Last Name",
                              multiplier: .1,
                            ),
                            TitleWidget(
                              title: "First Name",
                              multiplier: .1,
                            ),
                            TitleWidget(
                              title: "Zone",
                              multiplier: .07,
                            ),
                            TitleWidget(
                              title: "Age",
                              multiplier: .13,
                            ),
                            // TitleWidget(title: "")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      child: ListView.builder(
                        itemCount: controller.getList().length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ResidentTile(
                              resident: controller.getList()[index]);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
