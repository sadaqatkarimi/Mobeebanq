import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class vaultScreen extends StatefulWidget {
  @override
  _vaultScreenState createState() => _vaultScreenState();
}

class _vaultScreenState extends State<vaultScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: basicColor,
      appBar: CustomAppBar("Vault"),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [




          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 10,
              direction: Axis.vertical,
              children: [

                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(0.4), spreadRadius: 5)],
                      ),
                      child: CircleAvatar(

                        radius: 55,
                        backgroundColor: Color(0xff213C77),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/profile.jpg'),
                        ),
                      ),
                    ),

                    CircleAvatar(

                      radius: 15,
                      backgroundColor: Color(0xff213C77),
                      child: Icon(Icons.lock,size: 16,),
                    ),


                  ],
                ),


                Text("Mark Hemlin",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "montserrat",
                    fontWeight: FontWeight.bold
                  ),),
                Text("+858 2544 55844",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: "montserrat"
                  ),),


              ],
            ),
          ),

          Expanded(child: Column(
            children: [



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
