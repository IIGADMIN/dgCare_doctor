import 'package:flutter/material.dart';

import '../../app_widgets/no_internent_screen.dart';

noInternetScreen(BuildContext context){
  return
    Scaffold(
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