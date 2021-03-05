import 'package:flutter/material.dart';
import 'package:mobeebanq/components/customWidgtes.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/components/myCircleMenu.dart';
import '../size_config.dart';

class paymentHistory extends StatefulWidget {
  @override
  _paymentHistoryState createState() => _paymentHistoryState();
}

class _paymentHistoryState extends State<paymentHistory> {

  int currentIndex;
  final GlobalKey<myCircleMenuState> fabKey = GlobalKey();

  Color mycolor ;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: basicColor,
        body: Center(
          child: Container(
            // color: Colors.white,
            width: SizeConfig.screenWidth,
            height: double.infinity,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                paymentHeader(),

                // Divider(height: 20,color: Colors.white,),

                myBarChart(),

                pyamentBody(),

                SizedBox(height: 10,),

              ],
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Builder(

          builder: (context) => myCircleMenu(
            key: fabKey,

            // Cannot be `Alignment.center`
            alignment: Alignment.bottomRight,
            ringColor: yelowColor,
            ringDiameter: 350.0,
            ringWidth: 130.0,
            fabSize: 150.0,
            fabElevation: 120.0,
            fabIconBorder: CircleBorder(),
            // Also can use specific color based on wether
            // the menu is open or not:
            // fabOpenColor: Colors.white
            // fabCloseColor: Colors.white
            // These properties take precedence over fabColor
            // fabOpenColor: Colors.red,
            fabCloseColor: yelowColor,
            fabColor: basicColor,
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(0.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {
              // _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
            },
            children: <Widget>[



              RawMaterialButton(
                elevation: 2,
                fillColor: basicColor,
                onPressed: () {
                  // _showSnackBar(context, "You pressed 1");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Image(image: AssetImage("icons/meter.png"),),
              ),



              RawMaterialButton(
                onPressed: () {
                  // _showSnackBar(context, "You pressed 2");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Image(image: AssetImage("icons/calender.png"),),
              ),
              RawMaterialButton(
                onPressed: () {
                  // _showSnackBar(context, "You pressed 3");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Image(image: AssetImage("icons/profile.png"),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
  // void _showSnackBar(BuildContext context, String message) {
  //   Scaffold.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         duration: const Duration(milliseconds: 1000),
  //       )
  //   );
  // }


}

class MyCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.65, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}