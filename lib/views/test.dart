import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new MyReviewPage(),
      ),
    );
  }
}

class MyReviewPage extends StatefulWidget {
  MyReviewPage({Key key}) : super(key: key);

  @override
  _MyReviewPageState createState() => new _MyReviewPageState();
}

class _MyReviewPageState extends State<MyReviewPage>
    with TickerProviderStateMixin {
  final PageController pageControl = new PageController(
    initialPage: 2,
    keepPage: false,
    viewportFraction: 0.2,
  );

  int slideValue = 200;
  int lastAnimPosition = 2;

  AnimationController animation;

  List<ArcItem> arcItems = List<ArcItem>();

  ArcItem badArcItem;
  ArcItem ughArcItem;
  ArcItem okArcItem;
  ArcItem goodArcItem;

  Color startColor;
  Color endColor;

  @override
  void initState() {
    super.initState();

    badArcItem = ArcItem("BAD", [Color(0xFFfe0944), Color(0xFFfeae96)], 0.0);
    ughArcItem = ArcItem("UGH", [Color(0xFFF9D976), Color(0xfff39f86)], 0.0);
    okArcItem = ArcItem("OK", [Color(0xFF21e1fa), Color(0xff3bb8fd)], 0.0);
    goodArcItem = ArcItem("GOOD", [Color(0xFF3ee98a), Color(0xFF41f7c7)], 0.0);

    arcItems.add(badArcItem);
    arcItems.add(ughArcItem);
    arcItems.add(okArcItem);
    arcItems.add(goodArcItem);

    startColor = Color(0xFF21e1fa);
    endColor = Color(0xff3bb8fd);

    animation = new AnimationController(
      value: 0.0,
      lowerBound: 0.0,
      upperBound: 400.0,
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() {
      setState(() {
        slideValue = animation.value.toInt();

        double ratio;

        if (slideValue <= 100) {
          ratio = animation.value / 100;
          startColor =
              Color.lerp(badArcItem.colors[0], ughArcItem.colors[0], ratio);
          endColor =
              Color.lerp(badArcItem.colors[1], ughArcItem.colors[1], ratio);
        } else if (slideValue <= 200) {
          ratio = (animation.value - 100) / 100;
          startColor =
              Color.lerp(ughArcItem.colors[0], okArcItem.colors[0], ratio);
          endColor =
              Color.lerp(ughArcItem.colors[1], okArcItem.colors[1], ratio);
        } else if (slideValue <= 300) {
          ratio = (animation.value - 200) / 100;
          startColor =
              Color.lerp(okArcItem.colors[0], goodArcItem.colors[0], ratio);
          endColor =
              Color.lerp(okArcItem.colors[1], goodArcItem.colors[1], ratio);
        } else if (slideValue <= 400) {
          ratio = (animation.value - 300) / 100;
          startColor =
              Color.lerp(goodArcItem.colors[0], badArcItem.colors[0], ratio);
          endColor =
              Color.lerp(goodArcItem.colors[1], badArcItem.colors[1], ratio);
        }
      });
    });

    animation.animateTo(slideValue.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = new TextStyle(
        color: Colors.white, fontSize: 24.00, fontWeight: FontWeight.bold);

    return Container(
      margin: MediaQuery.of(context).padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[


//          Slider(
//            min: 0.0,
//            max: 400.0,
//            value: slideValue.toDouble(),
//            onChanged: (double newValue) {
//              setState(() {
//                slideValue = newValue.round();
//              });
//            },
//          ),

//          new SizedBox(
//            height: 50.0,
//            child: new NotificationListener(
//              onNotification: (ScrollNotification notification){
//                if(!notification.metrics.atEdge){
//                  print('_MyReviewPageState.build ' + MediaQuery.of(context).size.width.toString() + " " + notification.metrics.pixels.toString());
//                }
//
//              },
//              child: PageView.builder(
//                pageSnapping: true,
//                onPageChanged: (int value) {
//                  print('_MyReviewPageState._onPageChanged ' + value.toString());
//                  animation.animateTo(value*100.0);
//                },
//                controller: pageControl,
//                itemCount: arcItems.length,
//                physics: new AlwaysScrollableScrollPhysics(),
//                itemBuilder: (context, index) {
//                  return new Container(
//                      decoration: new BoxDecoration(
//                        gradient: new LinearGradient(
//                            colors: [
//                              arcItems[index].colors[0],
//                              arcItems[index].colors[1]
//                            ]
//                        ),
//                      ),
//                      alignment: Alignment.center,
//                      child: new Text(
//                        arcItems[index].text,
//                        style: textStyle,
//                      ));
//                },
//              ),
//            ),
//          ),
          Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                ArcChooser()
                  ..arcSelectedCallback = (int pos, ArcItem item) {
                    int animPosition = pos - 2;
                    if (animPosition > 3) {
                      animPosition = animPosition - 4;
                    }

                    if (animPosition < 0) {
                      animPosition = 4 + animPosition;
                    }

                    if (lastAnimPosition == 3 && animPosition == 0) {
                      animation.animateTo(4 * 100.0);
                    } else if (lastAnimPosition == 0 && animPosition == 3) {
                      animation.forward(from: 4 * 100.0);
                      animation.animateTo(animPosition * 100.0);
                    } else if (lastAnimPosition == 0 && animPosition == 1) {
                      animation.forward(from: 0.0);
                      animation.animateTo(animPosition * 100.0);
                    } else {
                      animation.animateTo(animPosition * 100.0);
                    }

                    lastAnimPosition = animPosition;
                  },

              ]),
        ],
      ),
    );
  }
}



