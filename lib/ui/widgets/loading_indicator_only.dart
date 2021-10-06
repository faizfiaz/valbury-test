import 'package:valburytest/constants/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: white,
            valueColor: new AlwaysStoppedAnimation<Color>(primary),
          ),
        ],
      )),
    );
  }
}
