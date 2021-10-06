import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class BaseStyle {
  /// region property
  static const lightWeight = FontWeight.w300;
  static const regularWeight = FontWeight.w400;
  static const semiBoldWeight = FontWeight.w600;
  static const boldWeight = FontWeight.bold;

  /// endregion

  /// region text light
  static const textLight12 =
      TextStyle(fontWeight: lightWeight, fontSize: 12, color: primaryText);
  static const textLight14 =
      TextStyle(fontWeight: lightWeight, fontSize: 14, color: primaryText);

  /// endregion

  /// region text regular
  static const textRegular11 =
  TextStyle(fontWeight: regularWeight, fontSize: 11, color: primaryText);
  static const textRegular12 =
      TextStyle(fontWeight: regularWeight, fontSize: 12, color: primaryText);
  static const textRegular14 =
      TextStyle(fontWeight: regularWeight, fontSize: 14, color: primaryText);
  static const textRegular16 =
      TextStyle(fontWeight: regularWeight, fontSize: 16, color: primaryText);

  static const textRegularPrimary14 =
      TextStyle(fontWeight: regularWeight, fontSize: 14, color: primary);
  static const textRegularPrimary16 =
      TextStyle(fontWeight: regularWeight, fontSize: 16, color: primary);

  static const textSecondaryRegular12 =
      TextStyle(fontWeight: regularWeight, fontSize: 12, color: secondaryText);
  static const textSecondaryRegular14 =
      TextStyle(fontWeight: regularWeight, fontSize: 14, color: secondaryText);

  static const textRegularWhite12 =
      TextStyle(fontWeight: regularWeight, fontSize: 12, color: white);
  static const textRegularWhite14 =
      TextStyle(fontWeight: regularWeight, fontSize: 14, color: white);
  static const textRegularWhite16 =
      TextStyle(fontWeight: regularWeight, fontSize: 16, color: white);
  static const textRegularWhite18 =
      TextStyle(fontWeight: regularWeight, fontSize: 18, color: white);

  /// endregion text regular

  /// region text semi bold
  static TextStyle textSemiBoldCustom(
      {Color color = primaryText, double fontSize = 16}) {
    return TextStyle(
        fontWeight: semiBoldWeight, fontSize: fontSize, color: color);
  }

  static const textSemiBold12 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 12, color: primaryText);
  static const textSemiBold14 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 14, color: primaryText);
  static const textSemiBold16 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 16, color: primaryText);
  static const textSemiBold18 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 18, color: primaryText);

  static const textSemiBoldPrimary12 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 12, color: primary);
  static const textSemiBoldPrimary16 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 16, color: primary);

  static const textSemiBoldWhite16 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 16, color: white);
  static const textSemiBoldWhite18 =
      TextStyle(fontWeight: semiBoldWeight, fontSize: 18, color: white);

  /// endregion

  /// region text bold
  static const textBold12 =
      TextStyle(fontWeight: boldWeight, fontSize: 12, color: primaryText);
  static const textBold14 =
      TextStyle(fontWeight: boldWeight, fontSize: 14, color: primaryText);
  static const textBold16 =
      TextStyle(fontWeight: boldWeight, fontSize: 16, color: primaryText);
  static const textBold18 =
      TextStyle(fontWeight: boldWeight, fontSize: 18, color: primaryText);
  static const textBold20 =
      TextStyle(fontWeight: boldWeight, fontSize: 20, color: primaryText);
  static const textBold28 =
      TextStyle(fontWeight: boldWeight, fontSize: 28, color: primaryText);
  static const textBold32 =
      TextStyle(fontWeight: boldWeight, fontSize: 32, color: primaryText);

  /// endregion

  /// region textfield padding
  static const defaultPaddingTextField =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 18);

  /// endregion

  /// region border
  static const defaultBorderTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: greyLine, width: 1));

  static const defaultBorderFocusedTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: secondary, width: 1));

  /// endregion

}
