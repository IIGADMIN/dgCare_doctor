import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/today/pharmacist_today_consultation_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/colors/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../../utils/constants/constant_data.dart';
import '../../../../../../widgets/100ms/enum/meeting_mode.dart';
import '../../../../../../widgets/100ms/providers/meeting_mode_provider.dart';
import '../../../../../../widgets/100ms/start_video_service.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../controllers/providers/pharmacist_today_appointment_provider.dart';
import '../../../../models/today_pharmacist_appointment_model.dart';

class PharmacistTodayVideoConsultationScreen extends StatefulWidget {
  const PharmacistTodayVideoConsultationScreen({super.key});

  @override
  State<PharmacistTodayVideoConsultationScreen> createState() =>
      _PharmacistTodayVideoConsultationScreenState();
}

class _PharmacistTodayVideoConsultationScreenState
    extends State<PharmacistTodayVideoConsultationScreen> {
  Timer? _timer = Timer.periodic(const Duration(seconds: 0), (timer) {});

  @override
  void initState() {
    super.initState();
    getData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // getData();
    });
  }

  Future<void> getData() async {
    Provider.of<PharmacistTodayAppointmentProvider>(context, listen: false)
        .getTodayPharmacistAppointments(videoConsultationId);
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Appointments"),
        backgroundColor: mainColor,
      ),
      body: Consumer<PharmacistTodayAppointmentProvider>(
        builder: (BuildContext context, value, Widget? child) {
          List<PharmacistTodayConsultationData> data =
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

  _cardItem(PharmacistTodayConsultationData data) {
    var view = PharmacistTodayConsultationWidgets(context: context);
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
                      doctorId: data.pharmacist?.pharmacistId.toString() ?? "",
                      roomId: data.bookSchedule?.roomId,
                      userName:
                          "${data.pharmacist?.activePharmacist?.firstName} ${data.pharmacist?.activePharmacist?.lastName}");
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
}
