import '../../../../helper/base_urls.dart';

Uri convertToUrl({required String path}) => Uri.parse(path);

///Authentication
Uri doctorGetOtpApi = convertToUrl(path: "${completePathUrl}otp/generate");
Uri doctorVerifyOtpApi = convertToUrl(path: "${completePathUrl}otp/verify");
