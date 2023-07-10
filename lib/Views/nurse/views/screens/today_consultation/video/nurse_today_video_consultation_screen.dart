import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/constants/constant_data.dart';
import '../../../../../../widgets/100ms/enum/meeting_mode.dart';
import '../../../../../../widgets/100ms/providers/meeting_mode_provider.dart';
import '../../../../../../widgets/100ms/start_video_service.dart';
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
    var nurseData = [
      myData,myData,myData
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Appointments"),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          itemCount: nurseData.length,
          itemBuilder: (context, index) {
            return _cardItem(nurseData[index]);
          }),
      // body: Consumer<NurseTodayAppointmentProvider>(
      //   builder: (BuildContext context, value, Widget? child) {
      //     List<TodayNurseConsultationData> data =
      //         value.getTodayNurseAppointmentsData;
      //     return value.loaderStatus == false
      //         ? nurseData.isNotEmpty
      //             ? ListView.builder(
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 10, vertical: 10),
      //                 itemCount: nurseData.length,
      //                 itemBuilder: (context, index) {
      //                   return _cardItem(nurseData[index]);
      //                 })
      //             : const ScreenLoadingView()
      //         : noAppointmentView();
      //   },
      // ),
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

  Widget noAppointmentView() {
    return Center(
      child: Text(
        "No Appointments Available!",
        style: boldTextStyle(color: Colors.grey),
      ),
    );
  }

  TodayNurseConsultationData myData = TodayNurseConsultationData(
    nurse: TodayAppointmentNurseData(
      activeNurse: TodayAppointmentActiveNurseData(
        roleId: 12,
        firstName: "Nurse",
        lastName: "name",
        mobileNumber: 1234567890,
        userId: 1,
        email: "nurse@gmail.com",
      )
    ),
    bookScheduleId: 12,
    bookSchedule: TodayNurseBookScheduleData(
      bookScheduleId: 1,
      mobileNumber: 1234567890,
      consultTypeId: 1,
      availability: TodayNurseAvailabilityData(
        endTime: "12:30 PM",
        startTime: "1:00 PM",
      ),
      gender: TodayNurseGenderData(
        genderId: 1,
        genderName: "Male",
      ),
      parentBookingId: 1,
      patientAge: 20,
      patientEmail: "patient@gmail.com",
      patientFirstName: "Patient",
      patientLastName: "name",
      patientPincode: 123456,
      specialization:TodayNurseSpecializationData(
        specializationName: "Specialization",
      )
    )
  );

}
