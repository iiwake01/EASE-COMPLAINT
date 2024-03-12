import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerWidget extends BaseWidget {
  
  const DatePickerWidget( {
    super.key,
    this.labelText,
    this.hintText,
    required this.dateController,
    this.firstDate,
  } );

  final String? labelText;
  final String? hintText;
  final Rx<TextEditingController?> dateController;
  final DateTime? firstDate;

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
      TextField (
        controller: dateController.value,
        decoration: InputDecoration (
          icon: const Icon(CupertinoIcons.calendar,),
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker (
            context: context,
            initialDate: DateTime.now(),
            firstDate: firstDate ?? DateTime.now().subtract(const Duration(days: 365)),//not to allow to choose before today.
            lastDate: DateTime.now().add( const Duration(days: 365) )
          );
          if (pickedDate != null) {            
            dateController(TextEditingController( text: "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}"));
          }
        },
      )
    );
  }
}