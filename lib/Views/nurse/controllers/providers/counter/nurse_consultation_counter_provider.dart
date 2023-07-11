import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/helpers/api_helper.dart';
import '../../../models/appointment_counter_model.dart';
import '../../data/nurse_api_urls.dart';

class NurseConsultationCountProvider with ChangeNotifier {
  bool _loadingStatus = true;

  bool get loadingStatus => _loadingStatus;

  var httpHelper = HttpRequestHelper();

  AppointmentCounterData _getCounterData = AppointmentCounterData();
  AppointmentCounterData get getCounterData => _getCounterData;
  
  Future<void> getAppointmentCounter()async{

    await httpHelper.httpGetRequest(appointmentCounterApi, (apiStatus, responseData) {
      _loadingStatus = false;
      if(apiStatus == true){
        var data = AppointmentCounterModel.fromJson(responseData);
        if(data.status == true){
          _getCounterData = data.data ?? AppointmentCounterData();
          notifyListeners();
        }else{
          _getCounterData = _getCounterData;
          notifyListeners();
        }
      }else{
        _getCounterData = _getCounterData;
        notifyListeners();
      }
    });
  }
}
