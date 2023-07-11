// To parse this JSON data, do
//
//     final pharmacistHistoryModel = pharmacistHistoryModelFromJson(jsonString);

import 'dart:convert';

PharmacistHistoryModel pharmacistHistoryModelFromJson(String str) => PharmacistHistoryModel.fromJson(json.decode(str));

String pharmacistHistoryModelToJson(PharmacistHistoryModel data) => json.encode(data.toJson());

class PharmacistHistoryModel {
  bool? status;
  String? message;
  PharmacistHistoryData? data;

  PharmacistHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory PharmacistHistoryModel.fromJson(Map<String, dynamic> json) => PharmacistHistoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : PharmacistHistoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class PharmacistHistoryData {
  List<PharmacistHistoryConsultationData>? historyConsultation;

  PharmacistHistoryData({
    this.historyConsultation,
  });

  factory PharmacistHistoryData.fromJson(Map<String, dynamic> json) => PharmacistHistoryData(
    historyConsultation: json["historyConsultation"] == null ? [] : List<PharmacistHistoryConsultationData>.from(json["historyConsultation"]!.map((x) => PharmacistHistoryConsultationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "historyConsultation": historyConsultation == null ? [] : List<dynamic>.from(historyConsultation!.map((x) => x.toJson())),
  };
}

class PharmacistHistoryConsultationData {
  int? assignId;
  int? bookScheduleId;
  int? roleId;
  int? providerId;
  int? isActive;
  int? isDeleted;
  dynamic createdBy;
  DateTime? createdDateTime;
  dynamic updatedBy;
  DateTime? updatedDateTime;
  Pharmacist? pharmacist;
  BookSchedule? bookSchedule;

  PharmacistHistoryConsultationData({
    this.assignId,
    this.bookScheduleId,
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

  factory PharmacistHistoryConsultationData.fromJson(Map<String, dynamic> json) => PharmacistHistoryConsultationData(
    assignId: json["AssignId"],
    bookScheduleId: json["BookScheduleId"],
    roleId: json["RoleId"],
    providerId: json["ProviderId"],
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    pharmacist: json["pharmacist"] == null ? null : Pharmacist.fromJson(json["pharmacist"]),
    bookSchedule: json["book_schedule"] == null ? null : BookSchedule.fromJson(json["book_schedule"]),
  );

  Map<String, dynamic> toJson() => {
    "AssignId": assignId,
    "BookScheduleId": bookScheduleId,
    "RoleId": roleId,
    "ProviderId": providerId,
    "IsActive": isActive,
    "IsDeleted": isDeleted,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
    "pharmacist": pharmacist?.toJson(),
    "book_schedule": bookSchedule?.toJson(),
  };
}

class BookSchedule {
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
  String? roomId;
  int? status;
  dynamic reason;
  int? consultTypeId;
  String? transactionId;
  int? parentBookingId;
  int? isActive;
  int? isDeleted;
  int? createdBy;
  DateTime? createdDateTime;
  dynamic updatedBy;
  DateTime? updatedDateTime;
  Specialization? specialization;
  Availability? availability;
  Gender? gender;
  City? city;

  BookSchedule({
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

  factory BookSchedule.fromJson(Map<String, dynamic> json) => BookSchedule(
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
    specialization: json["specialization"] == null ? null : Specialization.fromJson(json["specialization"]),
    availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
    gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "BookScheduleId": bookScheduleId,
    "DoctorId": doctorId,
    "WebUserId": webUserId,
    "PatientFirstName": patientFirstName,
    "PatientLastName": patientLastName,
    "PatientAge": patientAge,
    "GenderId": genderId,
    "PatientPincode": patientPincode,
    "MobileNumber": mobileNumber,
    "PatientEmail": patientEmail,
    "SpecializationId": specializationId,
    "ServiceProviderAvailableId": serviceProviderAvailableId,
    "CityId": cityId,
    "HospitalId": hospitalId,
    "ScheduleDate": "${scheduleDate!.year.toString().padLeft(4, '0')}-${scheduleDate!.month.toString().padLeft(2, '0')}-${scheduleDate!.day.toString().padLeft(2, '0')}",
    "RoomId": roomId,
    "Status": status,
    "Reason": reason,
    "ConsultTypeId": consultTypeId,
    "TransactionId": transactionId,
    "ParentBookingId": parentBookingId,
    "IsActive": isActive,
    "IsDeleted": isDeleted,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
    "specialization": specialization?.toJson(),
    "availability": availability?.toJson(),
    "gender": gender?.toJson(),
    "city": city?.toJson(),
  };
}

class Availability {
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
  dynamic updatedBy;
  DateTime? updatedDateTime;

  Availability({
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

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
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

  Map<String, dynamic> toJson() => {
    "ServiceProviderAvailableId": serviceProviderAvailableId,
    "RoleId": roleId,
    "ConsultTypeId": consultTypeId,
    "ProviderId": providerId,
    "DayName": dayName,
    "StartTime": startTime,
    "EndTime": endTime,
    "IsActive": isActive,
    "IsDeleted": isDeleted,
    "SlotActive": slotActive,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
  };
}

class City {
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

  City({
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

  factory City.fromJson(Map<String, dynamic> json) => City(
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

  Map<String, dynamic> toJson() => {
    "CityId": cityId,
    "CityName": cityName,
    "BackgroundImage": backgroundImage,
    "CityAddress": cityAddress,
    "ContactNo": contactNo,
    "Latitude": latitude,
    "Longitude": longitude,
    "Colorcode": colorcode,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
    "IsActive": isActive,
    "IsDeleted": isDeleted,
  };
}

class Gender {
  int? genderId;
  String? genderName;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;
  int? isActive;
  int? isDeleted;

  Gender({
    this.genderId,
    this.genderName,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.isActive,
    this.isDeleted,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    genderId: json["GenderId"],
    genderName: json["GenderName"],
    createdBy: json["CreatedBy"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedBy: json["UpdatedBy"],
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    isActive: json["IsActive"],
    isDeleted: json["IsDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "GenderId": genderId,
    "GenderName": genderName,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
    "IsActive": isActive,
    "IsDeleted": isDeleted,
  };
}

class Specialization {
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

  Specialization({
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

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
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

  Map<String, dynamic> toJson() => {
    "SpecializationId": specializationId,
    "CityId": cityId,
    "SpecializationName": specializationName,
    "Icon": icon,
    "IsActive": isActive,
    "IsDeleted": isDeleted,
    "CreatedBy": createdBy,
    "CreatedDateTime": createdDateTime?.toIso8601String(),
    "UpdatedBy": updatedBy,
    "UpdatedDateTime": updatedDateTime?.toIso8601String(),
  };
}

class Pharmacist {
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
  ActivePharmacist? activePharmacist;

  Pharmacist({
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

  factory Pharmacist.fromJson(Map<String, dynamic> json) => Pharmacist(
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
    activePharmacist: json["active_pharmacist"] == null ? null : ActivePharmacist.fromJson(json["active_pharmacist"]),
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
    "active_pharmacist": activePharmacist?.toJson(),
  };
}

class ActivePharmacist {
  int? userId;
  int? roleId;
  int? uniqueId;
  String? firstName;
  String? lastName;
  dynamic email;
  int? mobileNumber;
  dynamic otp;
  int? deviceType;
  int? isActive;
  int? isDeleted;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivePharmacist({
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

  factory ActivePharmacist.fromJson(Map<String, dynamic> json) => ActivePharmacist(
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
