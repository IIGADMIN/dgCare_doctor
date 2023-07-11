String baseUrl="https://dev.iigtechnology.in/";
String version="2050healthcare_v2/";
String api= "api/";
String completePathUrl=baseUrl+version+api;

Uri convertToUrl({required String path}) => Uri.parse(path);

/// image
String nurseImageUrl = "$baseUrl$version/public/2050/Images/Provider/Nurse/";

///Authentication
Uri nurseGetOtpApi = convertToUrl(path: "${completePathUrl}otp/generate");
Uri nurseVerifyOtpApi = convertToUrl(path: "${completePathUrl}otp/verify");
Uri appointmentCounterApi = convertToUrl(path: "${completePathUrl}service-provider/consultation/count");
/// today nurse appointments
Uri todayNurseAppointmentsApi(String consultationTypeId) => convertToUrl(
    path: "${completePathUrl}service-provider/consultation/today?ConsultTypeId=$consultationTypeId");
Uri upcomingNurseConsultationApi(String consultationTypeId) => convertToUrl(path: "${completePathUrl}service-provider/consultation/upcoming?ConsultTypeId=$consultationTypeId");
Uri historyNurseConsultationApi(String consultTypeId) => convertToUrl(path: "${completePathUrl}service-provider/consultation/history?ConsultTypeId=$consultTypeId");

/// meeting
String getNurseMeetingToken = "https://prod-in2.100ms.live/hmsapi/2050healthcare.app.100ms.live/api/token";
// https://prod-in2.100ms.live/hmsapi/2050healthcare.app.100ms.live/