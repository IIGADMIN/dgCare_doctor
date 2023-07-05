// To parse this JSON data, do
//
//     final doctorDetailsModel = doctorDetailsModelFromJson(jsonString);

import 'dart:convert';

DoctorDetailsModel doctorDetailsModelFromJson(String str) => DoctorDetailsModel.fromJson(json.decode(str));

String doctorDetailsModelToJson(DoctorDetailsModel data) => json.encode(data.toJson());

class DoctorDetailsModel {
  bool? status;
  String? message;
  DoctorData? data;

  DoctorDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) => DoctorDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : DoctorData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class DoctorData {
  String? token;
  DoctorDetailsData? userDetails;

  DoctorData({
    this.token,
    this.userDetails,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
    token: json["token"],
    userDetails: json["userDetails"] == null ? null : DoctorDetailsData.fromJson(json["userDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "userDetails": userDetails?.toJson(),
  };
}

class DoctorDetailsData {
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
  DoctorExtraDetailsData? doctor;

  DoctorDetailsData({
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
    this.doctor,
  });

  factory DoctorDetailsData.fromJson(Map<String, dynamic> json) => DoctorDetailsData(
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
    doctor: json["doctor"] == null ? null : DoctorExtraDetailsData.fromJson(json["doctor"]),
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
    "doctor": doctor?.toJson(),
  };
}

class DoctorExtraDetailsData {
  int? doctorId;
  int? genderId;
  String? specializationIdJson;
  String? cityIdJson;
  dynamic alternateNumber;
  dynamic education;
  String? designation;
  String? image;
  dynamic dob;
  String? maritalStatus;
  dynamic address;
  int? teleConsult;
  int? videoConsult;
  int? offlineConsult;
  DateTime? createdAt;
  DateTime? updatedAt;

  DoctorExtraDetailsData({
    this.doctorId,
    this.genderId,
    this.specializationIdJson,
    this.cityIdJson,
    this.alternateNumber,
    this.education,
    this.designation,
    this.image,
    this.dob,
    this.maritalStatus,
    this.address,
    this.teleConsult,
    this.videoConsult,
    this.offlineConsult,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorExtraDetailsData.fromJson(Map<String, dynamic> json) => DoctorExtraDetailsData(
    doctorId: json["DoctorId"],
    genderId: json["GenderId"],
    specializationIdJson: json["SpecializationIdJson"],
    cityIdJson: json["CityIdJson"],
    alternateNumber: json["AlternateNumber"],
    education: json["Education"],
    designation: json["Designation"],
    image: json["Image"],
    dob: json["DOB"],
    maritalStatus: json["MaritalStatus"],
    address: json["Address"],
    teleConsult: json["TeleConsult"],
    videoConsult: json["VideoConsult"],
    offlineConsult: json["OfflineConsult"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "DoctorId": doctorId,
    "GenderId": genderId,
    "SpecializationIdJson": specializationIdJson,
    "CityIdJson": cityIdJson,
    "AlternateNumber": alternateNumber,
    "Education": education,
    "Designation": designation,
    "Image": image,
    "DOB": dob,
    "MaritalStatus": maritalStatus,
    "Address": address,
    "TeleConsult": teleConsult,
    "VideoConsult": videoConsult,
    "OfflineConsult": offlineConsult,
    "CreatedAt": createdAt?.toIso8601String(),
    "UpdatedAt": updatedAt?.toIso8601String(),
  };
}
