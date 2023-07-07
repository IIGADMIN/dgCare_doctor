import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/firebase/firebase_options.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/appointment/nurse_today_appointment_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_auth_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:healthcaredoctor2050/widgets/100ms/providers/meeting_mode_provider.dart';
import 'package:healthcaredoctor2050/widgets/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'helpers/notification_helper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(handleFirebaseBackGroundNotification);
  createNotificationChannel();
  handleForegroundNotification();
  // var token = await NotificationViewState().getTokenz();

  FirebaseAnalytics.instance;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NurseDetailsProvider>.value(
        value: NurseDetailsProvider()),
    ChangeNotifierProvider<NurseAuthProvider>.value(
        value: NurseAuthProvider()),
    ChangeNotifierProvider<NurseAuthProvider>.value(
        value: NurseAuthProvider()),
    ChangeNotifierProvider<NurseTodayAppointmentProvider>.value(
        value: NurseTodayAppointmentProvider()),
    ChangeNotifierProvider<MeetingModeProvider>.value(
        value: MeetingModeProvider())
  ],child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

