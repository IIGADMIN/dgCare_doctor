import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/helpers/api_helper.dart';
import 'package:healthcaredoctor2050/views/pharmacist/controllers/providers/pharmacist_details_provider.dart';
import 'package:healthcaredoctor2050/views/pharmacist/models/pharmaciest_details_model.dart';

import '../../../../Utils/data/local_data_keys.dart';
import '../../../../Utils/data/shared_preference.dart';
import '../../../../widgets/app_widgets/notification/app_notification_view.dart';
import '../data/pharmacist_api_urls.dart';

class PharmacistAuthProvider with ChangeNotifier {
  bool _loaderStatus = false;

  bool get loaderStatus => _loaderStatus;

  bool _mobileStatus = false;

  bool get mobileStatus => _mobileStatus;

  var _authToken = "";

  get authToken => _authToken;

  setLoadingValue(bool status) {
    _loaderStatus = status;
    notifyListeners();
  }

  var httpHelper = HttpRequestHelper();

  Future<void> mobileNumberVerification(
      {required String phoneNo, required String userType}) async {
    var postData = {"MobileNumber": phoneNo, "RoleId": userType};
    await httpHelper.httpPostRequest(pharmacistGetOtpApi, postData,
            (apiStatus, responseData) {
          if (apiStatus == true && responseData['status'] == true) {
            _mobileStatus = true;
            notifyListeners();
          } else {
            _mobileStatus = false;
            notifyListeners();
          }
          notifyListeners();
        });
  }

  bool _otpStatus = false;
  bool get otpStatus => _otpStatus;

  Future<void> otpVerification(
      BuildContext context, {
        required String otp,
        required String mobileNo,
        required String userType,
      }) async {
    var postData = {
      "OTP": otp,
      "MobileNumber": mobileNo,
      "DeviceType": "2",
      "RoleId": userType,
      "DeviceToken": await AppNotificationViewState().getTokenz()
    };

    await httpHelper.httpPostRequest(pharmacistVerifyOtpApi, postData,
            (apiStatus, responseData) async {
          if (apiStatus == true && responseData['status'] == true) {
            _otpStatus = true;
            notifyListeners();
            await convertResponseBaseOnUserData(userType, responseData);
          } else {
            _otpStatus = false;
            notifyListeners();
          }
        });
  }

  Future<void> convertResponseBaseOnUserData(
      String userType, Map<String, dynamic> responseData) async {
    await storeStringToLocal(userTypeKey, userType);
    var data = PharmacistDetailsModel.fromJson(responseData);
    _authToken = data.data?.token ?? "Invalid token";
    await storeStringToLocal(
        userTokenKey, data.data?.token ?? "Invalid token");
    await storeBoolToLocal(loggedInKey, true);
    await addUserDetails(UserDetailsModel(
        firstName: data.data?.userDetails?.firstName ?? "NA",
        lastName: data.data?.userDetails?.lastName ?? "NA",
        userId: data.data?.userDetails?.userId.toString() ?? "NA",
        mobile: data.data?.userDetails?.mobileNumber.toString() ?? "NA",
        designation: "NA",
        education: "NA",
        image: data.data?.userDetails?.pharmacist?.profilePhoto ?? "NA"));

  }

  addUserDetails(UserDetailsModel data) async {
    var provider = PharmacistDetailsProvider();
    await provider.addFirstName(data.firstName);
    await provider.addLastName(data.lastName);
    await provider.addUserId(data.userId);
    await provider.addDesignation(data.designation);
    await provider.addEducation(data.education);
    await provider.addPhoneNo(data.mobile);
    await provider.addProfilePic(data.image);
  }
}

class UserDetailsModel {
  String firstName;
  String lastName;
  String userId;
  String mobile;
  String image;
  String education;
  String designation;

  UserDetailsModel(
      {required this.firstName,
        required this.lastName,
        required this.userId,
        required this.mobile,
        required this.designation,
        required this.education,
        required this.image});
}