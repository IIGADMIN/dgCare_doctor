import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/firebase/firebase_options.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/appointment/nurse_history_consultation_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/appointment/nurse_today_appointment_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/appointment/nurse_upcoming_consultation_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_auth_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:healthcaredoctor2050/widgets/100ms/providers/meeting_mode_provider.dart';
import 'package:healthcaredoctor2050/widgets/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'helpers/notification_helper.dart';
import 'views/pharmacist/controllers/providers/pharmacist_auth_provider.dart';
import 'views/pharmacist/controllers/providers/pharmacist_consultation_count_provider.dart';
import 'views/pharmacist/controllers/providers/pharmacist_details_provider.dart';
import 'views/pharmacist/controllers/providers/pharmacist_history_consultation_provider.dart';
import 'views/pharmacist/controllers/providers/pharmacist_today_appointment_provider.dart';
import 'views/pharmacist/controllers/providers/pharmacist_upcoming_consultation_provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(handleFirebaseBackGroundNotification);
  createNotificationChannel();
  handleForegroundNotification();
  // var token = await NotificationViewState().getTokenz();

  FirebaseAnalytics.instance;
  runApp(
    MultiProvider(
      providers: [
        /// nurse's provider
        ChangeNotifierProvider<NurseDetailsProvider>.value(
            value: NurseDetailsProvider()),
        ChangeNotifierProvider<NurseAuthProvider>.value(
            value: NurseAuthProvider()),
        ChangeNotifierProvider<NurseTodayAppointmentProvider>.value(
            value: NurseTodayAppointmentProvider()),
        ChangeNotifierProvider<MeetingModeProvider>.value(
            value: MeetingModeProvider()),
        ChangeNotifierProvider<NurseUpcomingConsultationProvider>.value(
            value: NurseUpcomingConsultationProvider()),
        ChangeNotifierProvider<NurseHistoryConsultationProvider>.value(
            value: NurseHistoryConsultationProvider()),

        /// pharmacist's provider
        ChangeNotifierProvider<PharmacistDetailsProvider>.value(
            value: PharmacistDetailsProvider()),
        ChangeNotifierProvider<PharmacistAuthProvider>.value(
            value: PharmacistAuthProvider()),
        ChangeNotifierProvider<PharmacistConsultationCountProvider>.value(
            value: PharmacistConsultationCountProvider()),
        ChangeNotifierProvider<PharmacistTodayAppointmentProvider>.value(
            value: PharmacistTodayAppointmentProvider()),
        ChangeNotifierProvider<PharmacistUpcomingConsultationProvider>.value(
            value: PharmacistUpcomingConsultationProvider()),
        ChangeNotifierProvider<PharmacistHistoryConsultationProvider>.value(
            value: PharmacistHistoryConsultationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "2050DgCarePro",
      theme: ThemeData(
      ),
      home: const SplashScreen(),
    );
  }
}

