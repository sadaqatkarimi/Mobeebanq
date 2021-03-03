import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/model/paymentData.dart';

import '../constants.dart';

class paymentHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 6),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 5,
        children: [

          Column(
            children: [
              Text("24",style: CustomTextStyle.payments(context)),
              Text("FEB",style: CustomTextStyle.payments(context)),
            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width/1.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xffF2F8FF)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 24,
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                  SizedBox(width: 10,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ISAAC NORMAN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "montserrat"
                        ),),
                      Row(
                        children: [
                          Text("4555 *** ***** 3456",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: "montserrat"
                            ),),

                          Image.asset("images/mastercard.png",
                            scale: 12,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 35,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.keyboard_arrow_down,size: 18,),
                    ),
                  )
                ],
              ),
            ),
          ),


          Icon(Icons.more_vert,color: Colors.white,size: 30,),

          // PopupMenuButton(
          //
          //   // color: Colors.white,
          //  icon: Icon(Icons.more_vert,color: Colors.white,size: 30,),
          //   itemBuilder: (BuildContext context) {
          //     return {'Logout', 'Settings'}.map((String choice) {
          //       return PopupMenuItem<String>(
          //         value: choice,
          //         child: Text(choice),
          //       );
          //     }).toList();
          //   },
          // ),
        ],
      ),
    );
  }
}


class chatNotifaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: MediaQuery.of(context).size.height/16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: yelowColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
           Icon(Icons.local_fire_department_sharp,color: Colors.white,size: 22,),
            SizedBox(width: 10,),


            Container(
              width: MediaQuery.of(context).size.width/2.2,
              child: RichText(
                text: new TextSpan(
                  text: 'you are too close to the daily limit only',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "montserrat"
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: ' \$5.34 left',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "montserrat"
                      ) ,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5,),
            Icon(Icons.close,size: 18,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}


class myBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<myBarChart> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 2;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 10, 1.5);
    final barGroup5 = makeGroupData(4, 17, 10);
    final barGroup6 = makeGroupData(5, 19, 15);
    final barGroup7 = makeGroupData(6, 20, 16);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          fit: StackFit.expand,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[





            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                BarChartData(
                  maxY: 35,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (_a, _b, _c, _d) => null,
                      ),
                      touchCallback: (response) {
                        if (response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot.touchedBarGroupIndex;

                        setState(() {
                          if (response.touchInput is FlLongPressEnd ||
                              response.touchInput is FlPanEnd) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          } else {
                            showingBarGroups = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              double sum = 0;
                              for (BarChartRodData rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                                sum += rod.y;
                              }
                              final avg =
                                  sum / showingBarGroups[touchedGroupIndex].barRods.length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                      return rod.copyWith(y: avg);
                                    }).toList(),
                                  );
                            }
                          }
                        });
                      }),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                          color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return '11:00';
                          case 1:
                            return '12:00';
                          case 2:
                            return '13:00';
                          case 3:
                            return '14:00';
                          case 4:
                            return '15:00';
                          case 5:
                            return '16:00';
                          case 6:
                            return '17:00';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                ),
              ),
            ),

            Positioned(
                top: 2,
                left: 50,
                child: chatNotifaction()),

          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }


}



class pyamentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemCount: PaymentList.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ()
            {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (Context) => salesDetial()));
            },
            child: Container(
              // width: width/1.4,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: yelowColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),

                      ),
                      child: Image.asset(PaymentList[index].iconss,scale: 1,),
                    ),

                    SizedBox(width: 10,),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text( "-\$ " + PaymentList[index].price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 5,),
                        Container(
                          width: width/1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                PaymentList[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height / 56,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                PaymentList[index].time,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height / 56,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 12,color: Colors.grey,),
                              ),
                              TextSpan(
                                text: PaymentList[index].address,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: height / 65,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
            // color: Colors.white,
          );
        }
    );
  }
}
