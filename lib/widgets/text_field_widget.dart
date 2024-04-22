import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends BaseWidget {
  
  const TextFieldWidget( {
    super.key,
    required this.textEditingController,
    this.labelText,
    this.isTextHidden,
    this.isReadOnly,
    this.textInputType,
    this.inputFormatters,
  } );

  final TextEditingController? textEditingController;
  final String? labelText;
  final bool? isTextHidden, isReadOnly;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: null,
        prefixIcon: null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color.fromARGB(96, 114, 113, 113)),
        ),
      ),
      inputFormatters: inputFormatters,
      keyboardType: textInputType?? TextInputType.text,
      obscureText: isTextHidden ?? false,
      readOnly: isReadOnly ?? false,
    );
  }
}