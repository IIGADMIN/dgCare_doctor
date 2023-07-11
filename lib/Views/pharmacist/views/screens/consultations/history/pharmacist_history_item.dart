import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/controllers/providers/pharmacist_history_consultation_provider.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/consultations/history/pharmacist_history_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../../Utils/Styles/text_style.dart';
import '../../../../../../helpers/date_and_time_converter.dart';
import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/constants/constant_data.dart';
import '../../../../../../utils/shapes/app_shapes.dart';
import '../../../../../../widgets/loader_dialog_view.dart';
import '../../../../models/pharmacist_history_model.dart';
import 'package:nb_utils/nb_utils.dart';

class PharmacistHistoryItem extends StatefulWidget {
  final String appointmentType;

  const PharmacistHistoryItem({super.key, required this.appointmentType});

  @override
  State<PharmacistHistoryItem> createState() => _PharmacistHistoryItemState();
}

class _PharmacistHistoryItemState extends State<PharmacistHistoryItem> {
  Future<void> getPharmacistHistoryData() async {
    var provider = Provider.of<PharmacistHistoryConsultationProvider>(context,
        listen: false);
    if (widget.appointmentType == "video") {
      provider.getPharmacistHistories(videoConsultationId);
    } else {
      provider.getPharmacistHistories(audioConsultationId);
    }
  }

  @override
  void initState() {
    super.initState();
    getPharmacistHistoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<PharmacistHistoryConsultationProvider>(
      builder: (BuildContext context, value, Widget? child) {
        List<PharmacistHistoryConsultationData> data =
            value.getNurseHistoriesData;
        return value.loaderStatus == false
            ? data.isNotEmpty
                ? ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return _pharmacistItemCardView(data[index]);
                    })
                : _noHistoryAvailableView()
            : const ScreenLoadingView();
      },
    ));
  }

  _pharmacistItemCardView(PharmacistHistoryConsultationData data) {
    var view = PharmacistHistoryWidgets(context: context);

    return Card(
      elevation: 10,
      shape: circularBorderShape(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          view.appointmentListHeaderView(
              convertDate(
                  format: dateFormatWithHalfMonthName,
                  yourDate: data.bookSchedule?.scheduleDate ?? DateTime.now()),
              radius: 4),
          2.height,
          Text(
              "${data.bookSchedule?.patientFirstName} ${data.bookSchedule?.patientLastName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  AppTextStyles.boldTextStyle(txtColor: textColor, size: 16)),
          view.patientAgeAndGenderView(
              data.bookSchedule?.patientAge.toString() ?? "NA",
              data.bookSchedule?.gender?.genderName ?? "NA"),
          view.patentMobileNumberView(
              data.bookSchedule?.mobileNumber.toString() ?? ""),
          2.height,
          view.appointmentTitleTimingView(),
          view.appointmentTimingValueView(
              data.bookSchedule?.availability?.startTime ?? "NA",
              data.bookSchedule?.availability?.endTime ?? "NA"),
          5.height,
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 5),
    );
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
