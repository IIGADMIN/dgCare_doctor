class NursesUpcomingConsultationModel {
    bool? status;
    String? message;
    UpcomingNurseConsultationData ? data;

    NursesUpcomingConsultationModel({
        this.status,
        this.message,
        this.data,
    });

    factory NursesUpcomingConsultationModel.fromJson(Map<String, dynamic> json) => NursesUpcomingConsultationModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UpcomingNurseConsultationData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class UpcomingNurseConsultationData {
    List<UpcomingConsultationNurseListData>? upcomingConsultation;

    UpcomingNurseConsultationData({
        this.upcomingConsultation,
    });

    factory UpcomingNurseConsultationData.fromJson(Map<String, dynamic> json) => UpcomingNurseConsultationData(
        upcomingConsultation: json["upcomingConsultation"] == null ? [] : List<UpcomingConsultationNurseListData>.from(json["upcomingConsultation"]!.map((x) => UpcomingConsultationNurseListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "upcomingConsultation": upcomingConsultation == null ? [] : List<dynamic>.from(upcomingConsultation!.map((x) => x.toJson())),
    };
}

class UpcomingConsultationNurseListData {
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
    Nurse? nurse;
    BookSchedule? bookSchedule;

    UpcomingConsultationNurseListData({
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

    factory UpcomingConsultationNurseListData.fromJson(Map<String, dynamic> json) => UpcomingConsultationNurseListData(
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
        nurse: json["nurse"] == null ? null : Nurse.fromJson(json["nurse"]),
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
        "nurse": nurse?.toJson(),
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

class Nurse {
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
    ActiveNurse? activeNurse;

    Nurse({
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

    factory Nurse.fromJson(Map<String, dynamic> json) => Nurse(
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
        activeNurse: json["active_nurse"] == null ? null : ActiveNurse.fromJson(json["active_nurse"]),
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

class ActiveNurse {
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

    ActiveNurse({
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

    factory ActiveNurse.fromJson(Map<String, dynamic> json) => ActiveNurse(
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
