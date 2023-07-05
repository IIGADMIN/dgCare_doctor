import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/doctor/controllers/providers/login/doctor_details_provider.dart';
import '../../../../../helpers/api_helper.dart';
import '../../../../../utils/constants/constant_data.dart';
import '../../../../../utils/data/local_data_keys.dart';
import '../../../../../utils/data/shared_preference.dart';
import '../../../../../widgets/app_widgets/notification/app_notification_view.dart';
import '../../../Models/doctor_details_model.dart';
import '../../data/doctor_api_urls.dart';


class DoctorAuthProvider with ChangeNotifier {

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
    await httpHelper.httpPostRequest(doctorGetOtpApi, postData,
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

    await httpHelper.httpPostRequest(doctorVerifyOtpApi, postData,
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
    if (userType == nurseCode) {
      var data = DoctorDetailsModel.fromJson(responseData);
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
          image: data.data?.userDetails?.doctor?.image ?? "NA"));
    }
  }

  addUserDetails(UserDetailsModel data) async {
    var provider = DoctorDetailsProvider();
    provider.addFirstName(data.firstName);
    provider.addLastName(data.lastName);
    provider.addUserId(data.userId);
    provider.addDesignation(data.designation);
    provider.addEducation(data.education);
    provider.addPhoneNo(data.mobile);
    provider.addProfilePic(data.image);
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
