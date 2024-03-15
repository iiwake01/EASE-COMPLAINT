import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ProfileReadOnlyWidget extends BaseWidget<ProfileController> {
  
  const ProfileReadOnlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child:  Column (
        children: <Widget> [
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('first_name'), textEditingController: controller.firstNameController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('last_name'), textEditingController: controller.lastNameController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('middle_name'), textEditingController: controller.middleNameController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('sex'), textEditingController: controller.genderController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('age'), textEditingController: controller.ageController, isReadOnly: true,),
          DatePickerWidget(labelText: AppLocalizations.of(context).translate('birthdate'), dateController: controller.birthdateController, firstDate: DateTime.now().subtract(const Duration(days: 73000)),),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('contact_number'), textEditingController: controller.contactNumberController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('status'), textEditingController: controller.statusController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('zone_you_reside_in'), textEditingController: controller.zoneController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('house_number_street_name'), textEditingController: controller.houseStreetController, isReadOnly: true,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('email_address'), textEditingController: controller.emailController, isReadOnly: true,),
          ElevatedButton (
            style: ElevatedButton.styleFrom (
              backgroundColor: Colors.grey, 
              shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
              textStyle: const TextStyle(fontSize: 20)
            ),
            onPressed: () => controller.launchEditMode(),
            child: Text(AppLocalizations.of(context).translate('edit_information'), style: const TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ],
      ),
    );
  }
}