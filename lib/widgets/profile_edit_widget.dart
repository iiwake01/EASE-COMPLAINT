import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditWidget extends BaseWidget<ProfileController> {
  const ProfileEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('first_name'),
              textEditingController: controller.firstNameController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('last_name'),
              textEditingController: controller.lastNameController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('middle_name'),
              textEditingController: controller.middleNameController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('sex'),
              textEditingController: controller.genderController,
              isReadOnly: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('age'),
              textEditingController: controller.ageController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            DatePickerWidget(
              labelText: AppLocalizations.of(context).translate('birthdate'),
              dateController: controller.birthdateController,
              firstDate: DateTime.now().subtract(const Duration(days: 73000)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText:
                  AppLocalizations.of(context).translate('contact_number'),
              textEditingController: controller.contactNumberController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context).translate('status'),
              textEditingController: controller.statusController,
              isReadOnly: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText:
                  AppLocalizations.of(context).translate('zone_you_reside_in'),
              textEditingController: controller.zoneController,
              isReadOnly: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: AppLocalizations.of(context)
                  .translate('house_number_street_name'),
              textEditingController: controller.houseStreetController,
              isReadOnly: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText:
                  AppLocalizations.of(context).translate('email_address'),
              textEditingController: controller.emailController,
              isReadOnly: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
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
    );
  }
}
