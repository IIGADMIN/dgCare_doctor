// To parse this JSON data, do
//
//     final todayPharmacistAppointmentModel = todayPharmacistAppointmentModelFromJson(jsonString);

import 'dart:convert';

TodayPharmacistAppointmentModel todayPharmacistAppointmentModelFromJson(String str) => TodayPharmacistAppointmentModel.fromJson(json.decode(str));

class TodayPharmacistAppointmentModel {
  bool? status;
  String? message;
  Data? data;

  TodayPharmacistAppointmentModel({
    this.status,
    this.message,
    this.data,
  });

  factory TodayPharmacistAppointmentModel.fromJson(Map<String, dynamic> json) => TodayPharmacistAppointmentModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  List<PharmacistTodayConsultationData>? todayConsultation;

  Data({
    this.todayConsultation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    todayConsultation: json["todayConsultation"] == null ? [] : List<PharmacistTodayConsultationData>.from(json["todayConsultation"]!.map((x) => PharmacistTodayConsultationData.fromJson(x))),
  );
}

class PharmacistTodayConsultationData {
  int? assignId;
  int? bookScheduleId;
  int? serviceProviderAvailableId;
  int? roleId;
  int? providerId;
  int? isActive;
  int? isDeleted;
  dynamic createdBy;
  DateTime? createdDateTime;
  dynamic updatedBy;
  DateTime? updatedDateTime;
  TodayAppointmentPharmacistData? pharmacist;
  PharmacistBookScheduleData? bookSchedule;

  PharmacistTodayConsultationData({
    this.assignId,
    this.bookScheduleId,
    this.serviceProviderAvailableId,
    this.roleId,
    this.providerId,
    this.isActive,
    this.isDeleted,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.pharmacist,
    this.bookSchedule,
  });

  factory PharmacistTodayConsultationData.fromJson(Map<String, dynamic> json) => PharmacistTodayConsultationData(
    assignId: json["AssignId"],
    bookScheduleId: json["BookScheduleId"],
    serviceProviderAvailableId: json["ServiceProviderAvailableId"],
    roleId: json["RoleId"],
    providerId: json["ProviderId"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    pharmacist: json["pharmacist"] == null ? null : TodayAppointmentPharmacistData.fromJson(json["pharmacist"]),
    bookSchedule: json["book_schedule"] == null ? null : PharmacistBookScheduleData.fromJson(json["book_schedule"]),
  );

}

class PharmacistBookScheduleData {
  int? bookScheduleId;
  int? doctorId;
  int? webUserId;
  String? patientFirstName;
  String? patientLastName;
  int? patientAge;
  int? genderId;
  int? patientPincode;
  int? mobileNumber;
  dynamic patientEmail;
  int? specializationId;
  int? serviceProviderAvailableId;
  int? cityId;
  dynamic hospitalId;
  DateTime? scheduleDate;
  dynamic roomId;
  int? status;
  dynamic reason;
  int? consultTypeId;
  String? transactionId;
  int? parentBookingId;
  int? isActive;
  int? isDeleted;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;
  PharmacistSpecializationData? specialization;
  PharmacistAvailabilityData? availability;
  PharmacistGenderData? gender;
  PharmacistCityData? city;

  PharmacistBookScheduleData({
    this.bookScheduleId,
    this.doctorId,
    this.webUserId,
    this.patientFirstName,
    this.patientLastName,
    this.patientAge,
    this.genderId,
    this.patientPincode,
    this.mobileNumber,
    this.patientEmail,
    this.specializationId,
    this.serviceProviderAvailableId,
    this.cityId,
    this.hospitalId,
    this.scheduleDate,
    this.roomId,
    this.status,
    this.reason,
    this.consultTypeId,
    this.transactionId,
    this.parentBookingId,
    this.isActive,
    this.isDeleted,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.specialization,
    this.availability,
    this.gender,
    this.city,
  });

  factory PharmacistBookScheduleData.fromJson(Map<String, dynamic> json) => PharmacistBookScheduleData(
    bookScheduleId: json["BookScheduleId"],
    doctorId: json["DoctorId"],
    webUserId: json["WebUserId"],
    patientFirstName: json["PatientFirstName"],
    patientLastName: json["PatientLastName"],
    patientAge: json["PatientAge"],
    genderId: json["GenderId"],
    patientPincode: json["PatientPincode"],
    mobileNumber: json["MobileNumber"],
    patientEmail: json["PatientEmail"],
    specializationId: json["SpecializationId"],
    serviceProviderAvailableId: json["ServiceProviderAvailableId"],
    cityId: json["CityId"],
    hospitalId: json["HospitalId"],
    scheduleDate: json["ScheduleDate"] == null ? null : DateTime.parse(json["ScheduleDate"]),
    roomId: json["RoomId"],
    status: json["Status"],
    reason: json["Reason"],
    consultTypeId: json["ConsultTypeId"],
    transactionId: json["TransactionId"],
    parentBookingId: json["ParentBookingId"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    specialization: json["specialization"] == null ? null : PharmacistSpecializationData.fromJson(json["specialization"]),
    availability: json["availability"] == null ? null : PharmacistAvailabilityData.fromJson(json["availability"]),
    gender: json["gender"] == null ? null : PharmacistGenderData.fromJson(json["gender"]),
    city: json["city"] == null ? null : PharmacistCityData.fromJson(json["city"]),
  );

}

class PharmacistAvailabilityData {
  int? serviceProviderAvailableId;
  int? roleId;
  int? consultTypeId;
  int? providerId;
  String? dayName;
  String? startTime;
  String? endTime;
  int? isActive;
  int? isDeleted;
  int? slotActive;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;

