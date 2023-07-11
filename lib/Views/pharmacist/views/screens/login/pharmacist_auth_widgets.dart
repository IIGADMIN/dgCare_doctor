import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../../../utils/colors/colors.dart';
import '../../../../../widgets/screens/request_registration/request_registration_screen.dart';

class PharmacistAuthWidgets {
  BuildContext context;

  PharmacistAuthWidgets({required this.context});

  showWrongNumberDialog(String number,String userType) {
    return showDialog(
        context: context,
        builder: (context) {
          var style = ElevatedButton.styleFrom(backgroundColor: buttonColor);
          return AlertDialog(
            title: const Text("Authentication Failed!"),
            content: Text("$number is not register to us. Please check number or contact us for new registration."),
            actions: [
              ElevatedButton(
                  style: style,
                  onPressed: (){
                    finish(context);
                    RequestRegistrationScreen(contactFor: userType,).launch(context);
                  }, child: const Text("Contact Us")),
              ElevatedButton(
                  style: style,
                  onPressed: (){
                    finish(context);
                  }, child: const Text("Change")),
            ],
          );
        });
  }

  Widget termAndConditions() {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Please accept our ',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextSpan(
                text: 'Terms And Conditions',
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        'https://2050healthcare.com/terms-and-conditions'));
                  },
              ),
              const TextSpan(
                text: ' before Login.',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

}