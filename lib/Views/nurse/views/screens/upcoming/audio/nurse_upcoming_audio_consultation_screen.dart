import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/constants/constant_data.dart';

import '../../../../../../Utils/colors/colors.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../controllers/providers/appointment/nurse_upcoming_consultation_provider.dart';
import '../../../../models/nurse_upcoming_consultation_model.dart';
import '../nurse_upcoming_video_consultation_widgets.dart';
import 'package:provider/provider.dart';

class NurseUpcomingAudioConsultationScreen extends StatefulWidget {
  const NurseUpcomingAudioConsultationScreen({super.key});

  @override
  State<NurseUpcomingAudioConsultationScreen> createState() =>
      _NurseUpcomingAudioConsultationScreenState();
}

class _NurseUpcomingAudioConsultationScreenState
    extends State<NurseUpcomingAudioConsultationScreen> {
  @override
  void initState() {
    super.initState();
    getUserType();
  }

  Future<void> getUserType() async {
    var provider =
        Provider.of<NurseUpcomingConsultationProvider>(context, listen: false);
    provider.getNurseUpcomingConsultations(audioConsultationId);
  }

  @override
  Widget build(BuildContext context) {
    var view = NurseUpcomingConsultationWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Audio Consultations"),
      ),
      body: Consumer<NurseUpcomingConsultationProvider>(
        builder: (BuildContext context, value, Widget? child) {
          List<UpcomingConsultationNurseListData> data =
              value.upcomingServiceProviderNurseConsultationsList;
          return value.showLoader == false
              ? data.isNotEmpty
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return view.nurseItemView(data[index]);
                      })
                  : const ScreenLoadingView()
              : view.noAppointmentView();
        },
      ),
    );
  }
}
