import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/customButtons.dart';
import 'package:mobeebanq/components/customTextField.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/test.dart';
import 'package:mobeebanq/views/detailsSummary.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'IdCardScanResult.dart';
import 'OTP.dart';

class IdCadScan extends StatefulWidget {
  @override
  _IdCadScanState createState() => _IdCadScanState();
}

class _IdCadScanState extends State<IdCadScan> {
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

 bool visbile  = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: basicColor, // its the main screens color
      appBar: GeneralAppBar(),

      body: Stack(
        children: [
          Positioned(
              top: height / 50,
              left: width / 18,
              child: Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID Card Scanner',
                      style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: height / 40,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Text(
                      'Scanning...',
                      style: TextStyle(
                          wordSpacing: 3,
                          letterSpacing: 1.5,
                          color: Colors.grey,
                          fontSize: height / 55,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )), // top container content
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: height / 1.5,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: visbile,
                    child: LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: 200.0,
                      animation: true,
                      animationDuration: 2500,
                      lineHeight: 14.0,
                      percent: 1.0,
                      // center: Text(
                      //   "50.0%",
                      //   style: new TextStyle(fontSize: 12.0),
                      // ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),

                ],
              )

            ),
          ), // this is middle container
          Positioned(
            top: height / 7.5,
            right: 15,
            child: Center(
                child: Container(
                    width: width / 1.1,
                    //height: height / 2.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          GestureDetector(
                            onTap: (){
                              _showPicker(context);
                            },
                            child: Stack(
                              children: [


                                Container(
                                  width: width / 1.6,
                                  height: height / 2.4,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,

                                        image:  _image==null? AssetImage("images/card.png") : FileImage(_image),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Image.asset("images/topleft.png")),

                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Image.asset("images/topright.png")),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Image.asset("images/bottomleft.png")),

                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset("images/bottomright.png")),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                                //
                                // Positioned(
                                //     top: -15,
                                //     left: -15,
                                //     child: Image.asset("images/topleft.png")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),

                        ],
                      ),
                    ))),
          ),


        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Camera'),
                onTap: () {
                  setState(() {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                     visbile = true;

                     Future.delayed(Duration(seconds: 6),(){
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (Context) => IdCadScanResult()));
                    });
                  });

                },
              ),
            ),
          );
        }
    );
  }
}
