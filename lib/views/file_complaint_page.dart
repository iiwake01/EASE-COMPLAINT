import 'package:app/controllers/file_complaint_controller.dart';
import 'package:app/views/base_view.dart';
import 'package:flutter/material.dart';

class FileComplaintPage extends BaseView<FileComplaintController> {

  const FileComplaintPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey,
      body: Container (
        color: Colors.grey,
        child: const Center( child: Text("FileComplaintPage")) ,
      ),
    );
  }
}