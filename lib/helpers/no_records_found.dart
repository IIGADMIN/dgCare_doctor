  import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

noRecordsFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
          "Sorry No Records Found!",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: grey, fontSize: 20,fontWeight: FontWeight.w900),
          ),
          Text(
            "Please add a service provider from below",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: grey, fontSize: 15,fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }