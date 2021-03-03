import 'dart:typed_data';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/customButtons.dart';
import 'package:mobeebanq/components/customTextField.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/test.dart';
import 'package:signature/signature.dart';
import 'package:mobeebanq/views/SummeryDetailsWithSignature.dart';
import 'OTP.dart';

class DetailsSummary extends StatefulWidget {



  @override
  _DetailsSummaryState createState() => _DetailsSummaryState();
}

class _DetailsSummaryState extends State<DetailsSummary> {


  Uint8List mysignat;

  final SignatureController _controller = SignatureController(

    penStrokeWidth: 1,
    penColor: basicColor,
    exportBackgroundColor: Colors.transparent,
  );
  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }


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
                      'Details Summary',
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
                  SizedBox(
                    height: height / 50,
                  ),
                  mysignat == null
                  ? Container()
                  : Image.memory(
                    mysignat,
                  // color: Color.red,
                  // color: Colors.grey,
                  width: 120,
                  height: 100,
                  fit: BoxFit.fill,
                  scale: 2,),
                  SizedBox(
                    height: height / 50,
                  ),
                  customButton(
                    text: Text(
                      "Add Signature ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: height/50),
                      // style: CustomTextStyle.buttontitle(context),
                    ),
                    onPressed: () {
                      setState(() {
                        opensheet();
                      });
                    },
                    colors: basicColor,
                  ),
                  SizedBox(
                    height: height / 60,
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


        ],
      ),
    );
  }

  void opensheet() async {
    showModalBottomSheet(
      // isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        enableDrag: true,
        isDismissible: true,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),



              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                              setState(() => _controller.clear());
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text(
                          "Signature",
                          style: TextStyle(
                              color: basicColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        InkWell(

                          onTap:  () async {
                            mysignat = await _controller.toPngBytes();
                            Navigator.pop(context);
                            // setState(() async {
                            //
                            //
                            // });

                          },
                          child: Text(
                            "OK",
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox (height: 10,),

                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Signature(
                      width: MediaQuery.of(context).size.width/1.3,
                      controller: _controller,
                      height: 250,
                      backgroundColor: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }

}
