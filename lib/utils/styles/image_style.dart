

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

Widget showNetworkImageWithCached({required String imageUrl, required double height, required double width, required double radius,BoxFit? fit = BoxFit.cover,}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: fit,
      errorWidget: (c, a, b) {
        return imageErrorView(height, width, radius);
      },
      placeholder: (c, s) {
        return imagePlaceHolderView(height, width, radius);
      },
    ),
  );
}

Widget imageErrorView(double height,double width,double radius){
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.4),
        borderRadius: BorderRadius.circular(radius)),
    child: const Center(
      child: Icon(
        Icons.broken_image_outlined,
      ),
    ),
  );
}

Widget imagePlaceHolderView(double height,double width,double radius){
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(radius)),
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: mainColor,
      ),
    ),
  );
}
