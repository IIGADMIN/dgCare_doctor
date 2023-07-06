import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/profile/nurse_profile_widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../controllers/data/nurse_api_urls.dart';

class NurseProfileScreen extends StatefulWidget {
  const NurseProfileScreen({super.key});

  @override
  State<NurseProfileScreen> createState() => _NurseProfileScreenState();
}

class _NurseProfileScreenState extends State<NurseProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = screenHeight(context);
    var width = screenWidth(context);
    var view = NurseProfileWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Profile"),
      ),
      body: Consumer<NurseDetailsProvider>(builder: (BuildContext context, data, Widget? child) {
        return Container(
          color: Colors.transparent,
          height: height,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: height / 1.35,
                  width: width,
                  decoration: BoxDecoration(
                      color: secondaryBgColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: view.nurseDetailsView(),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Consumer<NurseDetailsProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Center(
                      child: view.profileImageView(nurseImageUrl + data.getUserProfilePic),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
