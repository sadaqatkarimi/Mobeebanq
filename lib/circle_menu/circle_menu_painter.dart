import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobeebanq/constants.dart';
import 'menu_item.dart';
import 'utils.dart';

class CircleMenuPainter extends CustomPainter {
  final double currentPoint;
  final bool shouldDraw;
  final List<MenuItem> icons;
  final Offset selectedMenuPoint;
  final Function(MenuItem item, int index) onItemClicked;
  final Function() onDrawFinished;
  MenuItem _menuItem;
  CircleMenuPainter(
      {@required this.currentPoint,
      @required this.shouldDraw,
      @required this.icons,
      @required this.selectedMenuPoint,
      this.onItemClicked,
      @required this.onDrawFinished});
  @override
  void paint(Canvas canvas, Size size) {
    if (size.width != 0 && size.height != 0) {
      final radius = min(size.height, size.width) * 0.8;

      final drawPoint = Offset(size.width, size.height);

      double rotateDegree = ((currentPoint * 90) / radius);

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5
        ..color = Colors.white;

      bool isPressed = false;

      var selectedIndex = -1;

      final n = icons.length;

      final eachDegree = 360 / n;
      paint
        ..color = yelowColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(drawPoint, radius, paint);

      for (var i = 0; i < n; i++) {
        final degree = eachDegree * i;
        final radian = Utils.degreeToRadian(degree + rotateDegree);

        final endPoint = Offset(cos(radian) * (radius + radius * 0.001 - 30),
                sin(radian) * (radius + radius * 0.001 - 30)) +
            drawPoint;

        final path = Path()
          ..addOval(Rect.fromCircle(center: endPoint, radius: 23));

        paint.color = basicColor;

        if (selectedMenuPoint != null && path.contains(selectedMenuPoint)) {
          paint.color = Colors.purple[800];
          _menuItem = icons[i];

          isPressed = true;
          selectedIndex = i;
        }
        canvas.drawPath(path, paint);

        Utils.drawIcon(canvas, icons[i].iconData, endPoint - Offset(15, 15),
            color: paint.color);
      }

      if (isPressed) {
        if (onItemClicked != null) {
          onItemClicked(_menuItem, selectedIndex);
        }
      }
      onDrawFinished();
    }
  }

  @override
  bool shouldRepaint(CircleMenuPainter oldDelegate) {
    return shouldDraw;
  }
}
