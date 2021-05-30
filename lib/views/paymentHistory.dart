import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobeebanq/circle_menu/circle_menu.dart';
import 'package:mobeebanq/circle_menu/menu_controller.dart';

import 'package:mobeebanq/components/customWidgtes.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/components/myCircleMenu.dart';
import '../size_config.dart';
import 'animations/new_spining_wheel.dart';

class paymentHistory extends StatefulWidget {
  @override
  _paymentHistoryState createState() => _paymentHistoryState();
}

class _paymentHistoryState extends State<paymentHistory>
    with SingleTickerProviderStateMixin {
  final icons = [
    Icons.ac_unit,
    Icons.face,
    Icons.dangerous,
    Icons.verified,
    Icons.radio,
    Icons.sanitizer,
    Icons.cached,
    Icons.g_translate,
    Icons.ac_unit,
    Icons.face,
    Icons.dangerous,
    Icons.verified,
    Icons.radio,
    Icons.sanitizer,
    Icons.cached,
    Icons.g_translate
  ];
  final _menuController = MenuController();
  bool _isVisible = false;
  var selectedIndex = 0;

  void _changeMenuState() {
    _isVisible = !_isVisible;
    setState(() {});
    _menuController.changeState(_isVisible);
  }

  @override
  void dispose() {
    _menuController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: basicColor,
      body: Center(
        child: Container(
          // color: Colors.white,
          width: SizeConfig.screenWidth,
          height: double.infinity,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  paymentHeader(),

                  // Divider(height: 20,color: Colors.white,),

                  myBarChart(),

                  pyamentBody(),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              StreamBuilder<bool>(
                  initialData: false,
                  stream: _menuController.stream,
                  builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 700),
                          height: snapshot.data ? 350 : 0,
                          child: CircleMenu(
                            icons: icons,
                            onItemClicked: (menuItem, index) {
                              selectedIndex = index;
                              _changeMenuState();
                            },
                          )),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeMenuState();
          },
          backgroundColor: _isVisible ? basicColor : yelowColor,
          child: Icon(_isVisible ? Icons.close : Icons.menu)),
    ));
  }

// FloatingActionButton(
//                 backgroundColor: _animateColor.value,
//                 onPressed: animate,
//                 tooltip: 'Toggle',
//                 child: AnimatedIcon(
//                   icon: AnimatedIcons.menu_close,
//                   progress: _animateIcon,
//                 ),
// Stack(
  //   children: [
  //     Positioned(
  //       top: height - 270,
  //       left: width - 230,
  //       child: AnimatedOpacity(
  //         opacity: _visible ? 1.0 : 0.0,
  //         duration: Duration(milliseconds: 900),
  //         child: buildNewSpinningWheel(),
  //       ),
  //     ),
  //     Positioned(
  //       top: height - 125,
  //       left: width - 100,
  //       child: MaterialButton(
  //         height: 120,
  //         minWidth: 120,
  //         color: _animateColor.value,
  //         onPressed: animate,
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(60)),
  //         child: AnimatedIcon(
  //           color: Colors.white,
  //           icon: AnimatedIcons.menu_close,
  //           progress: _animateIcon,
  //         ),
  //       ),
  //     )
  //   ],
  // ),              )
//
//
//
//
//
  // NewSpinningWheel buildNewSpinningWheel() {
  //   return NewSpinningWheel(
  //     height: 400,
  //     width: 400,
  //     initialSpinAngle: 1,
  //     spinResistance: 0.9,
  //     canInteractWhileSpinning: false,
  //     dividers: 5,
  //     onUpdate: _dividerController.add,
  //     onEnd: _dividerController.add,
  //     secondaryImageHeight: 40,
  //     secondaryImageWidth: 40,
  //   );
  // }

  Builder fabOneButton() {
    return Builder(
      builder: (context) => myCircleMenu(
        // key: fabKey,

        // Cannot be `Alignment.center`
        alignment: Alignment.bottomRight,
        ringColor: yelowColor,
        ringDiameter: 450.0,

        ringWidth: 180.0,
        fabSize: 130.0,
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
            child: Image(
              image: AssetImage("icons/meter.png"),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              // _showSnackBar(context, "You pressed 2");
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Image(
              image: AssetImage("icons/calender.png"),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              // _showSnackBar(context, "You pressed 3");
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Image(
              image: AssetImage("icons/profile.png"),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
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

class Page extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();

  dispose() {
    _dividerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDDC3FF),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? RouletteScore(snapshot.data)
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 230.0,
      height: 230.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );

    return new Material(
      color: Colors.black,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.favorite_border),
              top: 10.0,
              left: 90.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.timer),
              top: 100.0,
              left: 10.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.place),
              top: 90.0,
              right: 10.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.local_pizza),
              top: 170.0,
              left: 90.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
