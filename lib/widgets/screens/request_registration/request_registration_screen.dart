import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/helpers/text_field_validators.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../helpers/api_helper.dart';
import '../../../utils/colors/colors.dart';
import '../../loader_dialog_view.dart';
import 'contact_us_model.dart';
import 'request_registration_widgets.dart';

class RequestRegistrationScreen extends StatefulWidget {
  final String contactFor;

  const RequestRegistrationScreen({Key? key, required this.contactFor})
      : super(key: key);

  @override
  State<RequestRegistrationScreen> createState() =>
      _RequestRegistrationScreenState();
}

class _RequestRegistrationScreenState extends State<RequestRegistrationScreen> {
  bool connected = false;
  var view = RequestRegistrationWidgets();
  var subTitle =
      "Submit your basic details here, we will contact you very soon for the registration.";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  var contactUsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Contact Us"),
      ),
      body: Form(
        key: contactUsKey,
        child: ListView(
          children: [
            20.height,
            view
                .titleView("Request for '${widget.contactFor} Registration'")
                .center(),
            2.height,
            view
                .subTitleView(subTitle)
                .paddingSymmetric(horizontal: 10)
                .center(),
            40.height,
            view
                .contactUsTextFieldView("First Name", firstNameController,
                    validator: (text) =>
                        TextFieldValidators(text ?? "").defaultValidator())
                .paddingSymmetric(vertical: 5, horizontal: 10),
            view
                .contactUsTextFieldView("Last Name", lastNameController,
                    validator: (text) =>
                        TextFieldValidators(text ?? "").defaultValidator())
                .paddingSymmetric(vertical: 5, horizontal: 10),
            view
                .contactUsPhoneFieldView("Mobile Number", phoneNameController,
                    validator: (text) =>
                        TextFieldValidators(text ?? "").phoneValidator())
                .paddingSymmetric(vertical: 5, horizontal: 10),
            view
                .contactUsTextFieldView("Email Address", emailNameController,
                    validator: (text) =>
                        TextFieldValidators(text ?? "").emailValidator())
                .paddingSymmetric(vertical: 5, horizontal: 10),
            view
                .contactUsTextFieldView("Designation", designationController,
                    validator: (text) =>
                        TextFieldValidators(text ?? "").defaultValidator())
                .paddingSymmetric(vertical: 5, horizontal: 10),
            40.height,
            view
                .submitButtonView(
                    onPressed: () {
                      if (contactUsKey.currentState!.validate()) {
                        submitDetails(ContactUsModel(
                            firstName: firstNameController.text.toString(),
                            lastName: lastNameController.text.toString(),
                            phone: phoneNameController.text.toString(),
                            email: emailNameController.text.toString(),
                            designation:
                                designationController.text.toString()));
                      }
                    },
                    width: width)
                .paddingSymmetric(horizontal: 10)
          ],
        ),
      ),
    );
  }

  Uri convertToUrl({required String path}) => Uri.parse(path);
  String baseUrl = "https://dev.iigtechnology.in/";
  String version = "2050healthcare_v2/";
  String api = "api/";

  submitDetails(ContactUsModel data) async {
    String completePathUrl = baseUrl + version + api;

    Uri enquaryApi =
        convertToUrl(path: completePathUrl + "service-provider/add/enquiry");

    LoaderDialogView(context).showLoadingDialog();
    var httpService = HttpRequestHelper();
    var postData = contactUsModelToJson(data);
    await httpService.httpPostRequest(enquaryApi, postData,
        (apiStatus, responseData) {
      LoaderDialogView(context).dismissLoadingDialog();

      if (apiStatus == true) {
        if (responseData['status'] == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => view.thankYouView(context),
                  fullscreenDialog: true));
        }
      }
    });
  }
}
