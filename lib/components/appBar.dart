import 'package:flutter/material.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/paymentHistory.dart';
import 'package:mobeebanq/views/selectOption.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String appbarText;
  CustomAppBar(
      this.appbarText,
      );

  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: basicColor,
      title: Text(appbarText,style: CustomTextStyle.title(context),),
      automaticallyImplyLeading: false,

    );
  }
}

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {

  // final String appbarText;
  // GeneralAppBar(
  //     this.appbarText,
  //     );

  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (Context) => selectOption()));
              },
              child: Image.asset("icons/menu.png")
            )
        ),
      ],
      // elevation: 0,
      // centerTitle: true,
      // backgroundColor: basicColor,

      // title:
      // automaticallyImplyLeading: false,

    );
  }
}