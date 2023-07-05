import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/home/nurse_home_widgets.dart';

class NurseHomeScreen extends StatefulWidget {
  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {

  @override
  Widget build(BuildContext context) {
    var view = NurseHomeWidgets(context: context);
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(screenWidth(context), 55), child: view.nurseHomeAppBarView(onRefresh: (){})),
      body: ListView(
        children: [
          view.nurseDetailsHomeView(context,)
        ],
      ),
    );
  }
}
