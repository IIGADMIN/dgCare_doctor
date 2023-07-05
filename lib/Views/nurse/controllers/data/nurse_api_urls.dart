

import '../../../../helper/base_urls.dart';

Uri convertToUrl({required String path}) => Uri.parse(path);

///Authentication
Uri nurseGetOtpApi = convertToUrl(path: "${completePathUrl}otp/generate");
Uri nurseVerifyOtpApi = convertToUrl(path: "${completePathUrl}otp/verify");