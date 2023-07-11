import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../models/pharmacist_upcoming_consultation_model.dart';
import '../today/pharmacist_today_consultation_widgets.dart';

class PharmacistUpcomingConsultationWidgets{
  BuildContext context;
  PharmacistUpcomingConsultationWidgets({required this.context});

  Widget pharmacistItemView(UpcomingConsultationPharmacistListData data) {
    var view = PharmacistTodayConsultationWidgets(context: context);
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          view.headerView(
              "${data.bookSchedule?.patientFirstName ?? "NA"} ${data.bookSchedule?.patientLastName ?? "NA"}"),
          5.height,
          view
              .ageAndGenderView(
              data.bookSchedule?.patientAge.toString() ?? "NA",
              data.bookSchedule?.gender?.genderName ?? "NA")
              .paddingSymmetric(horizontal: 5, vertical: 2),
          view
              .mobileNumberView(
              data.bookSchedule?.mobileNumber.toString() ?? "NA")
              .paddingSymmetric(horizontal: 5, vertical: 2),
          view.titleTimingView().paddingSymmetric(horizontal: 5, vertical: 2),
          view
              .appointmentTimingValueView(
              data.bookSchedule?.availability?.startTime ?? "NA",
              data.bookSchedule?.availability?.endTime ?? "NA")
              .paddingSymmetric(horizontal: 5),
        ],
      ),
    );
  }

  Widget noAppointmentView() {
    return Center(
      child: Text(
        "No Appointments Available!",
        style: AppTextStyles.boldTextStyle(txtColor: Colors.grey),
      ),
    );
  }

}