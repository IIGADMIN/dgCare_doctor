String baseUrl="https://dev.iigtechnology.in/";
String version="2050healthcare_v2/";
String api= "api/";
String completePathUrl=baseUrl+version+api;

Uri convertToUrl({required String path}) => Uri.parse(path);

///Authentication
Uri nurseGetOtpApi = convertToUrl(path: "${completePathUrl}otp/generate");
Uri nurseVerifyOtpApi = convertToUrl(path: "${completePathUrl}otp/verify");