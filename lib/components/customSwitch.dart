library custom_switch;

import 'dart:math';

import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor,unactiveColor;
  final double myheight;
  final double mywidth;

  const CustomSwitch({Key key, this.value,
    this.onChanged,
    this.activeColor,
    this.unactiveColor,
    this.myheight,
    this.mywidth
  })
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _circleAnimation = AlignmentTween(

        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi/2,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(

            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();

              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              width: widget.mywidth,
              height: widget.myheight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: _circleAnimation.value == Alignment.centerLeft
                      ? widget.unactiveColor
                      : widget.activeColor),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _circleAnimation.value == Alignment.centerRight
                        ? Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 4.0),
                      child: Transform.rotate(
                          angle: pi*18/12,
                          child: Icon(Icons.lock_rounded,color: Colors.white,))
                    )
                        : Container(),
                    Align(
                      alignment: _circleAnimation.value,
                      child: Transform.rotate(
                        angle: pi*18/12,
                        child: Container(
                          width: 60.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: _circleAnimation.value == Alignment.centerLeft
                                ? AssetImage("images/switchOn.png")
                                : AssetImage("images/switchOff.png"),
                              // fit: BoxFit.fill,
                              scale: 1
                            ),
                              // shape: BoxShape.circle, color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    _circleAnimation.value == Alignment.centerLeft
                        ? Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 18.0),
                      child: Transform.rotate(
                          angle: pi*18/12,
                          child: Icon(Icons.lock_open,color: Color(0xff38E4AA),)),
                    )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
