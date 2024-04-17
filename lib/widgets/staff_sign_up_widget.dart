import 'package:app/controllers/sign_up_controller.dart';
import 'package:app/controllers/staff_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffSignUpWidget extends BaseWidget<StaffController> {
  const StaffSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardMargin = MediaQuery.of(context).size.width * 0.20;
    return Card(
      margin: EdgeInsets.only(
          left: cardMargin, top: 0, right: cardMargin, bottom: 0),
      elevation: 1.0,
      shadowColor: Colors.grey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 13, left: 20.0, right: 20.0, bottom: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "NEW STAFF ACCOUNT CREATION",
              style: TextStyle(
                color: Constants.standardColor,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: TextFieldWidget(
                    textEditingController: controller.emailController,
                    labelText: AppLocalizations.of(context).translate('email'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                Flexible(
                  child: TextFieldWidget(
                    textEditingController: controller.passwordController,
                    labelText:
                        AppLocalizations.of(context).translate('password'),
                    isTextHidden: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.confirmPasswordController,
              labelText:
                  AppLocalizations.of(context).translate('confirm_password'),
              isTextHidden: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.firstNameController,
              labelText: AppLocalizations.of(context).translate('first_name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.lastNameController,
              labelText: AppLocalizations.of(context).translate('last_name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.middleNameController,
              labelText: AppLocalizations.of(context).translate('middle_name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            DatePickerWidget(
              labelText: AppLocalizations.of(context).translate('birthdate'),
              dateController: controller.birthdateController,
              firstDate: DateTime.now().subtract(const Duration(days: 73000)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.contactNumberController,
              labelText:
                  AppLocalizations.of(context).translate('contact_number'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.positionController,
              labelText: "Position",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.standardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () => controller.validate(),
                child: const Text(
                  "Create Account",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
