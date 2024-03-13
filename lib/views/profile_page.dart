import 'package:app/controllers/profile_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends BaseView<ProfileController> {

  const ProfilePage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      appBar: ProfileAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('your_account_information'),),
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("ProfilePage")) ,
      ),
    );
  }
}