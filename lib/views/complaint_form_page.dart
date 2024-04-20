import 'package:app/controllers/complaint_form_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintFormPage extends BaseView<ComplaintFormController> {
  ComplaintFormPage({super.key});

  //  final List<String> urgencyList = [
  //   AppLocalizations.of(Get.context!).translate('minor'),
  //   AppLocalizations.of(Get.context!).translate('medium'),
  //   AppLocalizations.of(Get.context!).translate('major'),
  //   AppLocalizations.of(Get.context!).translate('critical'),
  // ];

  // RxString selectedUrgency = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: AppLocalizations.of(context).translate('complaint_form'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context).translate('complaint_details'),
                style: TextStyle(color: Constants.standardColor, fontSize: 24),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.urgencyController,
                  labelText: AppLocalizations.of(context)
                      .translate('urgency_of_problem')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Obx(
                () => TextFieldWidget(
                    textEditingController: controller.typeController.value,
                    labelText: AppLocalizations.of(context)
                        .translate('specify_type_of_problem')),
              ),
              SizedBox(
                height: 10,
              ),
              DatePickerWidget(
                labelText:
                    AppLocalizations.of(context).translate('date_of_incident'),
                dateController: controller.incidentDateController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.locationController,
                  labelText: AppLocalizations.of(context)
                      .translate('full_location_of_incident')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).translate('attacthments'),
                  ),
                  IconButton(
                      onPressed: () => controller.onPickFiles(),
                      icon: const Icon(
                        CupertinoIcons.paperclip,
                      )),
                  Obx(() => Text(controller.liveFile.value))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.narrativeController,
                  labelText: AppLocalizations.of(context)
                      .translate('narrative_report')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.previousActionConroller,
                  labelText: AppLocalizations.of(context)
                      .translate('previous_action_taken')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.nameController,
                  labelText: AppLocalizations.of(context)
                      .translate('name_of_any_person_involved')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.contactController,
                  labelText: AppLocalizations.of(context)
                      .translate('contact_information')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextFieldWidget(
                  textEditingController: controller.resolutionController,
                  labelText: AppLocalizations.of(context)
                      .translate('resolution_request')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () => controller.validate(),
                child: Text(
                  AppLocalizations.of(context).translate('submit_complaint'),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
