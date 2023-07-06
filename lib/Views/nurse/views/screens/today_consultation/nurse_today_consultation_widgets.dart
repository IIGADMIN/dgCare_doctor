import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:healthcaredoctor2050/Utils/sizes/app_sizes.dart';

import '../../../../../utils/colors/colors.dart';

class NurseTodayConsultationWidgets {
  BuildContext context;

  NurseTodayConsultationWidgets({required this.context});

  Widget headerView(String title) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: Colors.grey),
        child: Center(
          child: Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ));
  }

  Widget ageAndGenderView(String age, String gender) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Age: ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12)),
            Text(age,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 10))
          ],
        ),
        10.width,
        Row(
          children: [
            const Text("Gender: ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12)),
            Text(gender,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 10))
          ],
        ),
      ],
    );
  }

  Widget mobileNumberView(String number) {
    return Row(
      children: [
        const Text("Mobile Number : ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 12)),
        Text("+91 " + number,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w800, fontSize: 10))
      ],
    );
  }

  Widget titleTimingView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.lock_clock,
              color: Colors.green,
              size: 15,
            ),
            Text(
              "Start Time",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: const [
            Text(
              "End Time",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12, color: Colors.red, fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.lock_clock,
              color: Colors.red,
              size: 15,
            ),
          ],
        )
      ],
    );
  }

  Widget appointmentTimingValueView(String startTime, String endTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startTime,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Text(
          endTime,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    ).paddingSymmetric(horizontal: 5, vertical: 2);
  }

  Widget joinButtonView(String title,
      {Color color = Colors.white,
      Color textColor = Colors.white,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(6))
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: textColor,fontSize: 14),
            ).paddingSymmetric(horizontal: 20,vertical: 5),
          ),
        ),
      ),
    );
  }
}
