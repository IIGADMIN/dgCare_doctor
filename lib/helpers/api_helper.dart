import 'dart:convert';
import 'package:healthcaredoctor2050/utils/datas/local_data_keys.dart';
import 'package:healthcaredoctor2050/utils/datas/shared_preference.dart';
import 'package:http/http.dart' as http;



class HttpRequestHelper {
  bool? hasToken;
  Map<String, dynamic>? data;

  HttpRequestHelper({this.hasToken = true});

  Future<Map<String, String>> _getCommonHeaders() async {
    String userToken = await getStringFromLocal(userTokenKey);
    Map<String, String> commonHeaders = {
      'Accept': 'application/json',
      'Authorization': "Bearer $userToken"
    };
    return commonHeaders;
  }

  Map<String, String> commonHeaders = {
    'Accept': 'application/json',
  };

  Map<String, String> errorData({String? message}) =>
      {"message": message ?? "no data found"};

  Future<void> httpGetRequest(
      Uri serviceUrl,
      void Function(bool apiStatus, Map<String, dynamic> responseData)
          completionHandler) async {
    var headersWithToken = await _getCommonHeaders();

    try {
      final response = await http.get(serviceUrl,
          headers: hasToken == true ? headersWithToken : commonHeaders);
      if (response.statusCode == 200) {
        final resData = response.body;
        completionHandler(true, json.decode(resData));
      } else {
        completionHandler(false, errorData());
      }
    } catch (e) {
      completionHandler(false, errorData(message: e.toString()));
    }
  }

  Future<void> httpPostRequest(
      Uri serviceUrl,
      Map<String, dynamic> postData,
      void Function(bool apiStatus, Map<String, dynamic> responseData)
          completionHandler) async {
    var headersWithToken = await _getCommonHeaders();
    try {
      final response = await http.post(serviceUrl,
          body: postData,
          headers: hasToken == true ? headersWithToken : commonHeaders);
      if (response.statusCode == 200) {
        final resData = response.body;
        completionHandler(true, json.decode(resData));
      } else {
        completionHandler(false, errorData());
      }
    } catch (e) {
      print('Exception - $e');
      completionHandler(false, errorData(message: e.toString()));
    }
  }

  Future<void> httpDeleteRequest(
      Uri serviceUrl,
      Map<String, dynamic> deleteData,
      void Function(bool apiStatus, Map<String, dynamic> responseData)
      completionHandler
      )async{
    var headersWithToken = await _getCommonHeaders();
    try {
      final response = await http.delete(serviceUrl,
          headers: hasToken == true ? headersWithToken : commonHeaders);
      if (response.statusCode == 200) {
        final resData = response.body;
        print(response.body);
        completionHandler(true, json.decode(resData));
      } else {
        completionHandler(false, errorData());
      }
    } catch (e) {
      print('Exception - $e');
      completionHandler(false, errorData(message: e.toString()));
    }
  }
}
