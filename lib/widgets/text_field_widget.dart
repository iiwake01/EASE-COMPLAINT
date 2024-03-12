import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends BaseWidget {
  
  const TextFieldWidget( {
    super.key,
    required this.textEditingController,
    this.labelText,
    this.isTextHidden
  } );

  final TextEditingController? textEditingController;
  final String? labelText;
  final bool? isTextHidden;

  @override
  Widget build(BuildContext context) {
    return TextFormField (
      controller: textEditingController,
      decoration: InputDecoration (
        labelText: labelText,
        hintText: null,
        prefixIcon: null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder (
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: isTextHidden ?? false,
    );
  }
}