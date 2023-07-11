import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/views/pharmacist/controllers/providers/pharmacist_auth_provider.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/home/pharmacist_home_screen.dart';
import 'package:healthcaredoctor2050/widgets/loader_dialog_view.dart';
import 'package:pinput/pinput.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/sizes/app_sizes.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PharmacistPhoneOTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String userTYpe;

  const PharmacistPhoneOTPVerificationScreen({super.key, required this.phoneNumber, required this.userTYpe});

  @override
  State<PharmacistPhoneOTPVerificationScreen> createState() => _PharmacistPhoneOTPVerificationScreenState();
}

class _PharmacistPhoneOTPVerificationScreenState extends State<PharmacistPhoneOTPVerificationScreen> {

  String currentOTP = '';
  String appSignature = '';
  bool showResendOtpButton = false;

  int secondsRemaining = 60;

  @override
  Widget build(BuildContext context) {

    var height = screenHeight(context);
    var width = screenWidth(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: height / 10,
          ),
          Image.asset(
            "assets/images/otp.gif",
            height: height / 2,
            width: width,
          ),
          10.height,
          Center(
              child: Text(
                  "We have sent 6 digit OTP on ${widget.phoneNumber}.")),
          _pinView(),
          30.height,
          buildResendOTPView(showResendOtpButton == true
              ? InkWell(
            onTap: () {
              setState(() {
                showResendOtpButton = false;
              });
              resendOtp();
            },
            child: Text(" Resend",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Ubuntu')),
          )
              : _showCountDownView()),
        ],
      ),
    );
  }

  final pinController = TextEditingController();
  final focusNode = FocusNode();

  Widget _pinView() {
    return Pinput(
      closeKeyboardWhenCompleted: true,
      length: 6,
      controller: pinController,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      validator: (value) {
        return null;
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onChanged: (value) {
        if (value.length == 6) {
          submitOtp(value);
        }
      },
    ).paddingSymmetric(horizontal: 20, vertical: 20);
  }

  Widget buildResendOTPView(Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Did not receive an otp?",
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w200,
                fontSize: 16,
                fontFamily: 'Ubuntu')),
        10.width,
        child
      ],
    );
  }

  submitOtp(String code) async {
    LoaderDialogView(context).showLoadingDialog();
    var authProvider = Provider.of<PharmacistAuthProvider>(context, listen: false);
    await authProvider
        .otpVerification(context,
        otp: code, mobileNo: widget.phoneNumber, userType: widget.userTYpe);
    if(!mounted) return;
    LoaderDialogView(context).dismissLoadingDialog();
    if (authProvider.otpStatus == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PharmacistHomeScreen()));
    } else {
      Fluttertoast.showToast(msg: "OTP is not matched !!!");
    }
  }

  _showCountDownView() {
    return Countdown(
      controller: CountdownController(autoStart: true),
      seconds: 60,
      build: (BuildContext context, double time) => Text(
        "$time s",
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      onFinished: () {
        setState(() {
          showResendOtpButton = true;
        });
      },
    );
  }

  resendOtp() async {
    var authProvider = Provider.of<PharmacistAuthProvider>(context, listen: false);
    await authProvider.mobileNumberVerification(
        phoneNo: widget.phoneNumber.toString(), userType: widget.userTYpe);
    if (authProvider.mobileStatus == true) {
      Fluttertoast.showToast(msg: "OTP Resent");
    } else {
      Fluttertoast.showToast(msg:"Mobile Insert failed");
    }
  }

}
