import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/customSwitch.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/portraitPhoto.dart';

class vaultScreen extends StatefulWidget {
  @override
  _vaultScreenState createState() => _vaultScreenState();
}

class _vaultScreenState extends State<vaultScreen> {
  bool status = true;

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: basicColor,
      appBar: CustomAppBar("Vault"),

      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spa,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [




            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 20, color: Color(0xff091737).withOpacity(0.6), spreadRadius: 5)],
                        ),
                        child: CircleAvatar(

                          radius: 75,
                          backgroundColor: Color(0xff213C77),
                          child: CircleAvatar(
                            backgroundColor: Color(0xff0B2150),
                            radius: 70,
                            backgroundImage: AssetImage('images/profile.png'),

                          ),
                        ),
                      ),

                      Positioned(
                        right: 7,
                        top: 10,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xff213C77),
                          child: status == false
                          ? Icon(Icons.lock_open,size: 16,color: Color(0xff38E4AA),)
                          : Icon(Icons.lock,size: 16,),
                        ),
                      ),


                    ],
                  ),

              SizedBox(height: 20,),

                  Text( status == false
                    ? "Mark Hemlin"
                    : "",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "montserrat",
                      fontWeight: FontWeight.bold
                    ),),

                  SizedBox(height: 5,),

                  Text(
                    status == false
                        ? "+858 2544 55844"
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: "montserrat"
                    ),),


                ],
              ),
            ),

            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 80,),



                Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      height: 210,
                      width: 140,
                      decoration: BoxDecoration(
                        color:  Color(0xff0B2150).withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage("images/bgLock.png"),
                        )
                      ),

                    ),
                    CustomSwitch(
                      mywidth: 180,
                      myheight: 80,
                      activeColor: Color(0xff0B2150),
                      unactiveColor: Color(0xff0B2150),
                      value: status,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          status = value;

                          if (status == false)
                            {
                              Future.delayed(Duration(seconds: 2),(){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (Context) => FacePage()));
                              });
                            }



                        });
                      },
                    ),
                  ],
                ),












              ],
            )),


          ],
        ),
      ),

    );
  }
}