class SmilePainter extends CustomPainter {
  //debugging Paint
  final debugPaint = new Paint()
    ..color = Colors.grey //0xFFF9D976
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  final whitePaint = new Paint()
    ..color = Colors.white //0xFFF9D976
    ..style = PaintingStyle.fill;

  int slideValue = 200;

  ReviewState badReview;
  ReviewState ughReview;
  ReviewState okReview;
  ReviewState goodReview;

  double centerCenter;
  double leftCenter;
  double rightCenter;

  double smileHeight;
  double halfWidth;
  double halfHeight;

  double radius;
  double diameter;
  double startingY;
  double startingX;

  double endingX;
  double endingY;

  double oneThirdOfDia;

  double oneThirdOfDiaByTwo;

  double eyeRadius;

  double eyeRadiusbythree;

  double eyeRadiusbytwo;

  SmilePainter(int slideValue) : slideValue = slideValue;

  Size lastSize;

  ReviewState currentState;

  @override
  void paint(Canvas canvas, Size size) {
    if (size != lastSize) {
      lastSize = size;

      smileHeight = size.width / 2;
      halfWidth = size.width / 2;
      halfHeight = smileHeight / 2;

      radius = 0.0;
      eyeRadius = 10.0;
      if (smileHeight < size.width) {
        radius = halfHeight - 16.0;
      } else {
        radius = halfWidth - 16.0;
      }
      eyeRadius = radius / 6.5;
      eyeRadiusbythree = eyeRadius/3;
      eyeRadiusbytwo = eyeRadius/2;

      diameter = radius * 2;
      //left top corner
      startingX = halfWidth - radius;
      startingY = halfHeight - radius;

      oneThirdOfDia = (diameter / 3);
      oneThirdOfDiaByTwo = oneThirdOfDia / 2;

      //bottom right corner
      endingX = halfWidth + radius;
      endingY = halfHeight + radius;

      final leftSmileX = startingX + (radius / 2);

      badReview = ReviewState(
          Offset(leftSmileX, endingY - (oneThirdOfDiaByTwo * 1.5)),
          Offset(startingX + oneThirdOfDia,
              startingY + radius + (oneThirdOfDiaByTwo)),
          Offset(endingX - radius, startingY + radius + (oneThirdOfDiaByTwo)),
          Offset(endingX - oneThirdOfDia,
              startingY + radius + (oneThirdOfDiaByTwo)),
          Offset(endingX - (radius / 2), endingY - (oneThirdOfDiaByTwo * 1.5)),
          Color(0xFFfe0944),
          Color(0xFFfeae96),
          Color(0xFFfe5c6e),
          'BAD');

      ughReview = ReviewState(
          Offset(leftSmileX, endingY - (radius / 2)),
          Offset(diameter, endingY - oneThirdOfDia),
          Offset(endingX - radius, endingY - oneThirdOfDia),
          Offset(endingX - (radius / 2), endingY - oneThirdOfDia),
          Offset(endingX - (radius / 2), endingY - oneThirdOfDia),
          Color(0xFFF9D976),
          Color(0xfff39f86),
          Color(0xFFf6bc7e),
          'UGH');

      okReview = ReviewState(
          Offset(leftSmileX, endingY - (oneThirdOfDiaByTwo * 1.5)),
          Offset(diameter, endingY - (oneThirdOfDiaByTwo * 1.5)),
          Offset(endingX - radius, endingY - (oneThirdOfDiaByTwo * 1.5)),
          Offset(startingX + radius, endingY - (oneThirdOfDiaByTwo * 1.5)),
          Offset(endingX - (radius / 2), endingY - (oneThirdOfDiaByTwo * 1.5)),
          Color(0xFF21e1fa),
          Color(0xff3bb8fd),
          Color(0xFF28cdfc),
          'OK');

      goodReview = ReviewState(
          Offset(startingX + (radius / 2), endingY - (oneThirdOfDiaByTwo * 2)),
          Offset(startingX + oneThirdOfDia,
              startingY + (diameter - oneThirdOfDiaByTwo)),
          Offset(endingX - radius, startingY + (diameter - oneThirdOfDiaByTwo)),
          Offset(endingX - oneThirdOfDia,
              startingY + (diameter - oneThirdOfDiaByTwo)),
          Offset(endingX - (radius / 2), endingY - (oneThirdOfDiaByTwo * 2)),
          Color(0xFF3ee98a),
          Color(0xFF41f7c7),
          Color(0xFF41f7c6),
          'GOOD');

      //get max width of text, that is width of GOOD text
      TextSpan spanGood = new TextSpan(
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 52.0,
              color: okReview.titleColor),
          text: "GOOD");
      TextPainter tpGood =
      new TextPainter(text: spanGood, textDirection: TextDirection.ltr);
      tpGood.layout();
      double goodWidth = tpGood.width;
      double halfGoodWidth = goodWidth / 2;

      //center points of BIG labels
      centerCenter = halfWidth;
      leftCenter = centerCenter - goodWidth;
      rightCenter = centerCenter + goodWidth;
    }

