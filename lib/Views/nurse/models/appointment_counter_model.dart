// To parse this JSON data, do
//
//     final appointmentCounterModel = appointmentCounterModelFromJson(jsonString);

import 'dart:convert';

AppointmentCounterModel appointmentCounterModelFromJson(String str) => AppointmentCounterModel.fromJson(json.decode(str));

String appointmentCounterModelToJson(AppointmentCounterModel data) => json.encode(data.toJson());

class AppointmentCounterModel {
  bool? status;
  String? message;
  AppointmentCounterData? data;

  AppointmentCounterModel({
    this.status,
    this.message,
    this.data,
  });

  factory AppointmentCounterModel.fromJson(Map<String, dynamic> json) => AppointmentCounterModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : AppointmentCounterData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class AppointmentCounterData {
  int? todayVideoConsultCount;
  int? upcomingVideoConsultCount;
  int? todayTeleConsultCount;
  int? upcomingTeleConsultCount;
  int? todayOfflineConsultCount;
  int? upcomingOfflineConsultCount;

  AppointmentCounterData({
    this.todayVideoConsultCount,
    this.upcomingVideoConsultCount,
    this.todayTeleConsultCount,
    this.upcomingTeleConsultCount,
    this.todayOfflineConsultCount,
    this.upcomingOfflineConsultCount,
  });

  factory AppointmentCounterData.fromJson(Map<String, dynamic> json) => AppointmentCounterData(
    todayVideoConsultCount: json["todayVideoConsultCount"],
    upcomingVideoConsultCount: json["upcomingVideoConsultCount"],
    todayTeleConsultCount: json["todayTeleConsultCount"],
    upcomingTeleConsultCount: json["upcomingTeleConsultCount"],
    todayOfflineConsultCount: json["todayOfflineConsultCount"],
    upcomingOfflineConsultCount: json["upcomingOfflineConsultCount"],
  );

  Map<String, dynamic> toJson() => {
    "todayVideoConsultCount": todayVideoConsultCount,
    "upcomingVideoConsultCount": upcomingVideoConsultCount,
    "todayTeleConsultCount": todayTeleConsultCount,
    "upcomingTeleConsultCount": upcomingTeleConsultCount,
    "todayOfflineConsultCount": todayOfflineConsultCount,
    "upcomingOfflineConsultCount": upcomingOfflineConsultCount,
  };
}
