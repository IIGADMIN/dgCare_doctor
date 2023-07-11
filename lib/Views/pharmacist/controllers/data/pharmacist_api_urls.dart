String baseUrl="https://dev.iigtechnology.in/";
String version="2050healthcare_v2/";
String api= "api/";
String completePathUrl=baseUrl+version+api;

Uri convertToUrl({required String path}) => Uri.parse(path);

/// image
String pharmacistImageUrl = "$baseUrl$version/public/2050/Images/Provider/Pharmacist/";

///Authentication
Uri pharmacistGetOtpApi = convertToUrl(path: "${completePathUrl}otp/generate");
Uri pharmacistVerifyOtpApi = convertToUrl(path: "${completePathUrl}otp/verify");
Uri appointmentCounterApi = convertToUrl(path: "${completePathUrl}service-provider/consultation/count");
/// today pharmacist appointments
Uri todayPharmacistAppointmentsApi(String consultationTypeId) => convertToUrl(
    path: "${completePathUrl}service-provider/consultation/today?ConsultTypeId=$consultationTypeId");
Uri upcomingPharmacistConsultationApi(String consultationTypeId) => convertToUrl(path: "${completePathUrl}service-provider/consultation/upcoming?ConsultTypeId=$consultationTypeId");
Uri historyPharmacistConsultationApi(String consultTypeId) => convertToUrl(path: "${completePathUrl}service-provider/consultation/history?ConsultTypeId=$consultTypeId");
/// meeting
String getPharmacistMeetingToken = "https://prod-in2.100ms.live/hmsapi/2050healthcare.app.100ms.live/api/token";
// https://prod-in2.100ms.live/hmsapi/2050healthcare.app.100ms.live/