    if (slideValue <= 100) {
      tweenText(badReview, ughReview, slideValue / 100, canvas);
    } else if (slideValue <= 200) {
      tweenText(ughReview, okReview, (slideValue - 100) / 100, canvas);
    } else if (slideValue <= 300) {
      tweenText(okReview, goodReview, (slideValue - 200) / 100, canvas);
    } else if (slideValue <= 400) {
      tweenText(goodReview, badReview, (slideValue - 300) / 100, canvas);
    }

    //draw the outer circle------------------------------------------

    final centerPoint = Offset(halfWidth, halfHeight);
    final circlePaint = genGradientPaint(
      new Rect.fromCircle(
        center: centerPoint,
        radius: radius,
      ),
      currentState.startColor,
      currentState.endColor,
      PaintingStyle.stroke,
    )..strokeCap = StrokeCap.round;

    canvas.drawCircle(centerPoint, radius, circlePaint);
    //---------------------------------------------------------------

    //draw smile curve with path ------------------------------------------
    canvas.drawPath(getSmilePath(currentState), circlePaint);

    //---------------------------------------------------------------

    //draw eyes---------------------------------------------------
    //ele calc
    final leftEyeX = startingX + oneThirdOfDia;
    final eyeY = startingY + (oneThirdOfDia + oneThirdOfDiaByTwo / 4);
    final rightEyeX = startingX + (oneThirdOfDia * 2);

