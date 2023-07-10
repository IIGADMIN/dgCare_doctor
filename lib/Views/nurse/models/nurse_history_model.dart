// To parse this JSON data, do
//
//     final nurseHistoryModel = nurseHistoryModelFromJson(jsonString);

import 'dart:convert';

NurseHistoryModel nurseHistoryModelFromJson(String str) => NurseHistoryModel.fromJson(json.decode(str));

String nurseHistoryModelToJson(NurseHistoryModel data) => json.encode(data.toJson());

class NurseHistoryModel {
  bool? status;
  String? message;
  NurseHistoryData? data;

  NurseHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory NurseHistoryModel.fromJson(Map<String, dynamic> json) => NurseHistoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : NurseHistoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class NurseHistoryData {
  List<NurseHistoryConsultationData>? historyConsultation;

  NurseHistoryData({
    this.historyConsultation,
  });

  factory NurseHistoryData.fromJson(Map<String, dynamic> json) => NurseHistoryData(
    historyConsultation: json["historyConsultation"] == null ? [] : List<NurseHistoryConsultationData>.from(json["historyConsultation"]!.map((x) => NurseHistoryConsultationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "historyConsultation": historyConsultation == null ? [] : List<dynamic>.from(historyConsultation!.map((x) => x.toJson())),
  };
}

class NurseHistoryConsultationData {
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
  NurseDetailsHistoryData? nurse;
  NurseHistoryBookSchedule? bookSchedule;

  NurseHistoryConsultationData({
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
    this.nurse,
    this.bookSchedule,
  });

  factory NurseHistoryConsultationData.fromJson(Map<String, dynamic> json) => NurseHistoryConsultationData(
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
    nurse: json["nurse"] == null ? null : NurseDetailsHistoryData.fromJson(json["nurse"]),
    bookSchedule: json["book_schedule"] == null ? null : NurseHistoryBookSchedule.fromJson(json["book_schedule"]),
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
    "nurse": nurse?.toJson(),
    "book_schedule": bookSchedule?.toJson(),
  };
}

class NurseHistoryBookSchedule {
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
  NurseHistorySpecializationData? specialization;
  NurseHistoryAvailabilityData? availability;
  NurseHistoryGenderData? gender;
  NurseHistoryCityData? city;

  NurseHistoryBookSchedule({
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

  factory NurseHistoryBookSchedule.fromJson(Map<String, dynamic> json) => NurseHistoryBookSchedule(
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
    specialization: json["specialization"] == null ? null : NurseHistorySpecializationData.fromJson(json["specialization"]),
    availability: json["availability"] == null ? null : NurseHistoryAvailabilityData.fromJson(json["availability"]),
    gender: json["gender"] == null ? null : NurseHistoryGenderData.fromJson(json["gender"]),
    city: json["city"] == null ? null : NurseHistoryCityData.fromJson(json["city"]),
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

class NurseHistoryAvailabilityData {
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

  NurseHistoryAvailabilityData({
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

  factory NurseHistoryAvailabilityData.fromJson(Map<String, dynamic> json) => NurseHistoryAvailabilityData(
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

class NurseHistoryCityData {
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

  NurseHistoryCityData({
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

  factory NurseHistoryCityData.fromJson(Map<String, dynamic> json) => NurseHistoryCityData(
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

class NurseHistoryGenderData {
  int? genderId;
  String? genderName;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;
  int? isActive;
  int? isDeleted;

  NurseHistoryGenderData({
    this.genderId,
    this.genderName,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.isActive,
    this.isDeleted,
  });

  factory NurseHistoryGenderData.fromJson(Map<String, dynamic> json) => NurseHistoryGenderData(
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

class NurseHistorySpecializationData {
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

  NurseHistorySpecializationData({
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

  factory NurseHistorySpecializationData.fromJson(Map<String, dynamic> json) => NurseHistorySpecializationData(
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

class NurseDetailsHistoryData {
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
  ActiveNurseDetailsHistoryData? activeNurse;

  NurseDetailsHistoryData({
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
    this.activeNurse,
  });

  factory NurseDetailsHistoryData.fromJson(Map<String, dynamic> json) => NurseDetailsHistoryData(
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
    activeNurse: json["active_nurse"] == null ? null : ActiveNurseDetailsHistoryData.fromJson(json["active_nurse"]),
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
    "active_nurse": activeNurse?.toJson(),
  };
}

class ActiveNurseDetailsHistoryData {
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

  ActiveNurseDetailsHistoryData({
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

  factory ActiveNurseDetailsHistoryData.fromJson(Map<String, dynamic> json) => ActiveNurseDetailsHistoryData(
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
