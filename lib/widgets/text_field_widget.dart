import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends BaseWidget {
  
  const TextFieldWidget( {
    super.key,
    required this.textEditingController,
    this.hintText,
  } );

  final TextEditingController? textEditingController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField (
      controller: textEditingController,
      decoration: InputDecoration (
        hintText: hintText,
        prefixIcon: null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}