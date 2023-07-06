import 'package:flutter/material.dart';
import '../../../../../helpers/api_helper.dart';
import '../../../models/today_nurse_appointment_model.dart';
import '../../data/nurse_api_urls.dart';

class NurseTodayAppointmentProvider with ChangeNotifier {

  bool _loaderStatus = true;
  bool get loaderStatus => _loaderStatus;



  var httpHelper = HttpRequestHelper();

  List<TodayNurseConsultationData> _getTodayNurseAppointmentsData =
  List<TodayNurseConsultationData>.empty();

  List<TodayNurseConsultationData> get getTodayNurseAppointmentsData =>
      _getTodayNurseAppointmentsData;

  getTodayNurseVideoAppointments(String consulTypeId) async {

    _getTodayNurseAppointmentsData=[];

    await httpHelper
        .httpGetRequest(todayDoctorVideoAppointmentsApi(consulTypeId),
            (apiStatus, responseData) {
         
          if (apiStatus == true) {
            _loaderStatus=false;
            var data = TodayNurseAppointmentModel.fromJson(responseData);
            if (data.status == true) {
              _getTodayNurseAppointmentsData =
                  data.data?.todayConsultation ?? _getTodayNurseAppointmentsData;
              notifyListeners();
            } else {
              _loaderStatus=false;
              _getTodayNurseAppointmentsData = _getTodayNurseAppointmentsData;
              notifyListeners();
            }
          } else {
            _loaderStatus=false;
            _getTodayNurseAppointmentsData = _getTodayNurseAppointmentsData;
            notifyListeners();
          }
        });
  }
  
}  