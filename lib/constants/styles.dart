import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class BaseStyle {
  /// Text Style*/
  static const textRegular12 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: primaryText);
  static const textRegular14 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: primaryText);
  static const textRegular16 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: primaryText);

  static const textRegularPrimary16 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: primary);

  static const textSecondaryRegular12 = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 12, color: secondaryText);

  static const textRegularWhite12 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: white);
  static const textRegularWhite14 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: white);
  static const textRegularWhite16 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: white);
  static const textRegularWhite18 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: white);

  static TextStyle textSemiBoldCustom(
      {Color color = primaryText, double fontSize = 16}) {
    return TextStyle(
        fontWeight: FontWeight.w600, fontSize: fontSize, color: color);
  }

  static const textSemiBold16 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: primaryText);
  static const textSemiBold18 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: primaryText);

  static const textSemiBoldPrimary16 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: primary);

  static const textSemiBoldWhite16 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: white);
  static const textSemiBoldWhite18 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: white);

  static const textBold12 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryText);
  static const textBold14 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primaryText);
  static const textBold16 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryText);
  static const textBold20 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: primaryText);
  static const textBold28 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: primaryText);
  static const textBold32 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: primaryText);

  /// Text Style*/

  /// TextField Padding*/
  static const defaultPaddingTextField =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 18);

  /*Border Style*/
  static const defaultBorderTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: greyLine, width: 1));

  static const defaultBorderFocusedTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: secondary, width: 1));

  /// TextField Padding*/

}
