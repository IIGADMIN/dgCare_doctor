import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/constants/constant_data.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/upcoming/pharmacist_upcoming_consultation_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../../Utils/colors/colors.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../controllers/providers/pharmacist_upcoming_consultation_provider.dart';
import '../../../../models/pharmacist_upcoming_consultation_model.dart';

class PharmacistUpcomingAudioConsultationScreen extends StatefulWidget {
  const PharmacistUpcomingAudioConsultationScreen({super.key});

  @override
  State<PharmacistUpcomingAudioConsultationScreen> createState() => _PharmacistUpcomingAudioConsultationScreenState();
}

class _PharmacistUpcomingAudioConsultationScreenState extends State<PharmacistUpcomingAudioConsultationScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    var provider =
    Provider.of<PharmacistUpcomingConsultationProvider>(
        context,
        listen: false);

    provider.getPharmacistUpcomingConsultations(
        audioConsultationId);
  }

  @override
  Widget build(BuildContext context) {
    var view = PharmacistUpcomingConsultationWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Audio Consultations"),
      ),
      body: Consumer<PharmacistUpcomingConsultationProvider>(
        builder: (BuildContext context, value, Widget? child) {
          List<UpcomingConsultationPharmacistListData> data =
              value.upcomingServiceProviderPharmacistConsultationsList;
          return value.showLoader == false
              ? data.isNotEmpty
              ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return view.pharmacistItemView(data[index]);
              })
              : const ScreenLoadingView()
              : view.noAppointmentView();
        },
      ),
    );
  }
}
