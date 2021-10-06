import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: whiteTrans,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: white,
            valueColor: new AlwaysStoppedAnimation<Color>(primary),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            txt("loading_text"),
            style: TextStyle(color: primary),
          )
        ],
      )),
    );
  }
}
