import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';

class ResidentAccountsPage extends BaseView {
  
  const ResidentAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar (
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: AppLocalizations.of(context).translate('residents_accounts'),
      ),
      body: null,
    );
  }
}