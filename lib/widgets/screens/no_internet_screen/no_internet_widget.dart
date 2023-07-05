
import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:nb_utils/nb_utils.dart';

bool connected = false;

Image notConnectionImageView(BuildContext context){
  return Image.asset("assets/images/no_internet_img.png",height: screenHeight(context)*2,width: screenWidth(context)*2,fit: BoxFit.cover,);
}

Widget internetMessage(){
  return const Text("Currently you are not connected to internet. Please check internet connection and try again.",textAlign: TextAlign.center,).paddingSymmetric(horizontal: 16);
}

Text topTitleNoInternet(){
  return const Text("Internet Not Available",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),);
}

Widget tryAgainButton(BuildContext context){
  var radius = BorderRadius.circular(20);
  return Container(
    height: screenHeight(context)*5,
    margin: const EdgeInsets.symmetric(horizontal: 16,),

    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius:radius),
      child: Center(child: const Text("Try Again").paddingSymmetric(horizontal: 10)),
    ),
  );
}
