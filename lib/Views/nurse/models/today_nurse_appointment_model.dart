import 'dart:convert';

TodayNurseAppointmentModel todayNurseAppointmentModelFromJson(String str) => TodayNurseAppointmentModel.fromJson(json.decode(str));


class TodayNurseAppointmentModel {
  bool? status;
  String? message;
  Data? data;

  TodayNurseAppointmentModel({
    this.status,
    this.message,
    this.data,
  });

  factory TodayNurseAppointmentModel.fromJson(Map<String, dynamic> json) => TodayNurseAppointmentModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  List<TodayNurseConsultationData>? todayConsultation;

  Data({
    this.todayConsultation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    todayConsultation: json["todayConsultation"] == null ? [] : List<TodayNurseConsultationData>.from(json["todayConsultation"]!.map((x) => TodayNurseConsultationData.fromJson(x))),
  );

}

class TodayNurseConsultationData {
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
  TodayAppointmentNurseData? nurse;
  TodayNurseBookScheduleData? bookSchedule;

  TodayNurseConsultationData({
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
    this.nurse,
    this.bookSchedule,
  });

  factory TodayNurseConsultationData.fromJson(Map<String, dynamic> json) => TodayNurseConsultationData(
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
    nurse: json["nurse"] == null ? null : TodayAppointmentNurseData.fromJson(json["nurse"]),
    bookSchedule: json["book_schedule"] == null ? null : TodayNurseBookScheduleData.fromJson(json["book_schedule"]),
  );

}

class TodayNurseBookScheduleData {
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
  TodayNurseSpecializationData? specialization;
  TodayNurseAvailabilityData? availability;
  TodayNurseGenderData? gender;
  TodayNurseCityData? city;

  TodayNurseBookScheduleData({
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

  factory TodayNurseBookScheduleData.fromJson(Map<String, dynamic> json) => TodayNurseBookScheduleData(
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
    specialization: json["specialization"] == null ? null : TodayNurseSpecializationData.fromJson(json["specialization"]),
    availability: json["availability"] == null ? null : TodayNurseAvailabilityData.fromJson(json["availability"]),
    gender: json["gender"] == null ? null : TodayNurseGenderData.fromJson(json["gender"]),
    city: json["city"] == null ? null : TodayNurseCityData.fromJson(json["city"]),
  );

}

class TodayNurseAvailabilityData {
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

  TodayNurseAvailabilityData({
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

  factory TodayNurseAvailabilityData.fromJson(Map<String, dynamic> json) => TodayNurseAvailabilityData(
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

class TodayNurseCityData {
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

  TodayNurseCityData({
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

  factory TodayNurseCityData.fromJson(Map<String, dynamic> json) => TodayNurseCityData(
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

class TodayNurseGenderData {
  int? genderId;
  String? genderName;
  int? createdBy;
  DateTime? createdDateTime;
  int? updatedBy;
  DateTime? updatedDateTime;
  int? isActive;
  int? isDeleted;

  TodayNurseGenderData({
    this.genderId,
    this.genderName,
    this.createdBy,
    this.createdDateTime,
    this.updatedBy,
    this.updatedDateTime,
    this.isActive,
    this.isDeleted,
  });

  factory TodayNurseGenderData.fromJson(Map<String, dynamic> json) => TodayNurseGenderData(
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

class TodayNurseSpecializationData {
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

  TodayNurseSpecializationData({
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

  factory TodayNurseSpecializationData.fromJson(Map<String, dynamic> json) => TodayNurseSpecializationData(
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

class TodayAppointmentNurseData {
  int? nurseId;
  int? organisationId;
  String? aadhaarNumber;
  int? alternateNumber;
  dynamic profilePhoto;
  DateTime? dob;
  int? genderId;
  String? maritalStatus;
  String? highestQualification;
  int? cityId;
  String? address;
  int? pincode;
  String? languageIdJson;
  DateTime? createdDateTime;
  DateTime? updatedDateTime;
  TodayAppointmentActiveNurseData? activeNurse;

  TodayAppointmentNurseData({
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

  factory TodayAppointmentNurseData.fromJson(Map<String, dynamic> json) => TodayAppointmentNurseData(
    nurseId: json["NurseId"],
    organisationId: json["OrganisationId"],
    aadhaarNumber: json["AadhaarNumber"],
    alternateNumber: json["AlternateNumber"],
    profilePhoto: json["ProfilePhoto"],
    dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
    genderId: json["GenderId"],
    maritalStatus: json["MaritalStatus"],
    highestQualification: json["HighestQualification"],
    cityId: json["CityId"],
    address: json["Address"],
    pincode: json["Pincode"],
    languageIdJson: json["LanguageIdJson"],
    createdDateTime: json["CreatedDateTime"] == null ? null : DateTime.parse(json["CreatedDateTime"]),
    updatedDateTime: json["UpdatedDateTime"] == null ? null : DateTime.parse(json["UpdatedDateTime"]),
    activeNurse: json["active_nurse"] == null ? null : TodayAppointmentActiveNurseData.fromJson(json["active_nurse"]),
  );

}

class TodayAppointmentActiveNurseData {
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
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  TodayAppointmentActiveNurseData({
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

  factory TodayAppointmentActiveNurseData.fromJson(Map<String, dynamic> json) => TodayAppointmentActiveNurseData(
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

}
