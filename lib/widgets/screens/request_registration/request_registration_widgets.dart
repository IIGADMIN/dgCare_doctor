import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/utils/styles/text_field_decorations.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/colors/colors.dart';
import '../profile_selection/profile_selection_screen.dart';
import 'request_registration_screen.dart';

class RequestRegistrationWidgets {
  Widget titleView(String title) {
    return Text(
      title,
      style: boldTextStyle(color: textColor, size: 20),
    );
  }

  Widget subTitleView(String subTitle) {
    return Text(
      subTitle,
      style: const TextStyle(fontSize: 12),
    );
  }

  Widget contactUsTextFieldView(
      String labelText, TextEditingController controller,
      {int maxLength = 100,
      String? Function(String?)? validator,
      TextInputType keyBoardType = TextInputType.text,
      bool isEnabled = true,
      void Function(String)? onChanged}) {
    return TextFormField(
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      cursorColor: textColor,
      controller: controller,
      keyboardType: keyBoardType,
      enabled: isEnabled,
      decoration: InputDecoration(
          labelText: labelText,
          counterText: "",
          labelStyle: TextStyle(color: textColor),
          border: TextFieldBorders.textFieldBorder(),
          focusedBorder: TextFieldBorders.textFieldFocusBorder(),
          errorBorder: TextFieldBorders.textFieldErrorBorder(),
          disabledBorder: TextFieldBorders.textFieldBorder(),
          enabledBorder: TextFieldBorders.textFieldEnableBorder(),
          focusedErrorBorder: TextFieldBorders.textFieldErrorBorder()),
    );
  }
  
   Widget contactUsPhoneFieldView(
      String labelText, TextEditingController controller,
      {int maxLength = 10,
      String? Function(String?)? validator,
      TextInputType keyBoardType = TextInputType.number,
      bool isEnabled = true,
      void Function(String)? onChanged}) {
    return TextFormField(
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      cursorColor: textColor,
      controller: controller,
      keyboardType: keyBoardType,
      enabled: isEnabled,
      decoration: InputDecoration(
          
          labelText: labelText,
          counterText: "",
          labelStyle: TextStyle(color: textColor),
          border: TextFieldBorders.textFieldBorder(),
          focusedBorder: TextFieldBorders.textFieldFocusBorder(),
          errorBorder: TextFieldBorders.textFieldErrorBorder(),
          disabledBorder: TextFieldBorders.textFieldBorder(),
          enabledBorder: TextFieldBorders.textFieldEnableBorder(),
          focusedErrorBorder: TextFieldBorders.textFieldErrorBorder()),
    );
  }

  Widget submitButtonView(
      {required void Function()? onPressed, double? width}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, fixedSize: Size(width ?? 300, 45)),
      child: const Text(
        "Submit",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  _willPop(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSelectionScreen()),
        (route) => false);
  }

  Widget thankYouView(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: WillPopScope(
        onWillPop: () {
          return _willPop(context);
        },
        child: LiquidLinearProgressIndicator(
          value: 0.30,
          // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(
            mainColor,
          ),
          // Defaults to the current Theme's accentColor.
          backgroundColor: Colors.white,
          // Defaults to the current Theme's backgroundColor.
          borderColor: mainColor,
          borderWidth: 0.0,
          direction: Axis.vertical,
          // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          center: Text(
            "Thank You",
            style: boldTextStyle(color: mainColor, size: 30),
          ),
        ),
      ),
    );
  }

  showContactAndLoginBottomSheet(BuildContext context,
      {String? title, required Widget loginFor}) {
    var height = screenHeight(context);
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SizedBox(
            height: height / 3.2,
            child: Column(
              children: [
                20.height,
                Text(
                  "Where to go!",
                  style: boldTextStyle(size: 20),
                ),
                 const Divider(color: Colors.white,),
                ListTile(
                  onTap: () {
                    finish(context);
                    RequestRegistrationScreen(contactFor: title ?? "").launch(context);
                  },
                  leading: const CircleAvatar(
                    child: Icon(Icons.contact_support_outlined),
                  ),
                  title: const Text("Contact Us"),
                  subtitle: const Text("Send a request for your new registration."),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                 const Divider(),
                ListTile(
                  onTap: () {
                    finish(context);
                    loginFor.launch(context);
                  },
                  leading: const CircleAvatar(
                    child: Icon(Icons.login),
                  ),
                  title: const Text("Login"),
                  subtitle: const Text("You can login if you are registered here."),
                    trailing:const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          );
        });
  }
}
