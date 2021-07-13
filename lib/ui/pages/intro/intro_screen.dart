import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:terkelola/commons/screen_utils.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/ui/pages/login/login_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Bayar Iuran Dengan Mudah",
          body:
              "Pilihan Pembayaran yang bervariasi memudahkan Anda dalam membayar iuran kepada Pengelola Anda",
          image: SvgPicture.asset(imageIntro1, width: ScreenUtils.getScreenWidth(context) - 80,),
          decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: primary),
              bodyTextStyle: TextStyle(fontSize: 14),
              contentMargin: EdgeInsets.only(left: 24, right: 24)),
        ),
        PageViewModel(
          title: "Pengingat Iuran",
          body:
              "Tidak ada lagi kata terlambat dalam pembayaran iuran, kami akan mengingatkan Anda jika sudah waktunya untuk pembayaran",
          image: SvgPicture.asset(imageIntro2, width: ScreenUtils.getScreenWidth(context) - 80,),
          decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: primary),
              bodyTextStyle: TextStyle(fontSize: 14),
              contentMargin: EdgeInsets.only(left: 24, right: 24)),
        ),
        PageViewModel(
          title: "PPOB Dalam Genggaman Anda",
          body:
              "Beli Kebutuhan rumah Anda dengan mudah, seperti Token Listrik, PDAM, Telkom dan banyak lagi",
          image: SvgPicture.asset(imageIntro3, width: ScreenUtils.getScreenWidth(context) - 80,),
          decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: primary),
              bodyTextStyle: TextStyle(fontSize: 14),
              contentMargin: EdgeInsets.only(left: 24, right: 24)),
        ),
      ],
      onDone: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()),
            (r) => false);
      },
      showNextButton: true,
      showSkipButton: true,
          curve: Curves.bounceIn,
      dotsDecorator: DotsDecorator(activeColor: primary),
      skip: Text("Skip", style: TextStyle(fontWeight: FontWeight.w400)),
      skipColor: secondary,
      next: Text("Next", style: TextStyle(fontWeight: FontWeight.w700)),
      nextColor: primary,
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      doneColor: primary,
    ));
  }
}
