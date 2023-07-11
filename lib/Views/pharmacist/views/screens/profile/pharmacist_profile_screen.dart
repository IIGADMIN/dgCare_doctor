import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/controllers/data/pharmacist_api_urls.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/profile/pharmacist_profile_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/sizes/app_sizes.dart';
import '../../../controllers/providers/pharmacist_details_provider.dart';

class PharmacistProfileScreen extends StatefulWidget {
  const PharmacistProfileScreen({super.key});

  @override
  State<PharmacistProfileScreen> createState() => _PharmacistProfileScreenState();
}

class _PharmacistProfileScreenState extends State<PharmacistProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = screenHeight(context);
    var width = screenWidth(context);
    var view = PharmacistProfileWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Profile"),
      ),
      body: Consumer<PharmacistDetailsProvider>(builder: (BuildContext context, data, Widget? child) {
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
                child: Consumer<PharmacistDetailsProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Center(
                      child: view.profileImageView(pharmacistImageUrl + data.getUserProfilePic),
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
