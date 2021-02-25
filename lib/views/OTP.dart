import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:mobeebanq/views/vaultScreen.dart';


class otpScreen extends StatefulWidget {
  @override
  _otpScreenState createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {

  bool hasError = false;
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController;

  String currentText = "";

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: basicColor,
      appBar: CustomAppBar("Verification Code"),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [




          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 20,
              direction: Axis.vertical,
              children: [
                Image(
                image: AssetImage("images/smsVerification.png"),
                width:  MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/5,
                ),

                Text("We have sent OTP on your number",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: "montserrat"
                ),),


              ],
            ),
          ),

          Expanded(child: Column(
            children: [

              Container(
                color: basicColor,
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height/10,
                child: Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          disabledColor: basicColor.withOpacity(0.3),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          inactiveColor: Color(0xff4D6392),
                          inactiveFillColor: Color(0xff4D6392),
                          activeColor: Colors.white,
                          selectedColor: Colors.white,
                          selectedFillColor: Color(0xff4D6392),
                          activeFillColor:
                          hasError ? Colors.orange : Colors.white,
                        ),
                        // cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: basicColor,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        // boxShadows: [
                        //   BoxShadow(
                        //     offset: Offset(0, 1),
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                        onCompleted: (v) {
                          formKey.currentState.validate();
                          // conditions for validating

                          setState(() {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (Context) => vaultScreen()));

                          });

                          //
                          // if (currentText.length != 4 || currentText != "towtow") {
                          //   errorController.add(ErrorAnimationType
                          //       .shake); // Triggering error shake animation
                          //   setState(() {
                          //     hasError = true;
                          //   });
                          // } else {
                          //   setState(() {
                          //     hasError = false;
                          //     scaffoldKey.currentState.showSnackBar(SnackBar(
                          //       content: Text("Aye!!"),
                          //       duration: Duration(seconds: 2),
                          //     ));
                          //     Navigator.of(context).push(
                          //         MaterialPageRoute(builder: (Context) => vaultScreen()));
                          //   });
                          // }
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
              ),


              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Color(0xff4D6392), fontSize: 15),
                    children: [
                      TextSpan(
                          text: " RESEND",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
              ),
            ],
          )),




          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: new Image(
                image: AssetImage("images/bottom1.png"),
                width:  MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height/6,
              ),
            ),
          ),


        ],
      ),

    );
  }
}
