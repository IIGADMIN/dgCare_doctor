import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';

Widget appBar(BuildContext context, ColorAnimated colorAnimated) {
  return AppBar(
    backgroundColor: colorAnimated.background,
    elevation: 0,
    title: Text(
      "AppBar Animate",
      style: TextStyle(
        color: colorAnimated.color,
      ),
    ),
    leading: Icon(
      Icons.arrow_back_ios_new_rounded,
      color: colorAnimated.color,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: colorAnimated.color,
        ),
      ),
    ],
  );
}
