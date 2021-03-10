
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/OTP.dart';

import 'customTextField.dart';





class AdvanceCustomAlert extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      // color: Colors.black,
      height: height/2.2,
      child: Stack(
        children: [
          Container(
            width: width/1.1,
            height: height/2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
//country picker
                    Container(
                      width: width/1.3,
                      // height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade100)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CountryListPick(
                          pickerBuilder: (context, CountryCode countryCode){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      countryCode.flagUri,
                                      package: 'country_list_pick',
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(countryCode.code),
                                    Text(countryCode.dialCode),
                                  ],
                                ),
                                Icon(Icons.arrow_drop_down,size: 18,)
                              ],
                            );
                          },
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: true,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          //show down icon on dropdown
                          initialSelection: '+672', //inital selection, +672 for Antarctica
                          onChanged: (CountryCode code) {
                            print(code.name); //get the country name eg: Antarctica
                            print(code.code); //get the country code like AQ for Antarctica
                            print(code.dialCode); //get the country dial code +672 for Antarctica
                            print(code.flagUri); //get the URL of flag. flags/aq.png for Antarctica
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: height/30,),
                    numberField(),
                    SizedBox(height: height/10,),
                    Container(
                      width: width/1.4,
                      child: Text('We will send you one time password (OTP)', style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: width/1.4,
                      child: Text('Privacy Policy may apply', style: TextStyle(color: basicColor,fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
          ),
          Positioned.fill(
            bottom: 0,
            // right: 150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 60.0,
                height: 60.0,
                // decoration: new BoxDecoration(
                //   color: basicColor,
                //   borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                //   border: new Border.all(
                //     color: Colors.white.withOpacity(0.9),
                //     width: 5.0,
                //   ),
                // ),
                child: RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (Context) => otpScreen()));
                    },
                    color: basicColor,
                    elevation: 0,
                    focusColor: basicColor,
                    disabledColor: basicColor,
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white.withOpacity(0.9), width: 5),
                    ),
                    child: Icon(Icons.arrow_forward,color: Colors.white,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class HolePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRRect(RRect.fromLTRBR(100, 100, 300, 300, Radius.circular(10))),
        Path()
          ..addOval(Rect.fromCircle(center: Offset(200, 200), radius: 50))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }

}