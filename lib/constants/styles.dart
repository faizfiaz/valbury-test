import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class BaseStyle {
  static const textBold28 = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: primaryText);
  static const textRegular16 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: primaryText);

  // static textFieldIconDefault (IconData iconData, String image, text) {
  //   InputDecoration(
  //       contentPadding:
  //       const EdgeInsets.symmetric(vertical: 14.0),
  //       prefixIcon: Container(
  //         margin: EdgeInsets.only(
  //             right: 16, left: 16, top: 4, bottom: 4),
  //         padding: EdgeInsets.only(right: 10),
  //         child: Icon(
  //           Icons.email_rounded,
  //           color: primary,
  //           size: 18,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: secondary, width: 0.5)),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide:
  //           BorderSide(color: primaryText, width: 0.5)),
  //       border: OutlineInputBorder(
  //           borderSide:
  //           BorderSide(color: primaryText, width: 0.5)),
  //       hintText: "Email",
  //       errorText: _viewModel.errorEmail
  //           ? txt("email_not_valid")
  //           : null);
  // }

}
