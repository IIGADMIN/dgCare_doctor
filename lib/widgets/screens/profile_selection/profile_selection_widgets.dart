import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/colors/colors.dart';



profileSelectionItemView(BuildContext context,
    {required double height,
    required double width,
    required String imagePath,
    required String title,
      void Function()? onTap,
    }) {
  return InkWell(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),side: BorderSide(width: 1,color: iconColor)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(height / 10),
            height: height,
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Image.asset(
              imagePath,
              //fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height / 5,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.transparent.withOpacity(.3),
                          Colors.transparent.withOpacity(.2),
                          Colors.transparent.withOpacity(0)
                        ])),
                child: Center(
                  child: Text(
                    title,
                    style: boldTextStyle(color: textColor, size: 20),
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}

profileSelectionTitle(String title) => Text(
      title,
      style: boldTextStyle(color: textColor, size: 24),
    );

profileSelectionSubTitle(String title) => Text(
      title,
      style: const TextStyle(color: Colors.grey, fontSize: 14),
    );
