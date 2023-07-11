import 'package:flutter/cupertino.dart';
import '../../../../../helpers/api_helper.dart';
import '../../models/pharmacist_upcoming_consultation_model.dart';
import '../data/pharmacist_api_urls.dart';


class PharmacistUpcomingConsultationProvider extends ChangeNotifier {
  List<UpcomingConsultationPharmacistListData>
      _upcomingServiceProviderPharmacistConsultationsList =
      <UpcomingConsultationPharmacistListData>[];

  List<UpcomingConsultationPharmacistListData>
      get upcomingServiceProviderPharmacistConsultationsList =>
          _upcomingServiceProviderPharmacistConsultationsList;

  bool _showLoader = true;

  bool get showLoader => _showLoader;

  var httpHelper = HttpRequestHelper();

  getPharmacistUpcomingConsultations(
      String consultationTypeId) async {
    _upcomingServiceProviderPharmacistConsultationsList = [];

    await httpHelper.httpGetRequest(
        upcomingPharmacistConsultationApi(consultationTypeId), (apiStatus, responseData) {
      if (apiStatus == true) {
        var resData =
            PharmacistUpcomingConsultationModel.fromJson(responseData);

        if (resData.status == true) {
          _showLoader = false;

          _upcomingServiceProviderPharmacistConsultationsList =
              resData.data?.upcomingConsultation ??
                  _upcomingServiceProviderPharmacistConsultationsList;

          notifyListeners();
        }
      } else {
        _showLoader = false;
        _upcomingServiceProviderPharmacistConsultationsList.isEmpty;
        notifyListeners();
      }
      notifyListeners();
    });
  }
}
