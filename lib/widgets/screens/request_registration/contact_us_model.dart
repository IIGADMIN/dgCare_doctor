import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) => ContactUsModel.fromJson(json.decode(str));

Map<String, dynamic> contactUsModelToJson(ContactUsModel data) => data.toJson();

class ContactUsModel {
  ContactUsModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.designation,
  });

  String firstName;
  String lastName;
  String phone;
  String email;
  String designation;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    phone: json["MobileNumber"],
    email: json["Email"],
    designation: json["Designation"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "MobileNumber": phone,
    "Email": email,
    "Designation": designation,
  };
}
