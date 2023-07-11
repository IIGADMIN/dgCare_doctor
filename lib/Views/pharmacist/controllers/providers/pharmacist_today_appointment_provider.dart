import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/helpers/api_helper.dart';
import '../../models/today_pharmacist_appointment_model.dart';
import '../data/pharmacist_api_urls.dart';

class PharmacistTodayAppointmentProvider with ChangeNotifier {
  bool _loaderStatus = true;

  bool get loaderStatus => _loaderStatus;

  var httpHelper = HttpRequestHelper();

  List<PharmacistTodayConsultationData> _getTodayNurseAppointmentsData =
      List<PharmacistTodayConsultationData>.empty();

  List<PharmacistTodayConsultationData> get getTodayNurseAppointmentsData =>
      _getTodayNurseAppointmentsData;

  getTodayPharmacistAppointments(String consulTypeId) async {
    _getTodayNurseAppointmentsData = [];

    await httpHelper
        .httpGetRequest(todayPharmacistAppointmentsApi(consulTypeId),
            (apiStatus, responseData) {
      if (apiStatus == true) {
        _loaderStatus = false;
        var data = TodayPharmacistAppointmentModel.fromJson(responseData);
        if (data.status == true) {
          _getTodayNurseAppointmentsData =
              data.data?.todayConsultation ?? _getTodayNurseAppointmentsData;
          notifyListeners();
        } else {
          _loaderStatus = false;
          _getTodayNurseAppointmentsData = _getTodayNurseAppointmentsData;
          notifyListeners();
        }
      } else {
        _loaderStatus = false;
        _getTodayNurseAppointmentsData = _getTodayNurseAppointmentsData;
        notifyListeners();
      }
    });
  }
}
