import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/Utils/colors/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/constants/constant_data.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../../pharmacist/controllers/providers/pharmacist_upcoming_consultation_provider.dart';
import '../../../../controllers/providers/appointment/nurse_upcoming_consultation_provider.dart';
import '../../../../models/nurse_upcoming_consultation_model.dart';
import '../nurse_upcoming_video_consultation_widgets.dart';

class NurseUpcomingVideoConsultationScreen extends StatefulWidget {
  const NurseUpcomingVideoConsultationScreen({super.key});

  @override
  State<NurseUpcomingVideoConsultationScreen> createState() =>
      _NurseUpcomingVideoConsultationScreenState();
}

class _NurseUpcomingVideoConsultationScreenState
    extends State<NurseUpcomingVideoConsultationScreen> {

  @override
  void initState() {
    super.initState();
    getUserType();
  }

  Future<void> getUserType() async {
    var provider =
    Provider.of<PharmacistUpcomingConsultationProvider>(
        context,
        listen: false);

    provider.getPharmacistUpcomingConsultations(
        videoConsultationId);
  }

  @override
  Widget build(BuildContext context) {
    var view = NurseUpcomingConsultationWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Video Consultations"),
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
