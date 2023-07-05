import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:healthcaredoctor2050/utils/firebase/firebase_options.dart';
import 'package:healthcaredoctor2050/helpers/notification_helper.dart';
import 'package:healthcaredoctor2050/views/doctor/controllers/providers/login/doctor_auth_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_auth_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/screens/splash/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(handleFirebaseBackGroundNotification);
  createNotificationChannel();
  handleForegroundNotification();
  // var token = await NotificationViewState().getTokenz();

  FirebaseAnalytics.instance;

  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider<UserDetailsProvider>.value(
    //     value: UserDetailsProvider()),

    // ChangeNotifierProvider<NurseUpcomingConsultationProvider>.value(
    //     value: NurseUpcomingConsultationProvider()),
    //
    // ChangeNotifierProvider<NurseUpcomingConsultationProvider>.value(
    //     value: NurseUpcomingConsultationProvider()),
    // ChangeNotifierProvider<PharmacistUpcomingConsultationProvider>.value(
    //     value: PharmacistUpcomingConsultationProvider()),
    // ChangeNotifierProvider<TodayDoctorAppointmentsProvider>.value(
    //     value: TodayDoctorAppointmentsProvider()),
    ChangeNotifierProvider<DoctorAuthProvider>.value(value: DoctorAuthProvider()),
    ChangeNotifierProvider<NurseAuthProvider>.value(value: NurseAuthProvider()),
    // ChangeNotifierProvider<DoctorUpcomingConsultationProvider>.value(
    //     value: DoctorUpcomingConsultationProvider()),
    // ChangeNotifierProvider<TodayDoctorAppointmentsProvider>.value(
    //     value: TodayDoctorAppointmentsProvider()),
    // ChangeNotifierProvider<NurseTodayAppointmentProvider>.value(
    //     value: NurseTodayAppointmentProvider()),
    // ChangeNotifierProvider<AvailableProvidersProvider>.value(
    //     value: AvailableProvidersProvider()),
    // ChangeNotifierProvider<AssignedProvidersProvider>.value(
    //     value: AssignedProvidersProvider()),
    // ChangeNotifierProvider<DoctorHistoryProvider>.value(
    //     value: DoctorHistoryProvider()),
    // ChangeNotifierProvider<ServiceProviderHistoryProvider>.value(
    //     value: ServiceProviderHistoryProvider()),
    // ChangeNotifierProvider<PharmacistTodayAppointmentProvider>.value(
    //     value: PharmacistTodayAppointmentProvider()),
    //
    // ChangeNotifierProvider<ConsultationCountProvider>.value(
    //     value: ConsultationCountProvider()),

    // ChangeNotifierProvider<MeetingModeProvider>.value(value: MeetingModeProvider()),
    // /// meeting store
    // ChangeNotifierProvider<MeetingStore>.value(value: MeetingStore(hmsSDKInteractor: HMSSDKInteractor()))

  ], child: const MyApp()));
}

/// Default scroll configuration for the app with touch, mouse and stylus
/// support.
class AppScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    


   // var _meetingStore = context.read<MeetingStore>();
    return

          GetMaterialApp(
            defaultTransition: Transition.zoom,
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            title: '2050iCarePro',
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: const SplashScreen()
            // home: MeetingScreen(meetingFlow: MeetingFlow.meeting),
            // home: ChangeNotifierProvider.value(
            //     value: _meetingStore,
            //     child: MeetingScreen(meetingFlow: MeetingFlow.meeting))
            // home: const MeetingScreen(meetingFlow: MeetingFlow.meeting),

          );
        }



}



