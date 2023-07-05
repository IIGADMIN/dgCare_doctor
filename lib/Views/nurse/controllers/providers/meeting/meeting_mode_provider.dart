import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../../utils/data/local_data_keys.dart';
import '../../../../../utils/data/shared_preference.dart';
import '../../Utils/data/local_data_keys.dart';
import '../../Utils/data/shared_preference.dart';
import '../../helpers/api_helper.dart';
import '../../Api/Api.dart';
import '../../Model/meeting_token_model.dart';

class MeetingModeProvider with ChangeNotifier {
  bool _isAudioMeeting = false;

  bool get isAudioOnly => _isAudioMeeting;

  int _bookScheduleId = 0;
  int get bookscheduleId=> _bookScheduleId;

  updateBookScheduleId({required int bookScheduleId}){
    _bookScheduleId = bookScheduleId;
    notifyListeners();
  }

  switchMeetingCategory({required bool isAudio}) {
    _isAudioMeeting = isAudio;
    notifyListeners();
  }

  static Future<String> getMeetingToken(
      {required String userId,
      required String roomId,
      required String role}) async {

    String roomToken = '';
    Uri endPoint = Uri.parse(getRoomTokenAPI);
    http.Response response = await http.post(endPoint,
        body: {'user_id': userId, 'room_id': roomId, 'role': role});
    if(response.statusCode == 200){
      var resData = jsonDecode(response.body);
      var data = MeetingTokenModel.fromJson(resData);
      roomToken = data.token??"";

    }
    return roomToken;
  }

  Future<bool> roomEndService() async {

    String userToken = await getStringFromLocal(userTokenKey);
  
    var response = await http.post(callEndApi, 
    headers: {
     // 'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $userToken',
    },
    
    body: {
      "BookScheduleId": _bookScheduleId.toString(),
    });

    if (response.statusCode == 200) {
      var resData = jsonDecode(response.body);

      if (resData['status'] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
