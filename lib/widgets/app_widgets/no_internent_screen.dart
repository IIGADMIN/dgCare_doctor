import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:nb_utils/nb_utils.dart';
noInternetScreen(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        notConnectionImageView(context),
        internetMessage(),
        topTitleNoInternet()
      ],
    ),
  );
}

Image notConnectionImageView(BuildContext context) {
  var height = screenHeight(context);
  var width = screenWidth(context);

  return Image.asset(
    "assets/images/no_internet_img.png",
    height: height/3,
    width: width-20.0,
    fit: BoxFit.cover,
  );
}

Widget internetMessage() {
  return const Text(
    "Currently you are not connected to internet. Please check internet connection and try again.",
    textAlign: TextAlign.center,
  ).paddingSymmetric(horizontal: 16);
}

Text topTitleNoInternet() {
  return const Text(
    "Internet Not Available",
    style:
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
  );
}
