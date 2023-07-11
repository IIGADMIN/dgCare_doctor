import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/utils/styles/text_field_decorations.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';
import 'package:healthcaredoctor2050/views/doctor/views/screens/login/doctor_auth_widget.dart';
import 'package:healthcaredoctor2050/views/doctor/views/screens/login/doctor_phone_otp_screen.dart';
import 'package:healthcaredoctor2050/views/nurse/views/screens/login/nurse_auth_widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../widgets/app_widgets/app_button_view.dart';
import '../../../../../widgets/loader_dialog_view.dart';
import '../../../controllers/providers/Login/doctor_auth_provider.dart';


class DoctorPhoneAuthScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String profileType;

  const DoctorPhoneAuthScreen(
      {Key? key,
        required this.title,
        required this.imagePath,
        required this.profileType})
      : super(key: key);
  static String? phoneNumber;

  @override
  _DoctorPhoneAuthScreenState createState() => _DoctorPhoneAuthScreenState();
}

class _DoctorPhoneAuthScreenState extends State<DoctorPhoneAuthScreen> {

  bool connected = false;

  String buttonText = "Get OTP";

  String? internationalNumber;

  bool _isAcceptedTermAndConditions = false;

  TextEditingController? _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var height = screenHeight(context);
    var width = screenWidth(context);
    final authProvider = Provider.of<DoctorAuthProvider>(context, listen: false);
    var view = DoctorAuthWidgets(context: context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Center(
                child: Text(
                  "Login As ${widget.title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.boldTextStyle(),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: EdgeInsets.all(height / 20),
                width: width,
                height: height * 0.35,
                child: Image.asset(widget.imagePath),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Mobile No.",
                    helperText: "Enter Mobile No. here...",
                    border: TextFieldBorders.textFieldBorder(),
                    enabledBorder: TextFieldBorders.textFieldEnableBorder(),
                    focusedBorder: TextFieldBorders.textFieldFocusBorder(),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    setState(() {
                      internationalNumber = phone.number.toString();
                    });
                  },
                ),
              ).paddingSymmetric(horizontal: 10),
            ).paddingSymmetric(horizontal: 5),
            30.height,
            Row(
              children: [
                Checkbox(
                    activeColor: mainColor,
                    value: _isAcceptedTermAndConditions,
                    onChanged: (value) {
                      setState(() {
                        _isAcceptedTermAndConditions = value ?? false;
                      });
                    }),
                Flexible(child: view.termAndConditions())
              ],
            ),
            20.height,
            _isAcceptedTermAndConditions
                ? AppButtonView(
              buttonText: buttonText,
              onPressed: () async {
                if (_phoneController!.text.length < 10) {
                  FToast().showToast(
                      child: const Text("Mobile number should be 10 digits"));
                } else {
                  if (!mounted) return;
                  LoaderDialogView(context).showLoadingDialog();
                  await authProvider.mobileNumberVerification(
                      phoneNo: internationalNumber.toString(),
                      userType: widget.profileType);
                  if(!mounted) return;
                  LoaderDialogView(context).dismissLoadingDialog();
                  if (authProvider.mobileStatus == true) {
                    if (!mounted) return;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DoctorOtpScreen(
                                  phoneNumber:
                                  internationalNumber.toString(),
                                  userTYpe: widget.profileType,
                                )));
                  } else {
                    if(!mounted) return;
                    DoctorAuthWidgets(context: context)
                        .showWrongNumberDialog(
                        internationalNumber.toString(), widget.title);
                  }
                }
              }, context: context,
            ).paddingSymmetric(horizontal: 10)
                : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(width, height / 18)),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Please accept Terms and conditions");
                },
                child: Text(
                  "Get OTP",
                  style: boldTextStyle(color: Colors.white),
                )).paddingSymmetric(horizontal: 10),
          ],
        ),
      ),
    );
  }

}