  PharmacistAvailabilityData({
    this.serviceProviderAvailableId,
    this.roleId,
    this.consultTypeId,
    this.providerId,
    this.dayName,
    this.startTime,
    this.endTime,
    this.isActive,
    this.isDeleted,
    this.slotActive,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
  });

  factory PharmacistAvailabilityData.fromJson(Map<String, dynamic> json) => PharmacistAvailabilityData(
    serviceProviderAvailableId: json["ServiceProviderAvailableId"],
    roleId: json["RoleId"],
    consultTypeId: json["ConsultTypeId"],
    providerId: json["ProviderId"],
    dayName: json["DayName"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    slotActive: json["SlotActive"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
  );

}

class PharmacistCityData {
  int? cityId;
  String? cityName;
  String? backgroundImage;
  String? cityAddress;
  String? contactNo;
  String? latitude;
  String? longitude;
  String? colorcode;
  int? createdBy;
  DateTime? createdDateTime;
  dynamic updatedBy;
  DateTime? updatedDateTime;
  int? isActive;
  int? isDeleted;

  PharmacistCityData({
    this.cityId,
    this.cityName,
    this.backgroundImage,
    this.cityAddress,
    this.contactNo,
    this.latitude,
    this.longitude,
    this.colorcode,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.isActive,
    this.isDeleted,
  });

  factory PharmacistCityData.fromJson(Map<String, dynamic> json) => PharmacistCityData(
    cityId: json["CityId"],
    cityName: json["CityName"],
    backgroundImage: json["BackgroundImage"],
    cityAddress: json["CityAddress"],
    contactNo: json["ContactNo"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    colorcode: json["Colorcode"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
  );

}

class PharmacistGenderData {
  int? genderId;
  String? genderName;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;
  int? isActive;
  int? isDeleted;

  PharmacistGenderData({
    this.genderId,
    this.genderName,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.isActive,
    this.isDeleted,
  });

  factory PharmacistGenderData.fromJson(Map<String, dynamic> json) => PharmacistGenderData(
    genderId: json["GenderId"],
    genderName: json["GenderName"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
  );

}

class PharmacistSpecializationData {
  int? specializationId;
  String? cityId;
  String? specializationName;
  String? icon;
  int? isActive;
  int? isDeleted;
  int? createdBy;
  DateTime? createdDateTime;
  dynamic updatedBy;
  DateTime? updatedDateTime;

  PharmacistSpecializationData({
    this.specializationId,
    this.cityId,
    this.specializationName,
    this.icon,
    this.isActive,
    this.isDeleted,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
  });

  factory PharmacistSpecializationData.fromJson(Map<String, dynamic> json) => PharmacistSpecializationData(
    specializationId: json["SpecializationId"],
    cityId: json["CityId"],
    specializationName: json["SpecializationName"],
    icon: json["Icon"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
  );

}

class TodayAppointmentPharmacistData {
  int? pharmacistId;
  int? organisationId;
  int? genderId;
  int? cityId;
  String? languageIdJson;
  String? aadhaarNumber;
  int? alternateNumber;
  dynamic profilePhoto;
  DateTime? dob;
  String? maritalStatus;
  String? highestQualification;
  String? address;
  int? pincode;
  DateTime? createdDateTime;
  DateTime? updatedDateTime;
  TodayAppointmentActivePharmacistData? activePharmacist;

  TodayAppointmentPharmacistData({
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
    this.activePharmacist,
  });

  factory TodayAppointmentPharmacistData.fromJson(Map<String, dynamic> json) => TodayAppointmentPharmacistData(
    pharmacistId: json["PharmacistId"],
    organisationId: json["OrganisationId"],
    genderId: json["GenderId"],
    cityId: json["CityId"],
    languageIdJson: json["LanguageIdJson"],
    aadhaarNumber: json["AadhaarNumber"],
    alternateNumber: json["AlternateNumber"],
    profilePhoto: json["ProfilePhoto"],
    dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
    maritalStatus: json["MaritalStatus"],
    highestQualification: json["HighestQualification"],
    address: json["Address"],
    pincode: json["Pincode"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    activePharmacist: json["active_pharmacist"] == null ? null : TodayAppointmentActivePharmacistData.fromJson(json["active_pharmacist"]),
  );

}

class TodayAppointmentActivePharmacistData {
  int? userId;
  int? roleId;
  int? uniqueId;
  String? firstName;
  String? lastName;
  String? email;
  int? mobileNumber;
  dynamic otp;
  int? deviceType;
  int? isActive;
  int? isDeleted;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  TodayAppointmentActivePharmacistData({
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
  });

  factory TodayAppointmentActivePharmacistData.fromJson(Map<String, dynamic> json) => TodayAppointmentActivePharmacistData(
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
  };
}
