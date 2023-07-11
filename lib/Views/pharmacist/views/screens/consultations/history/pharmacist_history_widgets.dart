import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../helpers/date_and_time_converter.dart';
import '../../../../../../utils/colors/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class PharmacistHistoryWidgets{
  BuildContext context;
  PharmacistHistoryWidgets({required this.context});

  Widget patientAgeAndGenderView(String age, String gender) {
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
                    color: mainColor, fontWeight: FontWeight.w800, fontSize: 10))
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
                    color: mainColor, fontWeight: FontWeight.w800, fontSize: 10))
          ],
        ),
      ],
    );
  }

  Widget patentMobileNumberView(String number) {
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

  Widget appointmentDateView(DateTime date) {
    var format = DateFormat('dd MMM yyyy');
    var _date = format.format(date);
    return Row(
      children: [
        const Text("Appointment Date : ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 12)),
        Text(_date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w800, fontSize: 14))
      ],
    );
  }

  Widget appointmentTitleTimingView() {
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
                  fontSize: 12, color: Colors.green, fontWeight: FontWeight.w400),
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
          convertTimeTo12Hours(time: startTime,format: timeFormat12Hours),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Text(
          convertTimeTo12Hours(time: endTime,format: timeFormat12Hours),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    ).paddingSymmetric(horizontal: 5,vertical: 2);
  }

  Widget appointmentListHeaderView(String department, {double radius = 2}) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: Colors.grey),
        child: Center(
          child: Text(department,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ));
  }

}