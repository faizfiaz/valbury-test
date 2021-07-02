import 'package:terkelola/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarCustom {
  static Widget buildAppBar(BuildContext context, title) {
    return AppBar(
      backgroundColor: primary,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      leading: IconButton(
        iconSize: 28,
        icon: Icon(Feather.chevron_left, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  static Widget buildAppBarInverse(BuildContext context, title) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      brightness: Brightness.light,
      titleSpacing: 0,
      elevation: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: primary, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      leading: IconButton(
        iconSize: 28,
        icon: Icon(Feather.chevron_left, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  static Widget buildAppBarNoTitleTrans(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        iconSize: 28,
        icon: Icon(Feather.chevron_left, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  static Widget trans() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
