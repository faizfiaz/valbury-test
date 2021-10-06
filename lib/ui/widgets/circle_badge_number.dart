import 'package:flutter/cupertino.dart';
import 'package:valburytest/constants/colors.dart';

class CircleBadgeNumber extends StatelessWidget {
  final double? diameterCircle;
  final Color? colorCircle;
  final Color? colorBorderCircle;
  final double? sizeText;
  final Color? colorText;
  final int number;
  final FontWeight? weightText;

  const CircleBadgeNumber(
      {Key? key,
      this.diameterCircle,
      this.colorCircle,
      this.colorBorderCircle,
      this.sizeText,
      this.colorText,
      required this.number,
      this.weightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: diameterCircle ?? (number < 99 ? 12: 16),
      height: diameterCircle ?? (number < 99 ? 12: 16),
      child: Text(
        number > 99 ? "99+" : number.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: sizeText ?? 7,
            fontWeight: weightText ?? FontWeight.w400,
            color: colorText ?? white),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: colorBorderCircle ?? white),
          shape: BoxShape.circle,
          color: colorCircle ?? black),
    );
  }
}
