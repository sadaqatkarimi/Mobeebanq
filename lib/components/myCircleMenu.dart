import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

import '../constants.dart';
import 'items.dart';

typedef DisplayChange = void Function(bool isOpen);

class myCircleMenu extends StatefulWidget {
  final List<Widget> children;
  final Alignment alignment;
  final Color ringColor;
  final double ringDiameter;
  final double ringWidth;
  final double fabSize;
  final double fabElevation;
  final Color fabColor;
  final Color fabOpenColor;
  final Color fabCloseColor;
  final Widget fabOpenIcon;
  final Widget fabCloseIcon;
  final ShapeBorder fabIconBorder;
  final EdgeInsets fabMargin;
  final Duration animationDuration;
  final Curve animationCurve;
  final DisplayChange onDisplayChange;

  myCircleMenu(
      {Key key,
      this.alignment = Alignment.bottomRight,
      this.ringColor,
      this.ringDiameter,
      this.ringWidth,
      this.fabSize = 64.0,
      this.fabElevation = 8.0,
      this.fabColor,
      this.fabOpenColor,
      this.fabCloseColor,
      this.fabIconBorder,
      this.fabOpenIcon = const Icon(Icons.menu),
      this.fabCloseIcon = const Icon(Icons.close),
      this.fabMargin = const EdgeInsets.all(16.0),
      this.animationDuration = const Duration(milliseconds: 800),
      this.animationCurve = Curves.easeInOutCirc,
      this.onDisplayChange,
      @required this.children})
      : assert(children != null),
        assert(children.length >= 2),
        super(key: key);

  @override
  myCircleMenuState createState() => myCircleMenuState();
}

