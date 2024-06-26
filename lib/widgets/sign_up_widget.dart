import 'package:app/controllers/sign_up_controller.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/date_picker_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpWidget extends BaseWidget<SignUpController> {
  const SignUpWidget({super.key});

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
              AppLocalizations.of(context).translate('make_a_new_account_'),
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
            Obx(() => DropdownButton(
                  value: controller.selectedGender.value,
                  items: controller.genderList
                      .map<DropdownMenuItem<String>>(
                          (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                      .toList(),
                  onChanged: (gender) => controller.updateGender(gender),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.ageController,
              labelText: AppLocalizations.of(context).translate('age'),
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
              labelText: AppLocalizations.of(context).translate('contact_number'),
              textInputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Obx(
              () => DropdownButton(
                value: controller.selectedStatus.value,
                items: controller.statusList
                    .map<DropdownMenuItem<String>>((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (status) => controller.updateStatus(status),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Obx(
              () => DropdownButton(
                value: controller.selectedZone.value,
                items: controller.zoneList
                    .map<DropdownMenuItem<String>>((zone) => DropdownMenuItem(
                          value: zone,
                          child: Text(zone),
                        ))
                    .toList(),
                onChanged: (zone) => controller.updateZone(zone),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextFieldWidget(
              textEditingController: controller.houseStreetController,
              labelText: AppLocalizations.of(context)
                  .translate('house_number_street_name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)
                      .translate('please_attach_any_valid_proof_of_residency'),
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
            Row(
              children: [
                Obx(() => Checkbox(
                      value: controller.observedTerms().isTrue,
                      onChanged: (isChecked) => controller.toggleTerms(),
                    )),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context).translate(
                            'i_have_read_and_agreed_to_the_terms_and_conditions'),
                        style: TextStyle(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add your navigation logic here
                            Get.toNamed(Routes.TERMSANDCONDITIONS);
                          },
                      ),
                    ],
                  ),
                )
              ],
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
                child: Text(
                  AppLocalizations.of(context).translate('sign_up'),
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
