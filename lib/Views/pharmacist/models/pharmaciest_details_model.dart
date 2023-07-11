// To parse this JSON data, do
//
//     final pharmacistDetailsModel = pharmacistDetailsModelFromJson(jsonString);

import 'dart:convert';

PharmacistDetailsModel pharmacistDetailsModelFromJson(String str) => PharmacistDetailsModel.fromJson(json.decode(str));

String pharmacistDetailsModelToJson(PharmacistDetailsModel data) => json.encode(data.toJson());

class PharmacistDetailsModel {
  bool? status;
  String? message;
  PharmacistData? data;

  PharmacistDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory PharmacistDetailsModel.fromJson(Map<String, dynamic> json) => PharmacistDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : PharmacistData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class PharmacistData {
  String? token;
  PharmacistUserDetailsData? userDetails;

  PharmacistData({
    this.token,
    this.userDetails,
  });

  factory PharmacistData.fromJson(Map<String, dynamic> json) => PharmacistData(
    token: json["token"],
    userDetails: json["userDetails"] == null ? null : PharmacistUserDetailsData.fromJson(json["userDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "userDetails": userDetails?.toJson(),
  };
}

class PharmacistUserDetailsData {
  int? userId;
  int? roleId;
  int? uniqueId;
  String? firstName;
  String? lastName;
  dynamic email;
  int? mobileNumber;
  dynamic otp;
  String? deviceType;
  int? isActive;
  int? isDeleted;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  PharmacistActiveData? pharmacist;

  PharmacistUserDetailsData({
    this.userId,
    this.roleId,
    this.uniqueId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.otp,
    this.deviceType,
    this.isActive,
    this.isDeleted,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.pharmacist,
  });

  factory PharmacistUserDetailsData.fromJson(Map<String, dynamic> json) => PharmacistUserDetailsData(
    userId: json["UserId"],
    roleId: json["RoleId"],
    uniqueId: json["UniqueId"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    mobileNumber: json["MobileNumber"],
    otp: json["OTP"],
    deviceType: json["DeviceType"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    createdBy: json["CreatedBy"],
    updatedBy: json["UpdatedBy"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    pharmacist: json["pharmacist"] == null ? null : PharmacistActiveData.fromJson(json["pharmacist"]),
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "RoleId": roleId,
    "UniqueId": uniqueId,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "MobileNumber": mobileNumber,
    "OTP": otp,
    "DeviceType": deviceType,
    "IsActive": isActive,
    "IsDeleted": isDeleted,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "CreatedAt": createdAt?.toIso8601String(),
    "UpdatedAt": updatedAt?.toIso8601String(),
    "pharmacist": pharmacist?.toJson(),
  };
}

class PharmacistActiveData {
  int? pharmacistId;
  int? organisationId;
  int? genderId;
  int? cityId;
  String? languageIdJson;
  dynamic aadhaarNumber;
  dynamic alternateNumber;
  String? profilePhoto;
  dynamic dob;
  String? maritalStatus;
  String? highestQualification;
  dynamic address;
  int? pincode;
  DateTime? createdDateTime;
  DateTime? updatedDateTime;

  PharmacistActiveData({
    this.pharmacistId,
    this.organisationId,
    this.genderId,
    this.cityId,
    this.languageIdJson,
    this.aadhaarNumber,
    this.alternateNumber,
    this.profilePhoto,
    this.dob,
    this.maritalStatus,
    this.highestQualification,
    this.address,
    this.pincode,
    this.createdDateTime,
    this.updatedDateTime,
  });

  factory PharmacistActiveData.fromJson(Map<String, dynamic> json) => PharmacistActiveData(
    pharmacistId: json["PharmacistId"],
    organisationId: json["OrganisationId"],
    genderId: json["GenderId"],
    cityId: json["CityId"],
    languageIdJson: json["LanguageIdJson"],
    aadhaarNumber: json["AadhaarNumber"],
    alternateNumber: json["AlternateNumber"],
    profilePhoto: json["ProfilePhoto"],
    dob: json["DOB"],
    maritalStatus: json["MaritalStatus"],
    highestQualification: json["HighestQualification"],
    address: json["Address"],
    pincode: json["Pincode"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "PharmacistId": pharmacistId,
    "OrganisationId": organisationId,
    "GenderId": genderId,
    "CityId": cityId,
    "LanguageIdJson": languageIdJson,
    "AadhaarNumber": aadhaarNumber,
    "AlternateNumber": alternateNumber,
    "ProfilePhoto": profilePhoto,
    "DOB": dob,
    "MaritalStatus": maritalStatus,
    "HighestQualification": highestQualification,
    "Address": address,
    "Pincode": pincode,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
  };
}
