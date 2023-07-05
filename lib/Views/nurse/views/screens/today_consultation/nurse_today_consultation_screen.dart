import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/constant_data.dart';
import '../../../../../widgets/loader_dialog_view.dart';
import '../../../controllers/providers/appointment/nurse_today_appointment_provider.dart';
import '../../../controllers/providers/meeting/meeting_mode_provider.dart';
import '../../../models/today_nurse_appointment_model.dart';
import 'nurse_today_consultation_widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class NurseTodayConsultationScreen extends StatefulWidget {
  const NurseTodayConsultationScreen({super.key});

  @override
  State<NurseTodayConsultationScreen> createState() => _NurseTodayConsultationScreenState();
}

class _NurseTodayConsultationScreenState extends State<NurseTodayConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Appointments"),
        backgroundColor: mainColor,
      ),
      body: Consumer<NurseTodayAppointmentProvider>(
        builder: (BuildContext context, value, Widget? child) {
          List<TodayNurseConsultationData> data =
              value.getTodayNurseAppointmentsData;
          return value.loaderStatus == false
              ? data.isNotEmpty
              ? ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _cardItem(data[index]);
              })
              : noAppointmentView()
              : const ScreenLoadingView();
        },
      ),
    );
  }

  _cardItem(TodayNurseConsultationData data) {
    var view = NurseTodayConsultationWidgets(context: context);
    return Card(
      elevation: 5,
      child: Column(
        children: [
          view.headerView(
              "${data.bookSchedule?.patientFirstName} ${data.bookSchedule?.patientLastName}"),
          view
              .mobileNumberView(
              data.bookSchedule?.mobileNumber.toString() ?? "NA")
              .paddingSymmetric(horizontal: 5, vertical: 2),
          view
              .ageAndGenderView(
              data.bookSchedule?.patientAge.toString() ?? "NA",
              data.bookSchedule?.gender?.genderName ?? "NA")
              .paddingSymmetric(horizontal: 5),
          view.titleTimingView().paddingSymmetric(horizontal: 5),
          view
              .appointmentTimingValueView(
              data.bookSchedule?.availability?.startTime ?? "",
              data.bookSchedule?.availability?.endTime ?? "")
              .paddingSymmetric(horizontal: 5),
          data.bookSchedule?.status.toString() == activeStatusCode
              ? view.joinButtonView("Start Video Call", color: Colors.green,
              onTap: () {
                startVideoCall(
                    doctorId: data.nurse?.nurseId.toString() ?? "",
                    roomId: data.bookSchedule?.roomId,
                    userName:
                    "${data.nurse?.activeNurse?.firstName} ${data.nurse?.activeNurse?.lastName}");
              }).paddingSymmetric(horizontal: 5)
              : view.joinButtonView(
              "Join at ${data.bookSchedule?.availability?.startTime}",
              color: buttonColor)
        ],
      ),
    );
  }

  startVideoCall(
      {required String doctorId,
        required String roomId,
        required String userName}) async {
    MeetingModeProvider meetingModeProvider =
    Provider.of<MeetingModeProvider>(context, listen: false);
    meetingModeProvider.switchMeetingCategory(isAudio: false);
    await MeetingModeProvider.getMeetingToken(
        userId: "doctor_id_$doctorId", roomId: roomId, role: nurseRoleName)
        .then((value) => {
      if (value != '')
        {
          start100msService(
            context,
            userName: userName,
            meetingToken: value,
            meetingMode: MeetingMode.Video,
          )
        }
      else
        {Fluttertoast.showToast(msg: "Can't get token")}
    });
  }

  noAppointmentView() {
    return Center(
      child: Text(
        "No Appointments Available!",
        style: boldTextStyle(color: Colors.grey),
      ),
    );
  }
}
