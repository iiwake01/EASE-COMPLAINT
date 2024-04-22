import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaffProfileEditWidget extends BaseWidget<ProfileController> {
  const StaffProfileEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(36),
            color: Colors.green.shade50,
          ),
          child: Column(
            children: <Widget>[
              TextFieldWidget(
                labelText: AppLocalizations.of(context).translate('first_name'),
                textEditingController: controller.firstNameController,
                isReadOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText: AppLocalizations.of(context).translate('last_name'),
                textEditingController: controller.lastNameController,
                isReadOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText:
                    AppLocalizations.of(context).translate('middle_name'),
                textEditingController: controller.middleNameController,
                isReadOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              DatePickerWidget(
                labelText: AppLocalizations.of(context).translate('birthdate'),
                dateController: controller.birthdateController,
                firstDate: DateTime.now().subtract(const Duration(days: 73000)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText: AppLocalizations.of(context).translate('contact_number'),
                textEditingController: controller.contactNumberController,
                isReadOnly: false,
                textInputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText:
                    AppLocalizations.of(context).translate('email_address'),
                textEditingController: controller.emailController,
                isReadOnly: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText: AppLocalizations.of(context).translate('position'),
                textEditingController: controller.positionController,
                isReadOnly: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.standardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () => controller.launchReadOnly(),
                child: Text(
                  AppLocalizations.of(context).translate('save_information'),
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
