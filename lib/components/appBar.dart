import 'package:flutter/material.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/constants.dart';

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