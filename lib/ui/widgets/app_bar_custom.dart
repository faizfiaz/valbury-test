import 'package:flutter/material.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/styles.dart';

class AppBarCustom {
  static Widget buildAppBar(BuildContext context, title) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 1,
      leadingWidth: 64,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: BaseStyle.textBold20,
      ),
      leading: IconButton(
        iconSize: 28,
        icon: Icon(Icons.arrow_back, color: primaryText),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  static Widget buildAppBarActionText(
      BuildContext context, title, actionImage, Function() listener) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 1,
      leadingWidth: 64,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: BaseStyle.textBold20,
      ),
      leading: IconButton(
        iconSize: 28,
        icon: Icon(Icons.arrow_back, color: primaryText),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Center(
            child: IconButton(
              iconSize: 24,
              icon: Icon(actionImage, color: Colors.green),
              onPressed: () => Navigator.of(context).pop(),
            ))
      ],
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
