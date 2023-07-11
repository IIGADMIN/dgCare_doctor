import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/history/pharmacist_history_item.dart';
import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/sizes/app_sizes.dart';

class PharmacistHistoryScreen extends StatefulWidget {
  const PharmacistHistoryScreen({super.key});

  @override
  State<PharmacistHistoryScreen> createState() =>
      _PharmacistHistoryScreenState();
}

class _PharmacistHistoryScreenState extends State<PharmacistHistoryScreen> {
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
            PharmacistHistoryItem(
              appointmentType: "video",
            ),
            PharmacistHistoryItem(
              appointmentType: "audio",
            )
          ]),
        ));
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
        ),
      ],
    );
  }
}
