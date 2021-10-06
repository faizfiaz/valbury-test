import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/constants/styles.dart';
import 'package:valburytest/routes.dart';
import 'package:valburytest/ui/widgets/loading_indicator.dart';

import 'profile_navigator.dart';
import 'profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  // ignore: must_be_immutable

  ProfileScreen();

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends BaseStateWidget<ProfileScreen>
    implements ProfileNavigator {
  late ProfileViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ProfileViewModel().setView(this) as ProfileViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ProfileViewModel>(
        create: (context) => _viewModel,
        child: Consumer<ProfileViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  backgroundColor: white,
                  body: SafeArea(
                    child: Container(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                              child: Container(
                                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTopContent(),
                              SizedBox(
                                height: 12,
                              ),
                              buildInfoMenu(),
                              buildHelpMenu(),
                              buildAboutMenu()
                            ],
                          ))),
                          viewModel.isLoading ? LoadingIndicator() : Container()
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget buildTopContent() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profil",
            style: BaseStyle.textBold18,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  dummyUser3,
                  height: 64,
                  width: 64,
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "M Dimas Faizin",
                      style: BaseStyle.textBold14,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Junior Trader",
                      style: BaseStyle.textLight14,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            height: 0.5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget buildInfoMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget("Informasi"),
        SizedBox(
          height: 8,
        ),
        menuItem("Akun", icProfile, () => openAccountSetting()),
        menuItem("Atur Notifikasi", icRemind, () => openAccountSetting()),
        menuItem("Ganti Password", icPassword, () => openAccountSetting())
      ],
    );
  }

  Widget buildHelpMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        titleWidget("Bantuan"),
        SizedBox(
          height: 8,
        ),
        menuItem("Panduan", icGuides, () => openAccountSetting()),
        menuItem("Chat", icChat, () => openAccountSetting()),
        menuItem("Call Center", icCallCenter, () => openAccountSetting()),
        buildChangeLanguageMenu()
      ],
    );
  }

  Widget buildAboutMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        titleWidget("Tentang"),
        SizedBox(
          height: 8,
        ),
        versionWidget(),
        logoutWidget(),
      ],
    );
  }

  Widget titleWidget(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: BaseStyle.textSecondaryRegular14,
      ),
    );
  }

  openAccountSetting() {
    print("menu");
  }

  Widget menuItem(String title, String icon, Function() action) {
    return InkWell(
      onTap: () => action.call(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(
              title,
              style: BaseStyle.textRegular14,
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: primaryText,
            )
          ],
        ),
      ),
    );
  }

  Widget versionWidget() {
    return InkWell(
      onTap: () => print("Version Menu"),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
        child: Row(
          children: [
            SvgPicture.asset(
              icInfo,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(
              "Versi Apps",
              style: BaseStyle.textRegular14,
            ),
            Expanded(child: SizedBox()),
            Text(dotenv.env['VERSION_NAME']! +
                (dotenv.env['CURRENT_ENV'] == "0" ? "-DEV" : ""), style: BaseStyle.textSecondaryRegular14,)
          ],
        ),
      ),
    );
  }

  Widget logoutWidget(){
    return InkWell(
      onTap: () => _viewModel.doLogout(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
        child: Row(
          children: [
            SvgPicture.asset(
              icLogout,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(
              "Logout",
              style: BaseStyle.textRegularPrimary14,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToLogin() {
    navigatePage(loginRN, clearBackStack: true);
  }

  Widget buildChangeLanguageMenu() {
    return InkWell(
      onTap: () => _viewModel.changeLanguage(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
        child: Row(
          children: [
            SvgPicture.asset(
              icLanguage,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(
              "Ganti Bahasa",
              style: BaseStyle.textRegular14,
            ),
            Expanded(child: SizedBox()),
            Text(
              txt("current_language"),
              style: BaseStyle.textSemiBoldPrimary16,
            ),
          ],
        ),
      ),
    );

  }
}
