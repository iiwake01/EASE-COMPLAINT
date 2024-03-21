import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class FileComplaintButton extends BaseWidget {
  const FileComplaintButton({
    super.key,
    this.onPressed,
    this.text,
  });

  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height * .1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.standardColor,
            elevation: 1,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(36),
            ),
            textStyle: const TextStyle(fontSize: 20)),
        onPressed: onPressed,
        child: Text(
          text ?? Constants.BLANK,
        ),
      ),
    );
  }
}
