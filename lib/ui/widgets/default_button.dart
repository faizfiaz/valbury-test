import 'package:flutter/material.dart';
import 'package:terkelola/constants/colors.dart';

class DefaultButton {
  static Widget redButton(
      BuildContext context, String text, VoidCallback callback) {
    return Container(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primary)
          ),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          onPressed: () => callback.call()),
    );
  }

  static Widget redButtonSmall(
      BuildContext context, String text, VoidCallback callback) {
    return Container(
      height: 42,
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          onPressed: () => callback.call()),
    );
  }

  static Widget redButtonSmallLongWidth(
      BuildContext context, String text, VoidCallback? callback) {
    return Container(
      width: 200,
      height: 42,
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          onPressed: callback == null ? null : () => callback.call()),
    );
  }

  static Widget redButtonVerySmall(
      BuildContext context, String text, VoidCallback callback) {
    return Container(
      height: 32,
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          onPressed: () => callback.call()),
    );
  }

  static Widget whiteButtonSmall(
      BuildContext context, String text, VoidCallback callback) {
    return Container(
      height: 30,
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
          ),
          onPressed: () => callback.call()),
    );
  }
}