    final leftEyePoint = Offset(leftEyeX, eyeY);
    final rightEyePoint = Offset(rightEyeX, eyeY);

    final Paint leftEyePaintFill = genGradientPaint(
      new Rect.fromCircle(center: leftEyePoint, radius: eyeRadius),
      currentState.startColor,
      currentState.endColor,
      PaintingStyle.fill,
    );

    final Paint rightEyePaintFill = genGradientPaint(
      new Rect.fromCircle(center: rightEyePoint, radius: eyeRadius),
      currentState.startColor,
      currentState.endColor,
      PaintingStyle.fill,
    );

    canvas.drawCircle(leftEyePoint, eyeRadius, leftEyePaintFill);
    canvas.drawCircle(rightEyePoint, eyeRadius, rightEyePaintFill);

    //draw the edges of BAD Review
    if (slideValue <= 100 || slideValue > 300) {

      double diff = -1.0;
      double tween = -1.0;

      if (slideValue <= 100) {
        diff = slideValue / 100;
        tween = lerpDouble(eyeY-(eyeRadiusbythree*0.6), eyeY-eyeRadius, diff);
      } else if (slideValue > 300) {
        diff = (slideValue - 300) / 100;
        tween = lerpDouble(eyeY-eyeRadius, eyeY-(eyeRadiusbythree*0.6), diff);

      }

      List<Offset> polygonPath = List<Offset>();
      polygonPath.add(Offset(leftEyeX-eyeRadiusbytwo, eyeY-eyeRadius));
      polygonPath.add(Offset(leftEyeX+eyeRadius, tween));
      polygonPath.add(Offset(leftEyeX+eyeRadius, eyeY-eyeRadius));

      Path clipPath = new Path();
      clipPath.addPolygon(polygonPath, true);

      canvas.drawPath(clipPath, whitePaint);

      List<Offset> polygonPath2 = List<Offset>();
      polygonPath2.add(Offset(rightEyeX+eyeRadiusbytwo, eyeY-eyeRadius));
      polygonPath2.add(Offset(rightEyeX-eyeRadius, tween));
      polygonPath2.add(Offset(rightEyeX-eyeRadius, eyeY-eyeRadius));

      Path clipPath2 = new Path();
      clipPath2.addPolygon(polygonPath2, true);

      canvas.drawPath(clipPath2, whitePaint);
    }

    //draw the balls of UGH Review
    if (slideValue > 0 && slideValue < 200) {

      double diff = -1.0;
      double leftTweenX = -1.0;
      double leftTweenY = -1.0;

      double rightTweenX = -1.0;
      double rightTweenY = -1.0;

      if (slideValue <= 100) {
//      bad to ugh
        diff = slideValue / 100;
        leftTweenX = lerpDouble(leftEyeX-eyeRadius, leftEyeX, diff);
        leftTweenY = lerpDouble(eyeY-eyeRadius, eyeY, diff);

        rightTweenX = lerpDouble(rightEyeX+eyeRadius, rightEyeX, diff);
        rightTweenY = lerpDouble(eyeY, eyeY-(eyeRadius+eyeRadiusbythree), diff);

      } else {
//      ugh to ok
        diff = (slideValue - 100) / 100;

        leftTweenX = lerpDouble(leftEyeX, leftEyeX-eyeRadius, diff);
        leftTweenY = lerpDouble(eyeY, eyeY-eyeRadius, diff);

        rightTweenX = lerpDouble(rightEyeX, rightEyeX+eyeRadius, diff);
        rightTweenY = lerpDouble(eyeY-(eyeRadius+eyeRadiusbythree), eyeY, diff);


      }

      canvas.drawOval(Rect.fromLTRB(leftEyeX-(eyeRadius+eyeRadiusbythree), eyeY-(eyeRadius+eyeRadiusbythree), leftTweenX, leftTweenY), whitePaint);

      canvas.drawOval(Rect.fromLTRB(rightTweenX, eyeY, rightEyeX+(eyeRadius+eyeRadiusbythree), eyeY-(eyeRadius+eyeRadiusbythree)), whitePaint);
    }


