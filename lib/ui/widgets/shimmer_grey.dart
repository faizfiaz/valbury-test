import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valburytest/constants/colors.dart';

class ShimmerGrey extends StatelessWidget {
  final double width;
  final double height;

  ShimmerGrey([this.width = 200, this.height = 120]);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyDummy,
      highlightColor: greyLine,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
    );
  }
}
