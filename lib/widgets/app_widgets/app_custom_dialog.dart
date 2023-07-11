import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';

class AppCustomDialog extends StatelessWidget {
  final String title;
  final String? contentTitle;
  final String negativeText, positiveText;
  final void Function() onNegative, onPositive;

  const AppCustomDialog({
    Key? key,
    required this.title,
    required this.onNegative,
    required this.onPositive,
    required this.negativeText,
    required this.positiveText,
    this.contentTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildNegativeElevatedButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: onNegative,
        child: Text(negativeText,
            style: AppTextStyles.boldTextStyle(txtColor: Colors.white)),
      );
    }

    Widget buildPositiveElevatedButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: onPositive,
        child: Text(positiveText,
            style: AppTextStyles.boldTextStyle(txtColor: Colors.white)),
      );
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: AppTextStyles.boldTextStyle(),
      ),
      actions: [buildNegativeElevatedButton(), buildPositiveElevatedButton()],
    );
  }
}
