import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/shapes/app_shapes.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashWidgets{
  BuildContext context;
  SplashWidgets({required this.context});

  Widget splashImageView(){
    return Image.asset(
      fit: BoxFit.contain,
      "assets/gif/logo_gif.gif",
      width: screenWidth(context)*4.5,
      height: screenHeight(context)*4.5,
    );
  }

  splashTitleView(){
    return const Text(
      "2050DgCarePro",
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }

  splashSubTitleView(){
    return const Text("WITH YOU IN EVERY STEP OF HEALING",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800));
  }

  Widget splashColumnView(){
    return Column(
      children: [
        splashImageView(),
        splashSubTitleView(),
        splashSubTitleView()
      ],
    );
  }
}