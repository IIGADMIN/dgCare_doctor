
import 'package:flutter/material.dart';
import '../colors/colors.dart';

class TextFieldBorders{
  static OutlineInputBorder textFieldBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 2.0, color: Colors.grey));
  }

  static OutlineInputBorder textFieldEnableBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: secondaryBgColor, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldFocusBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: secondaryBgColor, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldErrorBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldDisableBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
      borderSide: BorderSide(width: 2.0, color: Colors.grey),
    );
  }
}