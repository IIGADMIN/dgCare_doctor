import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/shapes/app_shapes.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashWidgets{
  BuildContext context;
  SplashWidgets({required this.context});

  Widget splashImageView(){
    return Card(
      elevation: 4,
      shape: circularBorderShape(borderRadius:70,),
      child: SizedBox(
        child: Image.asset(
          "assets/gif/logo_gif.gif",
          width: 100,
          height: 100,
        ).paddingAll(20),
      ),
    );
  }

  Text splashTitleView(){
    return const Text(
      "2050DgCarePro",
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }

  Text splashSubTitleView(){
    return const Text("WITH YOU IN EVERY STEP OF HEALING",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800));
  }
}