import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/colors/colors.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/home/nurse_home_screen.dart';
import 'package:healthcaredoctor2050/widgets/screens/splash/splash_widgets.dart';
import '../../../helpers/internet_helper.dart';
import '../../../helpers/notification_helper.dart';
import '../../../utils/data/local_data_keys.dart';
import '../../../utils/data/shared_preference.dart';
import '../profile_selection/profile_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      _checkUserLoginStatus();
    });
  }

  @override
  void initState() {
    super.initState();
    onMessageNotification();
    onOpenAppNotification(context);
    startTimer();
    InternetHelper(context: context)
        .checkConnectivityRealTime(callBack: (a) {});
  }

  @override
  Widget build(BuildContext context) {
    var view = SplashWidgets(context: context);
    return Scaffold(
        backgroundColor: splashScreenColor,
        body: SizedBox(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              view.splashImageView(),
              40.height,
              view.splashTitleView(),
              20.height,
              view.splashSubTitleView(),
            ],
          ),
        ));
  }

_checkUserLoginStatus() async {
  if (await getBoolFromLocal(loggedInKey) == true) {
    if(!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const NurseHomeScreen()),
            (route) => false);
  } else {
    if(!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSelectionScreen()),
            (route) => false);
  }
}
}
