import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobeebanq/views/detailsSummary.dart';

import 'IdCardScanResult.dart';
class FacePage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<FacePage> {
  /// Variables
  File imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan Card"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _pickImageFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )));
  }


  Future<Null> _pickImageFromCamera() async {
    File imageFile;
    try {
      imageFile = await ImagePicker.pickImage(source: ImageSource.camera)
          .then((picture) {
        return picture; // I found this .then necessary
      });
    } catch (eror) {
      print('error taking picture ${eror.toString()}');
    }
    setState(() {
      this.imageFile = imageFile;
      Navigator.of(context).push(
          MaterialPageRoute(builder: (Context) => IdCadScanResult()));
    });
  }


}