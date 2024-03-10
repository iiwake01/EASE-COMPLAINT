import 'package:app/controllers/dashboard_controller.dart';
import 'package:app/utils/app_localizations.dart';
import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends BaseView<DashboardController> {

  const DashboardPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: BackAppBar(height: MediaQuery.of(context).size.height * 0.20, widthGap: MediaQuery.of(context).size.width * 0.05, title: AppLocalizations.of(context).translate('dashboard_of_complaints'),),
      backgroundColor: Colors.grey,
      body: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Card (
            child: Stack (
              alignment: Alignment.center,
              children: <Widget> [
                const Positioned(top: 10.0, right: 10.0, child: Icon(CupertinoIcons.pencil,),),
                Column (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    const Divider(),
                    Text( AppLocalizations.of(context).translate('top_complaints_in_barangay_bonbon') ),
                    const Divider(),
                    Column( children: controller.getTopComplaintsList().map((topComplaint) => Text(topComplaint)).toList(),)
                  ],
                ),
              ],
            ),
          ),
          Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Card (
                child: Stack (
                  children: <Widget> [
                    const Positioned(top: 10.0, right: 10.0, child: Icon(CupertinoIcons.pencil,),),
                    Column ( 
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget> [
                        const Divider(),
                        Text(AppLocalizations.of(context).translate('solved_complaints')),
                        SizedBox( width: MediaQuery.of(context).size.width * 0.3, child: const Divider( color: Colors.grey, thickness: 1.0),),
                        Text( controller.getSolvedComplaints() ),
                      ],
                    ),
                  ],
                )
              ),
              Card (
                child: Stack (
                  children: <Widget> [
                    const Positioned(top: 10.0, right: 10.0, child: Icon(CupertinoIcons.pencil,),),
                    Column ( 
                      children: <Widget> [ 
                        const Divider(),
                        Text(AppLocalizations.of(context).translate('pending_complaints')),
                        SizedBox( width: MediaQuery.of(context).size.width * 0.3, child: const Divider( color: Colors.grey, thickness: 1.0),),
                        Text( controller.getPendingComplaints() ),
                      ],
                    ),
                  ],
                )
              ),
              Card (
                child: Stack (
                  children: <Widget> [
                    const Positioned(top: 10.0, right: 10.0, child: Icon(CupertinoIcons.pencil,),),
                    Column ( 
                      children: <Widget> [
                        const Divider(),
                        Text(AppLocalizations.of(context).translate('complaints_submitted_today')), 
                        SizedBox( width: MediaQuery.of(context).size.width * 0.3, child: const Divider( color: Colors.grey, thickness: 1.0),),
                        Text( controller.getComplaintsSubmittedToday() ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}