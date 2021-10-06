import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:valburytest/constants/colors.dart';

class VersionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(20),
      child: Text(
        "App Version " +
            dotenv.env['VERSION_NAME']! +
            (dotenv.env['CURRENT_ENV'] == "0" ? "-DEV" : ""),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: tertiary,
        ),
      ),
    );
  }
}
