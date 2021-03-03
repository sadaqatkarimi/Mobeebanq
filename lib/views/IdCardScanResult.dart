import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/customButtons.dart';
import 'package:mobeebanq/components/customTextField.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/test.dart';
import 'package:mobeebanq/views/detailsSummary.dart';

import 'OTP.dart';

class IdCadScanResult extends StatefulWidget {
  @override
  _IdCadScanResultState createState() => _IdCadScanResultState();
}

class _IdCadScanResultState extends State<IdCadScanResult> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String firstName = 'Ali ibne e talib';
    String Name = 'Markhemlin';
    String BirthDate = '20/06/2010';
    String BirthPlace = 'New York City';
    String IdCardIssuranceDate = '25/5/2010';
    String IdCardNo = '1454561225450254';
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
                      'The information has been extracted check for',
                      style: TextStyle(
                          wordSpacing: 3,
                          letterSpacing: 1.5,
                          color: mainTextColor,
                          fontSize: height / 60,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'mistake and submit',
                      style: TextStyle(
                          wordSpacing: 3,
                          letterSpacing: 1.5,
                          color: mainTextColor,
                          fontSize: height / 60,
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
                  customButton(
                    text: Text(
                      "Submit",
                      // style: CustomTextStyle.buttontitle(context),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (Context) => DetailsSummary()));
                    },
                    colors: basicColor,
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Wrap(
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        radius: height/33,
                        backgroundColor: Color(0xfff5f5f5),
                        child: Center(
                          child: IconButton(
                            icon: Center(
                              child: Icon(
                                Icons.refresh_rounded,
                                color: basicColor,
                              ),
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: height/33,
                        backgroundColor: Colors.red,
                        child: Center(
                          child: IconButton(
                            icon: Center(
                              child: Icon(
                                Icons.create_outlined,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: height/33,
                        backgroundColor: Color(0xfff5f5f5),
                        child: Center(
                          child: IconButton(
                            icon: Center(
                              child: Icon(
                                Icons.camera_alt,
                                color: basicColor,
                              ),
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                ],
              ),
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
                          Container(
                            width: width / 3.2,
                            height: height / 7,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/profile.png')),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          // CircleAvatar(
                          //   radius: 50,
                          //   backgroundColor: Colors.white,
                          //   backgroundImage: AssetImage('images/profile1.png'),
                          //
                          // )
                          Center(
                            child: Container(
                              width: width / 1.2,
                              // color: Colors.red,
                              child: Wrap(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'First Name:',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: width / 1.8,
                                        child: Text(
                                          '$firstName',
                                          style: TextStyle(
                                              wordSpacing: 0.5,
                                              //  letterSpacing: 1,
                                              color: Color(0xff010817),
                                              fontSize: height / 55,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Name:',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: width / 1.8,
                                        child: Text(
                                          '$Name',
                                          style: TextStyle(
                                              wordSpacing: 0.5,
                                              //  letterSpacing: 1,
                                              color: Color(0xff010817),
                                              fontSize: height / 55,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Birth date:',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: width / 1.8,
                                        child: Text(
                                          '$BirthDate',
                                          style: TextStyle(
                                              wordSpacing: 0.5,
                                              //  letterSpacing: 1,
                                              color: Color(0xff010817),
                                              fontSize: height / 55,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Birth Place:',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: width / 1.8,
                                        child: Text(
                                          '$BirthPlace',
                                          style: TextStyle(
                                              wordSpacing: 0.5,
                                              //  letterSpacing: 1,
                                              color: Color(0xff010817),
                                              fontSize: height / 55,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'ID card insurance date ',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '$IdCardIssuranceDate',
                                        style: TextStyle(
                                            wordSpacing: 0.5,
                                            //  letterSpacing: 1,
                                            color: Color(0xff010817),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'ID card Number:',
                                        style: TextStyle(
                                            // wordSpacing: 1,
                                            // letterSpacing: 1,
                                            color: Color(0xff6F7071),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '$IdCardNo',
                                        style: TextStyle(
                                            wordSpacing: 0.5,
                                            //  letterSpacing: 1,
                                            color: Color(0xff010817),
                                            fontSize: height / 55,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),

          // Align(
          //   alignment: FractionalOffset.bottomCenter,
          //   child: customButton(
          //     text: Text("Submit",
          //       // style: CustomTextStyle.buttontitle(context),
          //     ),
          //     onPressed: (){
          //
          //       // Navigator.of(context).push(
          //       //     MaterialPageRoute(builder: (Context) => Checkout()));
          //
          //     },
          //     colors: basicColor,
          //   ),
          // ),//
        ],
      ),
    );
  }
}
