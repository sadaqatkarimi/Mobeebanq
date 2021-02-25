import 'package:flutter/material.dart';
import 'package:mobeebanq/views/OTP.dart';
import 'package:mobeebanq/views/phoneVerification.dart';
import 'package:mobeebanq/views/splash.dart';
import 'package:mobeebanq/views/walkthrough.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  "/walkthrough": (BuildContext context) => WalkThrough(),
  "/phoneVerify": (BuildContext context) => phoneVerification(),
  // "/otpScreen": (BuildContext context) => otpScreen(),


};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobeebanq',
      theme: ThemeData(
        fontFamily: "montserrat",
        appBarTheme: AppBarTheme(color: basicColor,centerTitle: true,elevation: 0),
        backgroundColor: Colors.white,
        primaryColor: basicColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashScreen(),
      routes: routes,
    );
  }
}

