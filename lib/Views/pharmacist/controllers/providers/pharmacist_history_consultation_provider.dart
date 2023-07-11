import 'package:flutter/material.dart';

import '../../../../helpers/api_helper.dart';
import '../../models/pharmacist_history_model.dart';
import '../data/pharmacist_api_urls.dart';

class PharmacistHistoryConsultationProvider with ChangeNotifier{

  var httpHelper = HttpRequestHelper();

  bool _loaderStatus = true;
  bool get loaderStatus=>_loaderStatus;

  updateLoaderStatus(){
    _loaderStatus = false;
    notifyListeners();
  }

  List<PharmacistHistoryConsultationData> _getNurseHistoriesData = List<PharmacistHistoryConsultationData>.empty();
  List<PharmacistHistoryConsultationData> get getNurseHistoriesData => _getNurseHistoriesData;

  getPharmacistHistories(String consultTypeId)async{
    await httpHelper.httpGetRequest(historyPharmacistConsultationApi(consultTypeId), (apiStatus, responseData) {
      updateLoaderStatus();
      if(apiStatus == true){
        var data = PharmacistHistoryModel.fromJson(responseData);
        if(data.status == true){
          _getNurseHistoriesData = data.data?.historyConsultation ?? _getNurseHistoriesData;
          notifyListeners();
        }else{
          _getNurseHistoriesData = List<PharmacistHistoryConsultationData>.empty();
          notifyListeners();
        }
      }else{
        _getNurseHistoriesData = List<PharmacistHistoryConsultationData>.empty();
        notifyListeners();
      }
    });
  }

}