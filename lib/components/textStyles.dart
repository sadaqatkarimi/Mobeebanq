import 'package:flutter/material.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/size_config.dart';



class CustomTextStyle {

  static TextStyle normal1(BuildContext context) {
    return TextStyle(
        color: basicColor,
        fontSize: SizeConfig.defaultSize,
        fontWeight: FontWeight.w500);
  }


  static TextStyle title(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600);
  }

}