    //---------------------------------------------------------------

    //drawing stuff for debugging-----------------------------------

//    canvas.drawRect(
//        Rect.fromLTRB(0.0, 0.0, size.width, smileHeight), debugPaint);
//    canvas.drawRect(
//        Rect.fromLTRB(startingX, startingY, endingX, endingY), debugPaint);
//
//    canvas.drawLine(
//        Offset(startingX, startingY), Offset(endingX, endingY), debugPaint);
//    canvas.drawLine(
//        Offset(endingX, startingY), Offset(startingX, endingY), debugPaint);
//    canvas.drawLine(Offset(startingX + radius, startingY),
//        Offset(startingX + radius, endingY), debugPaint);
//    canvas.drawLine(Offset(startingX, startingY + radius),
//        Offset(endingX, startingY + radius), debugPaint);
//
//    //horizontal lines
//    canvas.drawLine(Offset(startingX, startingY + oneThirdOfDia),
//        Offset(endingX, startingY + oneThirdOfDia), debugPaint);
//    canvas.drawLine(Offset(startingX, endingY - oneThirdOfDia),
//        Offset(endingX, endingY - oneThirdOfDia), debugPaint);
//    canvas.drawLine(Offset(startingX, endingY - oneThirdOfDiaByTwo),
//        Offset(endingX, endingY - oneThirdOfDiaByTwo), debugPaint);
//
//    //vertical lines
//    canvas.drawLine(Offset(startingX + oneThirdOfDiaByTwo, startingY),
//        Offset(startingX + oneThirdOfDiaByTwo, endingY), debugPaint);
//    canvas.drawLine(Offset(startingX + oneThirdOfDia, startingY),
//        Offset(startingX + oneThirdOfDia, endingY), debugPaint);
//    canvas.drawLine(Offset(endingX - oneThirdOfDia, startingY),
//        Offset(endingX - oneThirdOfDia, endingY), debugPaint);
//    canvas.drawLine(Offset(endingX - oneThirdOfDiaByTwo, startingY),
//        Offset(endingX - oneThirdOfDiaByTwo, endingY), debugPaint);
    //--------------------------------------------------------------

  }

  tweenText(ReviewState centerReview, ReviewState rightReview, double diff,
      Canvas canvas) {
    currentState = ReviewState.lerp(centerReview, rightReview, diff);

    TextSpan spanCenter = new TextSpan(
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 52.0,
            color:
            centerReview.titleColor.withAlpha(255 - (255 * diff).round())),
        text: centerReview.title);
    TextPainter tpCenter =
    new TextPainter(text: spanCenter, textDirection: TextDirection.ltr);

    TextSpan spanRight = new TextSpan(
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 52.0,
            color: rightReview.titleColor.withAlpha((255 * diff).round())),
        text: rightReview.title);
    TextPainter tpRight =
    new TextPainter(text: spanRight, textDirection: TextDirection.ltr);

    tpCenter.layout();
    tpRight.layout();

    Offset centerOffset =
    new Offset(centerCenter - (tpCenter.width / 2), smileHeight);
    Offset centerToLeftOffset =
    new Offset(leftCenter - (tpCenter.width / 2), smileHeight);

    Offset rightOffset =
    new Offset(rightCenter - (tpRight.width / 2), smileHeight);
    Offset rightToCenterOffset =
    new Offset(centerCenter - (tpRight.width / 2), smileHeight);

    tpCenter.paint(canvas, Offset.lerp(centerOffset, centerToLeftOffset, diff));
    tpRight.paint(canvas, Offset.lerp(rightOffset, rightToCenterOffset, diff));
  }

  Path getSmilePath(ReviewState state) {
    var smilePath = Path();
    smilePath.moveTo(state.leftOffset.dx, state.leftOffset.dy);
    smilePath.quadraticBezierTo(state.leftHandle.dx, state.leftHandle.dy,
        state.centerOffset.dx, state.centerOffset.dy);
    smilePath.quadraticBezierTo(state.rightHandle.dx, state.rightHandle.dy,
        state.rightOffset.dx, state.rightOffset.dy);
    return smilePath;
  }

  Paint genGradientPaint(
      Rect rect, Color startColor, Color endColor, PaintingStyle style) {
    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        startColor,
        endColor,
      ],
    );

    return new Paint()
      ..strokeWidth = 10.0
      ..style = style
      ..shader = gradient.createShader(rect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ReviewState {
  //smile points
  Offset leftOffset;
  Offset centerOffset;
  Offset rightOffset;

  Offset leftHandle;
  Offset rightHandle;

  String title;
  Color titleColor;

  Color startColor;
  Color endColor;

  ReviewState(
      this.leftOffset,
      this.leftHandle,
      this.centerOffset,
      this.rightHandle,
      this.rightOffset,
      this.startColor,
      this.endColor,
      this.titleColor,
      this.title);

  //create new state between given two states.
  static ReviewState lerp(ReviewState start, ReviewState end, double ratio) {
    var startColor = Color.lerp(start.startColor, end.startColor, ratio);
    var endColor = Color.lerp(start.endColor, end.endColor, ratio);

    return ReviewState(
        Offset.lerp(start.leftOffset,end.leftOffset, ratio),
        Offset.lerp(start.leftHandle, end.leftHandle, ratio),
        Offset.lerp(start.centerOffset, end.centerOffset, ratio),
        Offset.lerp(start.rightHandle, end.rightHandle, ratio),
        Offset.lerp(start.rightOffset, end.rightOffset, ratio),
        startColor,
        endColor,
        start.titleColor,
        start.title);
  }
}



class ArcChooser extends StatefulWidget {

  ArcSelectedCallback arcSelectedCallback;

  @override
  State<StatefulWidget> createState() {
    return ChooserState(arcSelectedCallback);
  }
}

class ChooserState extends State<ArcChooser> with SingleTickerProviderStateMixin {
  var slideValue = 200;
  Offset centerPoint;

  double userAngle = 0.0;

  double startAngle;

  static double center = 270.0;
  static double centerInRadians = degreeToRadians(center);
  static double angle = 45.0;

  static double angleInRadians = degreeToRadians(angle);
  static double angleInRadiansByTwo = angleInRadians/2;
  static double centerItemAngle = degreeToRadians(center - (angle / 2));
  List<ArcItem> arcItems;

  AnimationController animation;
  double animationStart;
  double animationEnd = 0.0;

  int currentPosition = 0;

  Offset startingPoint;
  Offset endingPoint;

  ArcSelectedCallback arcSelectedCallback;

  ChooserState(ArcSelectedCallback arcSelectedCallback){
    this.arcSelectedCallback = arcSelectedCallback;
  }

  static double degreeToRadians(double degree) {
    return degree * (pi / 180);
  }

  static double radianToDegrees(double radian) {
    return radian * (180 / pi );
  }

  @override
  void initState() {
    arcItems = List<ArcItem>();


    arcItems.add(ArcItem("UGH", [Color(0xFFF9D976), Color(0xfff39f86)],
        angleInRadiansByTwo + userAngle));
    arcItems.add(ArcItem("OK", [Color(0xFF21e1fa), Color(0xff3bb8fd)],
        angleInRadiansByTwo + userAngle + (angleInRadians)));
    arcItems.add(ArcItem("GOOD", [Color(0xFF3ee98a), Color(0xFF41f7c7)],
        angleInRadiansByTwo + userAngle + (2 * angleInRadians)));
    arcItems.add(ArcItem("BAD", [Color(0xFFfe0944), Color(0xFFfeae96)],
        angleInRadiansByTwo + userAngle + (3 * angleInRadians)));
    arcItems.add(ArcItem("UGH", [Color(0xFFF9D976), Color(0xfff39f86)],
        angleInRadiansByTwo + userAngle + (4 * angleInRadians)));
    arcItems.add(ArcItem("OK", [Color(0xFF21e1fa), Color(0xff3bb8fd)],
        angleInRadiansByTwo + userAngle + (5 * angleInRadians)));
    arcItems.add(ArcItem("GOOD", [Color(0xFF3ee98a), Color(0xFF41f7c7)],
        angleInRadiansByTwo + userAngle + (6 * angleInRadians)));
    arcItems.add(ArcItem("BAD", [Color(0xFFfe0944), Color(0xFFfeae96)],
        angleInRadiansByTwo + userAngle + (7 * angleInRadians)));


    animation = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation.addListener(() {
      userAngle = lerpDouble(animationStart, animationEnd, animation.value);
      setState(() {
        for (int i = 0; i < arcItems.length; i++) {
          arcItems[i].startAngle = angleInRadiansByTwo + userAngle +
              (i * angleInRadians);
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
      onPanEnd: (DragEndDetails details){

        //find top arc item with Magic!!
        bool rightToLeft = startingPoint.dx<endingPoint.dx;

//        Animate it from this values
        animationStart = userAngle;
        if(rightToLeft) {
          animationEnd +=angleInRadians;
          currentPosition--;
          if(currentPosition<0){
            currentPosition = arcItems.length-1;
          }
        }else{
          animationEnd -=angleInRadians;
          currentPosition++;
          if(currentPosition>=arcItems.length){
            currentPosition = 0;
          }
        }

        if(arcSelectedCallback!=null){
          arcSelectedCallback(currentPosition, arcItems[(currentPosition>=(arcItems.length-1))?0:currentPosition+1]);
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

// draw the arc and other stuff
class ChooserPainter extends CustomPainter {
  //debugging Paint
  final debugPaint = new Paint()
    ..color = Colors.red.withAlpha(100) //0xFFF9D976
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  final linePaint = new Paint()
    ..color = Colors.black.withAlpha(65) //0xFFF9D976
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.square;

  final whitePaint = new Paint()
    ..color = Colors.white //0xFFF9D976
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill;

  List<ArcItem> arcItems;
  double angleInRadians;
  double angleInRadiansByTwo;
  double angleInRadians1;
  double angleInRadians2;
  double angleInRadians3;
  double angleInRadians4;
  ChooserPainter(List<ArcItem> arcItems, double angleInRadians) {
    this.arcItems = arcItems;
    this.angleInRadians = angleInRadians;
    this.angleInRadiansByTwo = angleInRadians/2;

    angleInRadians1 = angleInRadians/6;
    angleInRadians2 = angleInRadians/3;
    angleInRadians3 = angleInRadians*4/6;
    angleInRadians4 = angleInRadians*5/6;

  }

  @override
  void paint(Canvas canvas, Size size) {
    //common calc
    double centerX = size.width / 2;
    double centerY = size.height * 1.6;
    Offset center = Offset(centerX, centerY);
    double radius = sqrt((size.width * size.width) / 2);

//    var mainRect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
//    canvas.drawRect(mainRect, debugPaint);

    //for white arc at bottom
    double leftX = centerX - radius;
    double topY = centerY - radius;
    double rightX = centerX + radius;
    double bottomY = centerY + radius;

    //for items
    double radiusItems = radius * 1.5;
    double leftX2 = centerX - radiusItems;
    double topY2 = centerY - radiusItems;
    double rightX2 = centerX + radiusItems;
    double bottomY2 = centerY + radiusItems;

    //for shadow
    double radiusShadow = radius*1.13;
    double leftX3 = centerX - radiusShadow;
    double topY3 = centerY - radiusShadow;
    double rightX3 = centerX + radiusShadow;
    double bottomY3 = centerY + radiusShadow;

    double radiusText = radius * 1.30;
    double radius4 = radius * 1.12;
    double radius5 = radius * 1.06;
    var arcRect = Rect.fromLTRB(leftX2, topY2, rightX2, bottomY2);


    var dummyRect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    canvas.clipRect(dummyRect, clipOp: ClipOp.intersect);

    for (int i = 0; i < arcItems.length; i++) {
      canvas.drawArc(
          arcRect,
          arcItems[i].startAngle,
          angleInRadians,
          true,
          new Paint()
            ..style = PaintingStyle.fill
            ..shader = new LinearGradient(
              colors: arcItems[i].colors,
            ).createShader(dummyRect));



      //Draw text
      TextSpan span = new TextSpan(style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 32.0, color: Colors.white), text: arcItems[i].text);
      TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr,);
      tp.layout();

      //find additional angle to make text in center
      double f = tp.width/2;
      double t = sqrt((radiusText*radiusText) + (f*f));

      double additionalAngle = acos(((t*t) + (radiusText*radiusText)-(f*f))/(2*t*radiusText));

      double tX = center.dx + radiusText*cos(arcItems[i].startAngle+angleInRadiansByTwo - additionalAngle);// - (tp.width/2);
      double tY = center.dy + radiusText*sin(arcItems[i].startAngle+angleInRadiansByTwo - additionalAngle);// - (tp.height/2);

      canvas.save();
      canvas.translate(tX,tY);
//      canvas.rotate(arcItems[i].startAngle + angleInRadiansByTwo);
      canvas.rotate(arcItems[i].startAngle+angleInRadians+angleInRadians+angleInRadiansByTwo);
      tp.paint(canvas, new Offset(0.0,0.0));
      canvas.restore();


      //big lines
      canvas.drawLine(
          new Offset(center.dx + radius4*cos(arcItems[i].startAngle), center.dy + radius4*sin(arcItems[i].startAngle)),
          center,
          linePaint);

      canvas.drawLine(
          new Offset(center.dx + radius4*cos(arcItems[i].startAngle+angleInRadiansByTwo), center.dy + radius4*sin(arcItems[i].startAngle+angleInRadiansByTwo)),
          center,
          linePaint);

      //small lines
      canvas.drawLine(
          new Offset(center.dx + radius5*cos(arcItems[i].startAngle+angleInRadians1), center.dy + radius5*sin(arcItems[i].startAngle+angleInRadians1)),
          center,
          linePaint);

      canvas.drawLine(
          new Offset(center.dx + radius5*cos(arcItems[i].startAngle+angleInRadians2), center.dy + radius5*sin(arcItems[i].startAngle+angleInRadians2)),
          center,
          linePaint);

      canvas.drawLine(
          new Offset(center.dx + radius5*cos(arcItems[i].startAngle+angleInRadians3), center.dy + radius5*sin(arcItems[i].startAngle+angleInRadians3)),
          center,
          linePaint);

      canvas.drawLine(
          new Offset(center.dx + radius5*cos(arcItems[i].startAngle+angleInRadians4), center.dy + radius5*sin(arcItems[i].startAngle+angleInRadians4)),
          center,
          linePaint);
    }


    //shadow
    Path shadowPath = new Path();
    shadowPath.addArc(
        Rect.fromLTRB(leftX3, topY3, rightX3, bottomY3),
        ChooserState.degreeToRadians(180.0),
        ChooserState.degreeToRadians(180.0));
    canvas.drawShadow(shadowPath, Colors.black, 18.0, true);

    //bottom white arc
    canvas.drawArc(
        Rect.fromLTRB(leftX, topY, rightX, bottomY),
        ChooserState.degreeToRadians(180.0),
        ChooserState.degreeToRadians(180.0),
        true,
        whitePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

typedef void ArcSelectedCallback(int position, ArcItem arcitem);

class ArcItem {
  String text;
  List<Color> colors;
  double startAngle;

  ArcItem(this.text, this.colors, this.startAngle);
}