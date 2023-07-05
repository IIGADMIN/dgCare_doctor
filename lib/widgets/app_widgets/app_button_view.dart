import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/colors/colors.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';
import 'package:nb_utils/nb_utils.dart';
class AppButtonView extends StatelessWidget {
  BuildContext context;
  final String buttonText;
  final void Function() onPressed;

  AppButtonView({super.key, required this.buttonText, required this.onPressed, required this.context});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
      child: Text(
        buttonText,
        style: AppTextStyles.boldTextStyle(txtColor: Colors.white),
      ).paddingAll(13),
    );
  }
}
