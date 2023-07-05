import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/home/nurse_home_widgets.dart';
import '../../../../../utils/constants/constant_data.dart';
import '../../../controllers/providers/counter/nurse_consultation_counter_provider.dart';
import '../drawer_navigation/navigation_drawer_widget.dart';

class NurseHomeScreen extends StatefulWidget {
  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  Timer? _timer;

  bool connected = false;
  String userType = "";
  String serviceProviderName = "";
  bool isServiceProvider = false;

  @override
  void initState() {
    super.initState();
    Provider.of<NurseDetailsProvider>(context, listen: false).getUserDetails();
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
        Provider.of<NurseConsultationCountProvider>(context, listen: false);
    provider.getAppointmentCounter();
  }

  @override
  Widget build(BuildContext context) {
    var view = NurseHomeWidgets(context: context);
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: PreferredSize(
          preferredSize: Size(screenWidth(context), 55),
          child: view.nurseHomeAppBarView(onRefresh: () {
            getUserType();
          })),
      body: ListView(
        children: [
          view.nurseDetailsHomeView(),
          20.height,
          view.headerConsultationView(title: "Today's Appointments"),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              view.todayAppointmentCounterItemView(
                  title: "Video Consultation",
                  imagePath: videoImagePath,
                  counter: "90",
                  icon: Icons.video_call_outlined,
                bgColor: Colors.white,
                navigateTo: Container()
              ),
              view.todayAppointmentCounterItemView(
                  title: "Audio Consultation",
                  imagePath: audioImagePath,
                  counter: "90",
                  icon: Icons.phone,
                  bgColor: Colors.grey,
                navigateTo: Container()
              )
            ],
          ),

          20.height,
          view.headerConsultationView(title: "Upcoming Appointments"),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              view.todayAppointmentCounterItemView(
                  title: "Video Consultation",
                  imagePath: videoImagePath,
                  counter: "9",
                  icon: Icons.video_call_outlined,
                  bgColor: Colors.white,
                  navigateTo: Container()
              ),
              view.todayAppointmentCounterItemView(
                  title: "Audio Consultation",
                  imagePath: audioImagePath,
                  counter: "90",
                  icon: Icons.phone,
                  bgColor: Colors.grey,
                  navigateTo: Container()
              )
            ],
          )
        ],
      ),
    );
  }
}
