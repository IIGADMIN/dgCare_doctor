import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/login/pharmacist_auth_widgets.dart';
import 'package:healthcaredoctor2050/views/pharmacist/views/screens/login/pharmacist_phone_otp_verification_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/styles/text_field_decorations.dart';
import '../../../../../utils/styles/text_style.dart';
import '../../../../../widgets/app_widgets/app_button_view.dart';
import '../../../../../widgets/loader_dialog_view.dart';
import '../../../controllers/providers/pharmacist_auth_provider.dart';
import 'package:nb_utils/nb_utils.dart';

class PharmacistPhoneAuthScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String profileType;

  const PharmacistPhoneAuthScreen({super.key, required this.title, required this.imagePath, required this.profileType});

  @override
  State<PharmacistPhoneAuthScreen> createState() => _PharmacistPhoneAuthScreenState();
}

class _PharmacistPhoneAuthScreenState extends State<PharmacistPhoneAuthScreen> {

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
    final authProvider = Provider.of<PharmacistAuthProvider>(context, listen: false);
    var view = PharmacistAuthWidgets(context: context);

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
                                PharmacistPhoneOTPVerificationScreen(
                                  phoneNumber:
                                  internationalNumber.toString(),
                                  userTYpe: widget.profileType,
                                )));
                  } else {
                    if(!mounted) return;
                    PharmacistAuthWidgets(context: context)
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
