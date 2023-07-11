import 'package:flutter/cupertino.dart';

import '../../../../utils/data/local_data_keys.dart';
import '../../../../utils/data/shared_preference.dart';

class PharmacistDetailsProvider with ChangeNotifier{
  String _userId = "";

  String get getUserid => _userId;

  String _firstName = "";

  String get getUserFirstName => _firstName;

  String _lastName = "";

  String get getUserLastName => _lastName;

  String _education = "";

  String get getUserEducation => _education;

  String _designation = "";

  String get getUserDesignation => _designation;

  String _profilePic = "";

  String get getUserProfilePic => _profilePic;

  String _phoneNo = "";

  String get getUserPhoneNo => _phoneNo;

  getUserDetails() async {
    _userId = await getStringFromLocal(userIdKey);
    _firstName = await getStringFromLocal(userFirstNameKey);
    _lastName = await getStringFromLocal(userLastNameKey);
    _education = await getStringFromLocal(userEducationKey);
    _designation = await getStringFromLocal(userDesignationKey);
    _profilePic = await getStringFromLocal(userProfilePicKey);
    _phoneNo = await getStringFromLocal(userMobileKey);
    notifyListeners();
  }

  addUserId(String userid) async {
    _userId = userid;
    await storeStringToLocal(userIdKey, userid);
    notifyListeners();
  }

  addFirstName(String firstName) async {
    _firstName = firstName;
    await storeStringToLocal(userFirstNameKey, firstName);
    notifyListeners();
  }

  addLastName(String lastName) async {
    _lastName = lastName;
    await storeStringToLocal(userLastNameKey, lastName);
    notifyListeners();
  }

  addEducation(String education) async {
    _education = education;
    await storeStringToLocal(userEducationKey, education);
    notifyListeners();
  }

  addDesignation(String designation) async {
    _designation = designation;
    await storeStringToLocal(userDesignationKey, designation);
    notifyListeners();
  }

  addProfilePic(String profilePic) async {
    _profilePic = profilePic;
    await storeStringToLocal(userProfilePicKey, profilePic);
    notifyListeners();
  }

  addPhoneNo(String phoneNo) async {
    _phoneNo = phoneNo;
    await storeStringToLocal(userMobileKey, phoneNo);
    notifyListeners();
  }
}