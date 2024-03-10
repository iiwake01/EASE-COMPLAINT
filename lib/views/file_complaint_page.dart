import 'package:app/controllers/file_complaint_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:app/widgets/file_complaint_button.dart';
import 'package:flutter/material.dart';

class FileComplaintPage extends BaseView<FileComplaintController> {

  const FileComplaintPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('what_type_of_complaint_are_you_going_to_file_'),),
      backgroundColor: Colors.white,
      body: Center (
        child: Card (
          color: const Color.fromARGB(255, 169, 202, 174),
          margin: const EdgeInsets.symmetric(horizontal: 200, vertical: 50),
          elevation: 1.0,
          shadowColor: const Color.fromARGB(255, 196, 233, 202),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),  
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  FileComplaintButton (
                    onPressed: () => controller.launchEnvironmentalProblems(),
                    text: AppLocalizations.of(context).translate('environmental_problems'),
                  ),
                  FileComplaintButton (
                    onPressed: () => controller.launchCommunityConflicts(),
                    text: AppLocalizations.of(context).translate('community_conflicts'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  FileComplaintButton (
                    onPressed: () => controller.launchPublicDisturbances(),
                    text: AppLocalizations.of(context).translate('public_disturbances'),
                  ),
                  FileComplaintButton (
                    onPressed: () => controller.launchCrimeRelated(),
                    text: AppLocalizations.of(context).translate('crime_related'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
              FileComplaintButton (
                onPressed: () => controller.launchOtherTypeProblem(),
                text: AppLocalizations.of(context).translate('other_type_of_problem'),
              ),    
              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),    
            ],
          ),
        ),
      ),
    );
  }
}