import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/shapes/app_shapes.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../../Utils/colors/colors.dart';
import '../../../../../Utils/data/local_data_keys.dart';
import '../../../../../Utils/data/shared_preference.dart';
import '../../../../../helpers/date_and_time_converter.dart';
import '../../../../../widgets/loader_dialog_view.dart';
import '../../../controllers/providers/appointment/nurse_history_consultation_provider.dart';
import '../../../models/nurse_history_model.dart';
import 'package:nb_utils/nb_utils.dart';

class HistoryNurseConsultationItem extends StatefulWidget {
  final String appointmentType;
  const HistoryNurseConsultationItem({super.key, required this.appointmentType});

  @override
  State<HistoryNurseConsultationItem> createState() => _HistoryNurseConsultationItemState();
}

class _HistoryNurseConsultationItemState extends State<HistoryNurseConsultationItem> {

  Future<void> getNurseHistoryData() async {
    var provider =
    Provider.of<NurseHistoryConsultationProvider>(context, listen: false);
    if (widget.appointmentType == "video") {
      provider.getNurseHistories('1');
    } else {
      provider.getNurseHistories('1');
    }
  }

  String userType = "";

  @override
  void initState() {
    super.initState();
    getUserType();
  }

  getUserType() async {
    await getStringFromLocal(userTypeKey).then((value) {
      setState(() {
        userType = value;
        getNurseHistoryData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NurseHistoryConsultationProvider>(
      builder: (BuildContext context, value, Widget? child) {
        List<NurseHistoryConsultationData> data = value.getNurseHistoriesData;
        return value.loaderStatus == false
            ? data.isNotEmpty
            ? ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 5, vertical: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _nurseItemCardView(data[index]);
            })
            : _noHistoryAvailableView()
            : const ScreenLoadingView();
      },
    );
  }

  _nurseItemCardView(NurseHistoryConsultationData data) {
    return Card(
      elevation: 10,
      shape: circularBorderShape(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appointmentListHeaderView(
              convertDate(
                  format: dateFormatWithHalfMonthName,
                  yourDate: data.bookSchedule?.scheduleDate ?? DateTime.now()),
              radius: 4),
          2.height,
          Text(
              "${data.bookSchedule?.patientFirstName} ${data.bookSchedule?.patientLastName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.boldTextStyle(txtColor: textColor, size: 16)),
          patientAgeAndGenderView(
              data.bookSchedule?.patientAge.toString() ?? "NA",
              data.bookSchedule?.gender?.genderName ?? "NA"),
          patentMobileNumberView(
              data.bookSchedule?.mobileNumber.toString() ?? ""),
          2.height,
          appointmentTitleTimingView(),
          appointmentTimingValueView(
              data.bookSchedule?.availability?.startTime ?? "NA",
              data.bookSchedule?.availability?.endTime ?? "NA"),
          5.height,
          // _nurseDoctorDetailsView(data),
          // _appointmentStatusViewButton(data.status, data.consultationType, context),
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 5),
    );
  }

  patientAgeAndGenderView(String age, String gender) {
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

  patentMobileNumberView(String number) {
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

  appointmentDateView(DateTime date) {
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

  appointmentTitleTimingView() {
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

  appointmentTimingValueView(String startTime, String endTime) {


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

  _noHistoryAvailableView() {
    return Center(
      child: Text(
        "No History Available!",
        style: AppTextStyles.boldTextStyle(txtColor: Colors.grey),
      ),
    );
  }

}
