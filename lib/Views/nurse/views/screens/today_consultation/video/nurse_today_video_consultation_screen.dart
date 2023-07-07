import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/constants/constant_data.dart';
import '../../../../../../widgets/100ms/enum/meeting_mode.dart';
import '../../../../../../widgets/100ms/providers/meeting_mode_provider.dart';
import '../../../../../../widgets/100ms/start_video_service.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../controllers/providers/appointment/nurse_today_appointment_provider.dart';
import '../../../../models/today_nurse_appointment_model.dart';
import 'nurse_today_consultation_widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class NurseTodayVideoConsultationScreen extends StatefulWidget {
  const NurseTodayVideoConsultationScreen({super.key});

  @override
  State<NurseTodayVideoConsultationScreen> createState() =>
      _NurseTodayVideoConsultationScreenState();
}

class _NurseTodayVideoConsultationScreenState
    extends State<NurseTodayVideoConsultationScreen> {
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
                  : const ScreenLoadingView()
              : noAppointmentView();
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

    var myToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoyLCJ0eXBlIjoiYXBwIiwiYXBwX2RhdGEiOm51bGwsImFjY2Vzc19rZXkiOiI2NDFhOTA3YWE2OTUxNDgyYWQ4MGM3MDciLCJyb2xlIjoibnVyc2UiLCJyb29tX2lkIjoiNjRhNjYyMDU5ODU4NmI3YjE0ZDFhOTRhIiwidXNlcl9pZCI6Ijc5ZTY0YjdiLTQyYTktNGE2Ny1hNzgwLTRiY2RlOWUxYTA0ZCIsImV4cCI6MTY4ODcxMjA3MiwianRpIjoiMGYyNTgyNzYtMjFlNC00NTkzLTg5Y2YtM2Q4MzhjY2RkNzEyIiwiaWF0IjoxNjg4NjI1NjcyLCJpc3MiOiI2NDFhOTA3YWE2OTUxNDgyYWQ4MGM3MDUiLCJuYmYiOjE2ODg2MjU2NzIsInN1YiI6ImFwaSJ9.8O2Q22oFg9Uhzd1bxNm4NuIYtlY-zmA4GAXNfM_GfXQ";
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

  Widget noAppointmentView() {
    return Center(
      child: Text(
        "No Appointments Available!",
        style: boldTextStyle(color: Colors.grey),
      ),
    );
  }
}
