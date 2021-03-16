import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'map.dart';
import 'paymentHistory.dart';

class selectOption extends StatefulWidget {
  @override
  _selectOptionState createState() => new _selectOptionState();
}

class _selectOptionState extends State<selectOption> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (Context) => paymentHistory()));
                },
                child: Text("Payment History"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (Context) => mapView()));
                },
                child: Text("Map view"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
