import 'package:app/widgets/base_widgets.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends BaseWidget {
  const SearchViewWidget({
    super.key,
    this.textEditingController,
    this.onPressed,
  });

  final TextEditingController? textEditingController;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, top: 30),
      child: SizedBox(
        width: 200,
        child: SearchFieldWidget(
          textEditingController: textEditingController,
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: onPressed, icon: const Icon(CupertinoIcons.search)),
        ),
      ),
    );
  }
}

class SearchFieldWidget extends BaseWidget {
  const SearchFieldWidget({
    super.key,
    this.labelText,
    required this.hintText,
    this.isObscureText,
    this.textEditingController,
    this.suffixIcon,
  });

  final String? labelText;
  final String hintText;
  final bool? isObscureText;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
    );
  }
}
