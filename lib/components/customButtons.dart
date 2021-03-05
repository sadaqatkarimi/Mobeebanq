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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton(
        elevation: 5,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: CircleBorder(),
        color: basicColor,
        textColor: colorss,
        padding: EdgeInsets.all(1.0),
        onPressed: onPressed,


        child: iconss,
      ),
    );
  }
}
class mapButton extends StatelessWidget {


  mapButton({@required this.onPressed, this.iconss,this.focusColor,this.disbaleColor,this.colorss});
  final GestureTapCallback onPressed;
  final Icon iconss;
  final Color focusColor, disbaleColor,colorss;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/7,
      height: MediaQuery.of(context).size.height/16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton(
        elevation: 5,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: CircleBorder(),
        color: Colors.white,
        textColor: colorss,
        padding: EdgeInsets.all(1.0),
        onPressed: onPressed,


        child: iconss,
      ),
    );
  }
}
class mapButton1 extends StatelessWidget {


  mapButton1({@required this.onPressed, this.iconss,this.focusColor,this.disbaleColor,this.colorss});
  final GestureTapCallback onPressed;
  final Image iconss;
  final Color focusColor, disbaleColor,colorss;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/7,
      height: MediaQuery.of(context).size.height/16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton(
        elevation: 5,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: CircleBorder(),
        color: Colors.white,
        textColor: colorss,
        padding: EdgeInsets.all(1.0),
        onPressed: onPressed,


        child: iconss,
      ),
    );
  }
}

class customButton extends StatelessWidget {


  customButton({@required this.onPressed, this.text,this.focusColor,this.disbaleColor,this.colors});
  final GestureTapCallback onPressed;
  final Text text;
  final Color focusColor, disbaleColor,colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.6,
      height: MediaQuery.of(context).size.height/18,
      child: RaisedButton(
        elevation: 2,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          // side: BorderSide(
          //   color: button1,
          // )
        ),
        color: basicColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,


        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text,

          ],
        ),
      ),
    );
  }
}