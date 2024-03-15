import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditWidget extends BaseWidget<ProfileController> {
  
  const ProfileEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child:  Column (
        children: <Widget> [
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('first_name'), textEditingController: controller.firstNameController, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('last_name'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('middle_name'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('sex'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('age'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('birthdate'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('contact_number'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('status'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('zone_you_reside_in'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('house_number_street_name'), textEditingController: null, isReadOnly: false,),
          TextFieldWidget(labelText: AppLocalizations.of(context).translate('email_address'), textEditingController: null, isReadOnly: false,),
          ElevatedButton (
            style: ElevatedButton.styleFrom (
              backgroundColor: Colors.grey, 
              shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
              textStyle: const TextStyle(fontSize: 20)
            ),
            onPressed: () => controller.launchReadOnly(),
            child: Text(AppLocalizations.of(context).translate('save_information'), style: const TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ],
      ),
    );
  }  
}