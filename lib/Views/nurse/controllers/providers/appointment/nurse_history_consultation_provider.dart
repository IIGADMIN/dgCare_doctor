import 'package:flutter/cupertino.dart';
import 'package:healthcaredoctor2050/helpers/api_helper.dart';

import '../../../models/nurse_history_model.dart';
import '../../data/nurse_api_urls.dart';

class NurseHistoryConsultationProvider extends ChangeNotifier {
  var httpHelper = HttpRequestHelper();

  bool _loaderStatus = true;
  bool get loaderStatus=>_loaderStatus;

  updateLoaderStatus(){
    _loaderStatus = false;
    notifyListeners();
  }

  List<NurseHistoryConsultationData> _getNurseHistoriesData = List<NurseHistoryConsultationData>.empty();
  List<NurseHistoryConsultationData> get getNurseHistoriesData => _getNurseHistoriesData;

  getNurseHistories(String consultTypeId)async{
    await httpHelper.httpGetRequest(historyNurseConsultationApi(consultTypeId), (apiStatus, responseData) {
      updateLoaderStatus();
      if(apiStatus == true){
        var data = NurseHistoryModel.fromJson(responseData);
        if(data.status == true){
          _getNurseHistoriesData = data.data?.historyConsultation ?? _getNurseHistoriesData;
          notifyListeners();
        }else{
          _getNurseHistoriesData = List<NurseHistoryConsultationData>.empty();
          notifyListeners();
        }
      }else{
        _getNurseHistoriesData = List<NurseHistoryConsultationData>.empty();
        notifyListeners();
      }
    });
  }

}