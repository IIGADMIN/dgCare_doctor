import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/widgets/screens/profile_selection/profile_selection_widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/constants/constant_data.dart';
import '../../../views/nurse/views/screens/login/nurse_phone_auth_screen.dart';
import '../request_registration/request_registration_widgets.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    var pharmacyImage = "assets/illustration/pharmacy_illustration.png";
    var nurseImage = "assets/illustration/nurse_illustration.png";
    var doctorImage = "assets/illustration/doctor_illustration1.png";

    var height = screenHeight(context);
    var width = screenWidth(context);

    var contactUsView = RequestRegistrationWidgets();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height / 16,
            ),
            profileSelectionTitle("Profile Selection"),
            profileSelectionSubTitle(
              "Please select a prefer profile type to login here.",
            ),
            SizedBox(
              height: height / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                profileSelectionItemView(context,
                    title: "Pharmacist",
                    height: height / 4.5,
                    width: width / 2 - width / 20, onTap: () {
                  contactUsView.showContactAndLoginBottomSheet(context,
                      title: "Pharmacist", loginFor: Container());
                }, imagePath: pharmacyImage),
                profileSelectionItemView(context,
                    title: "Nurse",
                    height: height / 4.5,
                    width: width / 2 - width / 20, onTap: () {
                  contactUsView.showContactAndLoginBottomSheet(
                    context,
                    title: "Nurse",
                    loginFor: NursePhoneAuthScreen(
                        profileType: nurseCode,
                        imagePath: nurseImage,
                        title: "Nurse"),
                  );
                }, imagePath: nurseImage)
              ],
            ).paddingSymmetric(horizontal: 5),
            SizedBox(
              height: height / 16,
            ),
            profileSelectionItemView(context,
                title: "Doctor",
                height: height / 3,
                width: width - width / 16, onTap: () {
              contactUsView.showContactAndLoginBottomSheet(context,
                  title: "Doctor", loginFor: Container());
            }, imagePath: doctorImage)
          ],
        ),
      ),
    );
  }
}
