import 'package:flutter/material.dart';
import 'package:mobeebanq/constants.dart';

class walkthroghButton extends StatelessWidget {


  walkthroghButton({@required this.onPressed, this.iconss,this.focusColor,this.disbaleColor,this.colorss});
  final GestureTapCallback onPressed;
  final Icon iconss;
  final Color focusColor, disbaleColor,colorss;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/7,
      height: MediaQuery.of(context).size.height/16,
      child: RaisedButton(
        elevation: 5,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: BorderSide(
          //   color: button1,
          // )
        ),
        color: basicColor,
        textColor: colorss,
        padding: EdgeInsets.all(1.0),
        onPressed: onPressed,


        child: iconss,
      ),
    );
  }
}