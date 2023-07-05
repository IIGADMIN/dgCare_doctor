// To parse this JSON data, do
//
//     final nurseDetailsModel = nurseDetailsModelFromJson(jsonString);

import 'dart:convert';

NurseDetailsModel nurseDetailsModelFromJson(String str) => NurseDetailsModel.fromJson(json.decode(str));

String nurseDetailsModelToJson(NurseDetailsModel data) => json.encode(data.toJson());

class NurseDetailsModel {
  bool? status;
  String? message;
  NurseUserDetailsData? data;

  NurseDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory NurseDetailsModel.fromJson(Map<String, dynamic> json) => NurseDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : NurseUserDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class NurseUserDetailsData {
  String? token;
  NurseDetailsData? userDetails;

  NurseUserDetailsData({
    this.token,
    this.userDetails,
  });

  factory NurseUserDetailsData.fromJson(Map<String, dynamic> json) => NurseUserDetailsData(
    token: json["token"],
    userDetails: json["userDetails"] == null ? null : NurseDetailsData.fromJson(json["userDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "userDetails": userDetails?.toJson(),
  };
}

class NurseDetailsData {
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
  NurseData? nurse;

  NurseDetailsData({
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
    this.nurse,
  });

  factory NurseDetailsData.fromJson(Map<String, dynamic> json) => NurseDetailsData(
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
    nurse: json["nurse"] == null ? null : NurseData.fromJson(json["nurse"]),
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
    "nurse": nurse?.toJson(),
  };
}

class NurseData {
  int? nurseId;
  int? organisationId;
  dynamic aadhaarNumber;
  dynamic alternateNumber;
  String? profilePhoto;
  dynamic dob;
  int? genderId;
  String? maritalStatus;
  dynamic highestQualification;
  int? cityId;
  dynamic address;
  int? pincode;
  String? languageIdJson;
  DateTime? createdDateTime;
  DateTime? updatedDateTime;

  NurseData({
    this.nurseId,
    this.organisationId,
    this.aadhaarNumber,
    this.alternateNumber,
    this.profilePhoto,
    this.dob,
    this.genderId,
    this.maritalStatus,
    this.highestQualification,
    this.cityId,
    this.address,
    this.pincode,
    this.languageIdJson,
    this.createdDateTime,
    this.updatedDateTime,
  });

  factory NurseData.fromJson(Map<String, dynamic> json) => NurseData(
    nurseId: json["NurseId"],
    organisationId: json["OrganisationId"],
    aadhaarNumber: json["AadhaarNumber"],
    alternateNumber: json["AlternateNumber"],
    profilePhoto: json["ProfilePhoto"],
    dob: json["DOB"],
    genderId: json["GenderId"],
    maritalStatus: json["MaritalStatus"],
    highestQualification: json["HighestQualification"],
    cityId: json["CityId"],
    address: json["Address"],
    pincode: json["Pincode"],
    languageIdJson: json["LanguageIdJson"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "NurseId": nurseId,
    "OrganisationId": organisationId,
    "AadhaarNumber": aadhaarNumber,
    "AlternateNumber": alternateNumber,
    "ProfilePhoto": profilePhoto,
    "DOB": dob,
    "GenderId": genderId,
    "MaritalStatus": maritalStatus,
    "HighestQualification": highestQualification,
    "CityId": cityId,
    "Address": address,
    "Pincode": pincode,
    "LanguageIdJson": languageIdJson,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
  };
}
