import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/colors/colors.dart';
import 'package:healthcaredoctor2050/widgets/screens/splash/splash_widgets.dart';
import '../../../helpers/internet_helper.dart';
import '../../../helpers/notification_helper.dart';
import '../../../utils/data/local_data_keys.dart';
import '../../../utils/data/shared_preference.dart';
import '../../../utils/sizes/app_sizes.dart';
import '../profile_selection/profile_selection_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(const Duration(seconds: 6), () {
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
        backgroundColor: Colors.white,
        body:

        SizedBox(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: view.splashImageView(),
                width: screenWidth(context)*0.25,
                height: screenHeight(context)*0.25,
              ),
               SizedBox(
                 width: screenWidth(context)*0.9,
                 height: screenHeight(context)*0.1,
                 child: Center(
                   child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        "2050DgCarePro",
                        textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: mainColor),
                      ),
                      ScaleAnimatedText(
                        'WITH YOU IN EVERY STEP OF HEALING',
                        textStyle: TextStyle(fontSize: 10.0, fontFamily: 'Canterbury',fontWeight: FontWeight.bold,color: mainColor),
                      ),
                    ],
                   ),
                 ),
               ),
            ],
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     view.splashImageView(),
          //     40.height,
          //     view.splashTitleView(),
          //     20.height,
          //     view.splashSubTitleView(),
          //   ],
          // ),
        )
    );
  }

_checkUserLoginStatus() async {
  if (await getBoolFromLocal(loggedInKey) == true) {
    if(!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSelectionScreen()),
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
