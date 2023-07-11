// To parse this JSON data, do
//
//     final meetingTokenModel = meetingTokenModelFromJson(jsonString);

import 'dart:convert';

MeetingTokenModel meetingTokenModelFromJson(String str) => MeetingTokenModel.fromJson(json.decode(str));

String meetingTokenModelToJson(MeetingTokenModel data) => json.encode(data.toJson());

class MeetingTokenModel {
  MeetingTokenModel({
    this.token,
    this.msg,
    this.status,
    this.success,
    this.apiVersion,
  });

  String? token;
  String? msg;
  int? status;
  bool? success;
  String? apiVersion;

  factory MeetingTokenModel.fromJson(Map<String, dynamic> json) => MeetingTokenModel(
    token: json["token"],
    msg: json["msg"],
    status: json["status"],
    success: json["success"],
    apiVersion: json["api_version"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "msg": msg,
    "status": status,
    "success": success,
    "api_version": apiVersion,
  };
}
