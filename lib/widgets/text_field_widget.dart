import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends BaseWidget {
  const TextFieldWidget(
      {super.key,
      required this.textEditingController,
      this.labelText,
      this.isTextHidden,
      this.isReadOnly});

  final TextEditingController? textEditingController;
  final String? labelText;
  final bool? isTextHidden, isReadOnly;

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
          borderSide:
              BorderSide(color: const Color.fromARGB(96, 114, 113, 113)),
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: isTextHidden ?? false,
      readOnly: isReadOnly ?? false,
    );
  }
}
