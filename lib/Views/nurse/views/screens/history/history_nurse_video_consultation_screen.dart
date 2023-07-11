import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import '../../../../../Utils/colors/colors.dart';
import 'history_nurse_consultation_item.dart';

class HistoryNurseVideoConsultationScreen extends StatefulWidget {
  const HistoryNurseVideoConsultationScreen({
    super.key,
  });

  @override
  State<HistoryNurseVideoConsultationScreen> createState() =>
      _HistoryNurseVideoConsultationScreenState();
}

class _HistoryNurseVideoConsultationScreenState
    extends State<HistoryNurseVideoConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Appointment History"),
          bottom: PreferredSize(
              preferredSize:
                  Size(screenWidth(context), screenHeight(context) / 20),
              child: TabBar(
                indicatorColor: Colors.amber,
                tabs: [
                  Tab(
                    child: _tabItem("Video", Icons.video_call),
                  ),
                  Tab(
                    child: _tabItem("Audio", Icons.phone),
                  )
                ],
              )),
        ),
        body: const TabBarView(children: [
          HistoryNurseConsultationItem(
            appointmentType: "video",
          ),
          HistoryNurseConsultationItem(
            appointmentType: "audio",
          )
        ]),
      ),
    );
  }

  _tabItem(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        5.width,
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          // style: AppTextStyles.boldTextStyle(txtColor: Colors.white),
        ),
      ],
    );
  }
}
