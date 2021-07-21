import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class BaseStyle {
  /*Text Style*/
  static const textRegular16 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: primaryText);

  static const textSemiBold16 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: primaryText);

  static const textBold28 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: primaryText);
  static const textBold32 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: primaryText);

  /*TextField Padding*/
  static const defaultPaddingTextField =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 18);

  /*Border Style*/
  static const defaultBorderTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: greyLine, width: 1));

  static const defaultBorderFocusedTextField = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: secondary, width: 1));
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
