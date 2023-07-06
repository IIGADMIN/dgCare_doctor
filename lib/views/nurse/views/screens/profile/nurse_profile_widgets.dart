import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/utils/shapes/app_shapes.dart';
import 'package:healthcaredoctor2050/utils/sizes/app_sizes.dart';
import 'package:healthcaredoctor2050/utils/styles/text_style.dart';
import 'package:healthcaredoctor2050/views/nurse/controllers/providers/login/nurse_details_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/styles/image_style.dart';
import 'package:nb_utils/nb_utils.dart';

class NurseProfileWidgets{
  BuildContext context;
  NurseProfileWidgets({required this.context});

  Widget profileImageView(String imageUrl){
    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreenImageView(imageUrl: imageUrl,),fullscreenDialog: true)),
      child: Container(
        color: Colors.transparent,
        height: 140,
        width: 130,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: showNetworkImageWithCached(imageUrl: imageUrl, height: 150, width: 150, radius: 10),
        ),
      ),
    );
  }


  Widget userDetailsItemView(String title,String name,){
    return Card(
      shape: circularBorderShape(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: const TextStyle(fontSize: 12),),
          2.height,
          Text(name,style: AppTextStyles.boldTextStyle(),),
        ],
      ).paddingSymmetric(horizontal: 10,vertical: 10),
    ).paddingSymmetric(vertical: 5);
  }

  Widget nurseDetailsView() {
    return Consumer<NurseDetailsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          color: secondaryBgColor,
          child: ListView(
            children: [
              userDetailsItemView(
                "You first name", value.getUserFirstName, ),
              userDetailsItemView(
                "You last name", value.getUserLastName, ),
              userDetailsItemView(
                "Your mobile number", value.getUserPhoneNo, ),
              // userDetailsItemView(
              //     "Your designation", value.get_server_designation, ),
              userDetailsItemView(
                "Your education", value.getUserEducation, ),
              // userDetailsItemView(
              //     "Organization name", "value.get_server_education", ),
            ],
          ),
        ).paddingOnly(top: 100);
      },
    );
  }

}

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  const FullScreenImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Profile Picture"),
      ),
      body: showNetworkImageWithCached(imageUrl: imageUrl, height: screenHeight(context), width: screenWidth(context), radius: 0),
    );
  }
}