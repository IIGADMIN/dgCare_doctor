import 'package:flutter/cupertino.dart';
import 'package:healthcaredoctor2050/utils/colors/colors.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
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

  Widget nurseDetailsHomeView(BuildContext context) {
    var height = screenHeight(context);
    var width = screenWidth(context);
    return Consumer<NurseDetailsProvider>(builder: (c, data, w) {
      return Card(
        elevation: 5,
        child: Row(
          children: [
            showNetworkImageWithCached(
                imageUrl: data.getUserProfilePic,
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
      );
    });
  }
}
