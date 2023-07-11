import 'package:flutter/cupertino.dart';
import '../../../../../helpers/api_helper.dart';
import '../../../models/nurse_upcoming_consultation_model.dart';
import '../../data/nurse_api_urls.dart';

class NurseUpcomingConsultationProvider extends ChangeNotifier {
  List<UpcomingConsultationNurseListData>
      _upcomingServiceProviderNurseConsultationsList =
      <UpcomingConsultationNurseListData>[];

  List<UpcomingConsultationNurseListData>
      get upcomingServiceProviderNurseConsultationsList =>
          _upcomingServiceProviderNurseConsultationsList;

  bool _showLoader = true;

  bool get showLoader => _showLoader;

  var httpHelper = HttpRequestHelper();

  getServiceProviderNurseUpcomingConsultations(
      String consultationTypeId) async {
    _upcomingServiceProviderNurseConsultationsList = [];

    await httpHelper
        .httpGetRequest(upcomingNurseConsultationApi(consultationTypeId),
            (apiStatus, responseData) {
      if (apiStatus == true) {
        var resData = NursesUpcomingConsultationModel.fromJson(responseData);

        if (resData.status == true) {
          _showLoader = false;

          _upcomingServiceProviderNurseConsultationsList =
              resData.data?.upcomingConsultation ??
                  _upcomingServiceProviderNurseConsultationsList;

          notifyListeners();
        }
      } else {
        _showLoader = false;
        notifyListeners();
      }
      notifyListeners();
    });
  }
}
