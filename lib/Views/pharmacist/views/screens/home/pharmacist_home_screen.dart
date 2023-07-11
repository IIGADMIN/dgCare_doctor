import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/controllers/providers/pharmacist_details_provider.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/today/pharmacist_today_video_consultation_screen.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/upcoming/pharmacist_upcoming_audio_consultation_screen.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/home/pharmacy_home_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/constants/constant_data.dart';
import '../../../../../utils/sizes/app_sizes.dart';
import '../../../controllers/providers/pharmacist_consultation_count_provider.dart';
import '../consultations/today/pharmacist_today_audio_consultation_screen.dart';
import '../consultations/upcoming/pharmacist_upcoming_video_consultation_screen.dart';
import '../drawer/pharmacist_drawer_widgets.dart';

class PharmacistHomeScreen extends StatefulWidget {
  const PharmacistHomeScreen({super.key});

  @override
  State<PharmacistHomeScreen> createState() => _PharmacistHomeScreenState();
}

class _PharmacistHomeScreenState extends State<PharmacistHomeScreen> {

  Timer? _timer;

  bool connected = false;
  String userType = "";
  String serviceProviderName = "";
  bool isServiceProvider = false;

  @override
  void initState() {
    super.initState();
    Provider.of<PharmacistDetailsProvider>(context, listen: false).getUserDetails();
    getUserType();
    _timer = Timer.periodic(const Duration(seconds: 2000), (timer) {
      getUserType();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> getUserType() async {
    var provider =
    Provider.of<PharmacistConsultationCountProvider>(context, listen: false);
    provider.getAppointmentCounter();
  }

  @override
  Widget build(BuildContext context) {
    var view = PharmacistHomeWidgets(context: context);
    return Scaffold(
      drawer: const PharmacistDrawerWidgets(),
      appBar: PreferredSize(
          preferredSize: Size(screenWidth(context), 55),
          child: view.nurseHomeAppBarView(onRefresh: () {
            getUserType();
          })),
      body: Consumer<PharmacistConsultationCountProvider>(builder: (c,data,v){
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            view.nurseDetailsHomeView(),
            10.height,
            view.headerConsultationView(title: "Today's Appointments"),
            5.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                view.todayAppointmentCounterItemView(
                    title: "Video Consultation",
                    imagePath: videoImagePath,
                    counter: data.getCounterData.todayVideoConsultCount.toString(),
                    icon: Icons.video_call_outlined,
                    bgColor: Colors.white,
                    navigateTo: const PharmacistTodayVideoConsultationScreen()
                ),
                10.width,
                view.todayAppointmentCounterItemView(
                    title: "Audio Consultation",
                    imagePath: audioImagePath,
                    counter: data.getCounterData.todayTeleConsultCount.toString(),
                    icon: Icons.phone,
                    bgColor: Colors.grey,
                    navigateTo: const PharmacistTodayAudioConsultationScreen()
                )
              ],
            ),
            10.height,
            view.headerConsultationView(title: "Upcoming Appointments"),
            5.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                view.todayAppointmentCounterItemView(
                    title: "Video Consultation",
                    imagePath: videoImagePath,
                    counter: data.getCounterData.upcomingVideoConsultCount.toString(),
                    icon: Icons.video_call_outlined,
                    bgColor: Colors.white,
                    navigateTo: const PharmacistUpcomingVideoConsultationScreen()
                ),
                10.width,
                view.todayAppointmentCounterItemView(
                    title: "Audio Consultation",
                    imagePath: audioImagePath,
                    counter: data.getCounterData.upcomingOfflineConsultCount.toString(),
                    icon: Icons.phone,
                    bgColor: Colors.grey,
                    navigateTo: const PharmacistUpcomingAudioConsultationScreen()
                )
              ],
            )
          ],
        );
      },),
    );
  }

}
