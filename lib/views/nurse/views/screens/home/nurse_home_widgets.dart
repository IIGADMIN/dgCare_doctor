import 'package:healthcaredoctor2050/utils/colors/colors.dart';
import 'package:healthcaredoctor2050/utils/shapes/app_shapes.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/profile/nurse_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../helper/base_urls.dart';
import '../../../../../utils/styles/image_style.dart';

class NurseHomeWidgets {
  BuildContext context;

  NurseHomeWidgets({required this.context});

  Widget nurseHomeAppBarView({required void Function() onRefresh}) {
    return AppBar(
      backgroundColor: mainColor,
      title: const Text(
        "Welcome to 2050DgCarePro",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        IconButton(
          tooltip: "Refresh",
          onPressed: () async {
            Fluttertoast.showToast(msg: "Refreshing... Please wait..");
            onRefresh();
          },
          icon: const Icon(Icons.refresh, color: Colors.white),
        )
      ],
    );
  }

  Widget nurseDetailsHomeView() {
    var height = screenHeight(context);
    var width = screenWidth(context);
    return Consumer<NurseDetailsProvider>(builder: (c, data, w) {
      return InkWell(
        onTap: (){
          const NurseProfileScreen().launch(context);
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              showNetworkImageWithCached(
                  imageUrl: nurseImageUrl + data.getUserProfilePic,
                  height: height / 8,
                  width: width / 3.5,
                  radius: 5),
              10.width,
              SizedBox(
                width: width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: mainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    5.height,
                    Text(
                      "${data.getUserFirstName} ${data.getUserLastName}",
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    ),
                    Text(
                      data.getUserDesignation,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ).paddingAll(10),
        ),
      );
    });
  }

  Widget headerConsultationView({required String title}) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blue.shade200,
      color: mainColor,
      shape: BeveledRectangleBorder(
          side: BorderSide(color: Colors.green.shade500, width: 1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(60, 20),
            topRight: Radius.elliptical(60, 20),
          )),
      child: SizedBox(
        width: screenWidth(context),
        height: 40,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget todayAppointmentCounterItemView(
      {required String title,
      required String imagePath,
      required String counter,
      required IconData icon,
      required Color bgColor,
        required Widget navigateTo
      }) {
    return InkWell(
      onTap: (){
        navigateTo.launch(context);
      },
      child: Card(
        color: bgColor,
        shape: circularBorderShape(
            borderRadius: 10, borderColor: mainColor, borderSize: 5),
        elevation: 4,
        child: Column(
          children: [
            5.height,
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12),
            ),
            const Divider(
              thickness: 4,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth(context) / 3,
                  height: screenHeight(context) / 5,
                  child: Image.asset(imagePath),
                ),
                Column(
                  children: [
                    Icon(
                      icon,
                      color: mainColor,
                      size: 30,
                    ),
                    Text(
                      counter,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(
                          color: mainColor,
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ],
                )
              ],
            )
          ],
        ).paddingAll(10),
      ),
    );
  }
}
