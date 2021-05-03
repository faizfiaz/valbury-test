import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;

  @override
  // TODO: implement hasPrimaryFocus
  bool get hasPrimaryFocus => false;
}