class myCircleMenuState extends State<myCircleMenu>
    with SingleTickerProviderStateMixin {
  double _screenWidth;
  double _screenHeight;
  double _marginH;
  double _marginV;
  double _directionX;
  double _directionY;
  double _translationX;
  double _translationY;

  Color _ringColor;
  double _ringDiameter;
  double _ringWidth;
  Color _fabColor;
  Color _fabOpenColor;
  Color _fabCloseColor;
  ShapeBorder _fabIconBorder;

  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation _scaleCurve;
  Animation<double> _rotateAnimation;
  Animation _rotateCurve;
  Animation<Color> _colorAnimation;
  Animation _colorCurve;

  bool _isOpen = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget.animationDuration, vsync: this);

    _scaleCurve = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.4, curve: widget.animationCurve));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleCurve)
      ..addListener(() {
        setState(() {});
      });

    _rotateCurve = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: widget.animationCurve));
    _rotateAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_rotateCurve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calculateProps();
  }

  int lastAnimPosition = 2;

  AnimationController animation;
  @override
  Widget build(BuildContext context) {
    // This makes the widget able to correctly redraw on
    // hot reload while keeping performance in production
    if (!kReleaseMode) {
      _calculateProps();
    }

    return Container(
      margin: widget.fabMargin,
      // Removes the default FAB margin
      transform: Matrix4.translationValues(20.0, 10.0, 0.0),
      child: Stack(
        alignment: widget.alignment,
        children: <Widget>[
          // Ring
          Transform(
            transform:
                Matrix4.translationValues(_translationX, _translationY, .0)
                  ..scale(_scaleAnimation.value),
            alignment: FractionalOffset.center,
            child: OverflowBox(
              maxWidth: _ringDiameter,
              maxHeight: _ringDiameter,
              child: Container(
                width: _ringDiameter,
                height: _ringDiameter,
                child: _scaleAnimation.value == 1.0
                    ? Transform.rotate(
                        angle: (1.7 * pi) *
                            _rotateAnimation.value *
                            _directionX *
                            _directionY,
                        child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              ArcChooser()
                                ..arcSelectedCallback =
                                    (int pos, ArcItem item) {
                                  int animPosition = pos - 2;
                                  if (animPosition > 3) {
                                    animPosition = animPosition - 4;
                                  }

                                  if (animPosition < 0) {
                                    animPosition = 4 + animPosition;
                                  }

                                  if (lastAnimPosition == 3 &&
                                      animPosition == 0) {
                                    animation.animateTo(4 * 100.0);
                                  } else if (lastAnimPosition == 0 &&
                                      animPosition == 3) {
                                    animation.forward(from: 4 * 100.0);
                                    animation.animateTo(animPosition * 100.0);
                                  } else if (lastAnimPosition == 0 &&
                                      animPosition == 1) {
                                    animation.forward(from: 0.0);
                                    animation.animateTo(animPosition * 100.0);
                                  } else {
                                    animation.animateTo(animPosition * 100.0);
                                  }

                                  lastAnimPosition = animPosition;
                                },
                            ]),
                      )
                    : Container(),
              ),
            ),
          ),

          // FAB
          Positioned(
            right: -25,
            bottom: -15,
            child: Container(
              width: widget.fabSize,
              height: widget.fabSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 12,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: RawMaterialButton(
                fillColor: _colorAnimation.value,
                shape: _fabIconBorder,
                elevation: widget.fabElevation,
                onPressed: () {
                  if (_isAnimating) return;

                  if (_isOpen) {
                    close();
                  } else {
                    open();
                  }
                },
                child: Center(
                    child: _scaleAnimation.value == 1.0
                        ? widget.fabCloseIcon
                        : widget.fabOpenIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _applyTransformations(Widget child, int index) {
  //   double angleFix = 0.0;
  //   if (widget.alignment.x == 0) {
  //     angleFix = 45.0 * _directionY.abs();
  //   } else if (widget.alignment.y == 0) {
  //     angleFix = -45.0 * _directionX.abs();
  //   }
  //
  //   final angle =
  //   vector.radians(90.0 / (widget.children.length - 1) * index + angleFix);
  //
  //   return Transform(
  //       transform: Matrix4.translationValues(
  //           (-(_ringDiameter / 2) * cos(angle) +
  //               (_ringWidth / 2 * cos(angle))) *
  //               _directionX,
  //           (-(_ringDiameter / 2) * sin(angle) +
  //               (_ringWidth / 2 * sin(angle))) *
  //               _directionY,
  //           0.0),
  //       alignment: FractionalOffset.center,
  //       child: Material(
  //         color: Colors.transparent,
  //         child: child,
  //       ));
  // }

  void _calculateProps() {
    _ringColor = widget.ringColor ?? Theme.of(context).accentColor;
    _fabColor = widget.fabColor ?? Theme.of(context).primaryColor;
    _fabOpenColor = widget.fabOpenColor ?? _fabColor;
    _fabCloseColor = widget.fabCloseColor ?? _fabColor;
    _fabIconBorder = widget.fabIconBorder ?? CircleBorder();
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _ringDiameter =
        widget.ringDiameter ?? min(_screenWidth, _screenHeight) * 1.25;
    _ringWidth = widget.ringWidth ?? _ringDiameter * 0.3;
    _marginH = (widget.fabMargin.right + widget.fabMargin.left) / 2;
    _marginV = (widget.fabMargin.top + widget.fabMargin.bottom) / 2;
    _directionX = widget.alignment.x == 0 ? 1 : 1 * widget.alignment.x.sign;
    _directionY = widget.alignment.y == 0 ? 1 : 1 * widget.alignment.y.sign;
    _translationX =
        ((_screenWidth - widget.fabSize) / 3.3 - _marginH) * widget.alignment.x;
    _translationY = ((_screenHeight - widget.fabSize) / 2.8 - _marginV) *
        widget.alignment.y;

    if (_colorAnimation == null || !kReleaseMode) {
      _colorCurve = CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.0, 0.4, curve: widget.animationCurve));
      _colorAnimation = ColorTween(begin: _fabCloseColor, end: _fabOpenColor)
          .animate(_colorCurve)
            ..addListener(() {
              setState(() {});
            });
    }
  }

  void open() {
    _isAnimating = true;
    _animationController.forward().then((_) {
      _isAnimating = false;
      _isOpen = true;
      if (widget.onDisplayChange != null) {
        widget.onDisplayChange(true);
      }
    });
  }

  void close() {
    _isAnimating = true;
    _animationController.reverse().then((_) {
      _isAnimating = false;
      _isOpen = false;
      if (widget.onDisplayChange != null) {
        widget.onDisplayChange(false);
      }
    });
  }

  bool get isOpen => _isOpen;
}

// class _RingPainter extends CustomPainter {
//   final double width;
//   final Color color;
//
//   _RingPainter({@required this.width, this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color ?? Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width < width ? size.width : width;
//
//     canvas.drawArc(
//         Rect.fromLTWH(
//             width / 2, width / 2, size.width - width, size.height - width),
//         0.0,
//         2 * pi,
//         false,
//         paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

typedef void ArcSelectedCallback(int position, ArcItem arcitem);

class ArcChooser extends StatefulWidget {
  ArcSelectedCallback arcSelectedCallback;

  @override
  State<StatefulWidget> createState() {
    return ChooserState(arcSelectedCallback);
  }
}

class ChooserState extends State<ArcChooser>
    with SingleTickerProviderStateMixin {
  var slideValue = 200;
  Offset centerPoint;

  double userAngle = 0.0;

  double startAngle;

  static double center = 270.0;
  static double centerInRadians = degreeToRadians(center);
  static double angle = 45.0;

  static double angleInRadians = degreeToRadians(angle);
  static double angleInRadiansByTwo = angleInRadians / 2;
  static double centerItemAngle = degreeToRadians(center - (angle / 2));
  List<ArcItem> arcItems;

  AnimationController animation;
  double animationStart;
  double animationEnd = 0.0;

  int currentPosition = 0;

  Offset startingPoint;
  Offset endingPoint;

  ArcSelectedCallback arcSelectedCallback;

  ChooserState(ArcSelectedCallback arcSelectedCallback) {
    this.arcSelectedCallback = arcSelectedCallback;
  }

  static double degreeToRadians(double degree) {
    return degree * (pi / 180);
  }

  static double radianToDegrees(double radian) {
    return radian * (180 / pi);
  }

  @override
  void initState() {
    arcItems = List<ArcItem>();

    arcItems.add(ArcItem(Icons.ac_unit, [basicColor, basicColor],
        angleInRadiansByTwo + userAngle));
    arcItems.add(ArcItem(
        Icons.airline_seat_individual_suite_sharp,
        [yelowColor, yelowColor],
        angleInRadiansByTwo + userAngle + (angleInRadians)));
    arcItems.add(ArcItem(Icons.bathtub_sharp, [basicColor, basicColor],
        angleInRadiansByTwo + userAngle + (2 * angleInRadians)));
    arcItems.add(ArcItem(
        Icons.accessible_forward_sharp,
        [yelowColor, yelowColor],
        angleInRadiansByTwo + userAngle + (3 * angleInRadians)));
    arcItems.add(ArcItem(Icons.ac_unit, [basicColor, basicColor],
        angleInRadiansByTwo + userAngle + (4 * angleInRadians)));
    arcItems.add(ArcItem(Icons.ac_unit, [yelowColor, yelowColor],
        angleInRadiansByTwo + userAngle + (5 * angleInRadians)));
    arcItems.add(ArcItem(Icons.ac_unit, [basicColor, basicColor],
        angleInRadiansByTwo + userAngle + (6 * angleInRadians)));
    arcItems.add(ArcItem(Icons.ac_unit, [yelowColor, yelowColor],
        angleInRadiansByTwo + userAngle + (7 * angleInRadians)));

    animation = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation.addListener(() {
      userAngle = lerpDouble(animationStart, animationEnd, animation.value);
      setState(() {
        for (int i = 0; i < arcItems.length; i++) {
          arcItems[i].startAngle =
              angleInRadiansByTwo + userAngle + (i * angleInRadians);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height * 1.5;
    centerPoint = Offset(centerX, centerY);

    return new GestureDetector(
//        onTap: () {
//          print('ChooserState.build ONTAP');
//          animationStart = touchAngle;
//          animationEnd = touchAngle + angleInRadians;
//          animation.forward(from: 0.0);
//        },
      onPanStart: (DragStartDetails details) {
        startingPoint = details.globalPosition;
        var deltaX = centerPoint.dx - details.globalPosition.dx;
        var deltaY = centerPoint.dy - details.globalPosition.dy;
        startAngle = atan2(deltaY, deltaX);
      },
      onPanUpdate: (DragUpdateDetails details) {
        endingPoint = details.globalPosition;
        var deltaX = centerPoint.dx - details.globalPosition.dx;
        var deltaY = centerPoint.dy - details.globalPosition.dy;
        var freshAngle = atan2(deltaY, deltaX);
        userAngle += freshAngle - startAngle;
        setState(() {
          for (int i = 0; i < arcItems.length; i++) {
            arcItems[i].startAngle =
                angleInRadiansByTwo + userAngle + (i * angleInRadians);
          }
        });
        startAngle = freshAngle;
      },
      onPanEnd: (DragEndDetails details) {
        //find top arc item with Magic!!
        bool rightToLeft = startingPoint.dx < endingPoint.dx;

//        Animate it from this values
        animationStart = userAngle;
        if (rightToLeft) {
          animationEnd += angleInRadians;
          currentPosition--;
          if (currentPosition < 0) {
            currentPosition = arcItems.length - 1;
          }
        } else {
          animationEnd -= angleInRadians;
          currentPosition++;
          if (currentPosition >= arcItems.length) {
            currentPosition = 0;
          }
        }

        if (arcSelectedCallback != null) {
          arcSelectedCallback(
              currentPosition,
              arcItems[(currentPosition >= (arcItems.length - 1))
                  ? 0
                  : currentPosition + 1]);
        }

        animation.forward(from: 0.0);
      },
      child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.width * 1 / 1.5),
        painter: ChooserPainter(arcItems, angleInRadians),
      ),
    );
  }
}
