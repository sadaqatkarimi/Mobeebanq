import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class scanCard extends StatefulWidget {
  @override
  _scanCardState createState() => new _scanCardState();
}

class _scanCardState extends State<scanCard> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    String platformVersion;
    Map<String, dynamic> details;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = "";
      details = await CoreCardIo.scanCard({
        "hideCardIOLogo": true,
        "requireExpiry": true,
        "scanExpiry": true,
        "requireCVV": true,
        "requireCardHolderName": true
      });
      print(details);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('CardIO sample app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}

class CoreCardIo {
  static const MethodChannel _channel =
  const MethodChannel('core_card_io');

  static Future<dynamic> scanCard(Map<String, dynamic> args) {
    return _channel.invokeMethod('scanCard', args);
  }
}