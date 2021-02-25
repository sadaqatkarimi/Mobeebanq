import 'package:flutter/material.dart';

class numberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width/1.3,
      child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.phone,

          cursorColor: Colors.grey,
          cursorWidth: 1,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400),
          decoration: new InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF1F1F1))
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF1F1F1))
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF1F1F1))
            ),
            hintText: "Enter your mobile number",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14
            ),
            contentPadding: EdgeInsets.only(bottom:5.0,left: 6),
            isDense: true,
          )),
    );
  }
}
