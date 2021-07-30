import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/constants/styles.dart';
import 'package:terkelola/ui/pages/home/dashboard/widget/news_list_widget.dart';
import 'package:terkelola/ui/pages/home/dashboard/widget/promo_list_widget.dart';
import 'package:terkelola/ui/widgets/circle_badge_number.dart';
import 'package:terkelola/ui/widgets/colored_safe_area.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';

import 'dashboard_navigator.dart';
import 'dashboard_view_model.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen();

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreen();
  }
}

class _DashboardScreen extends BaseStateWidget<DashboardScreen>
    implements DashboardNavigator {
  late DashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DashboardViewModel().setView(this) as DashboardViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<DashboardViewModel>(
        create: (context) => _viewModel,
        child: Consumer<DashboardViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  backgroundColor: white,
                  body: ColoredSafeArea(
                    color: primary,
                    child: Container(
                      color: white,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                buildToolbar(),
                                buildContent(),
                              ],
                            ),
                          ),
                          viewModel.isLoading ? LoadingIndicator() : Container()
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget buildToolbar() {
    return Container(
      width: double.infinity,
      height: AppBar().preferredSize.height,
      color: primary,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            icLogo,
            width: 140,
          ),
          Expanded(child: SizedBox()),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 2, top: 2),
                child: SvgPicture.asset(icNotificationHome),
              ),
              CircleBadgeNumber(
                number: 6,
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          SvgPicture.asset(
            bgHomeOval,
            width: double.infinity,
            height: 300,
            fit: BoxFit.fitHeight,
          ),
          topContent(),
          Container(
              margin: EdgeInsets.only(top: 225), child: buildMainContent())
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [buildMenu(), promoSection(), newsSection(), terkelolaSection(), SizedBox(height: 20,)],
      ),
    );
  }

  Widget buildMenu() {
    return Card(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Container(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            itemMenu(icThunder, "Listrik"),
            itemMenu(icPhone, "Pulsa"),
            itemMenu(icWater, "Air"),
            itemMenu(icInternet, "Internet"),
            itemMenu(icOtherMenuPPOB, "Lainnya"),
          ],
        ),
      ),
    );
  }

  Widget itemMenu(String icon, String text) {
    return InkWell(
      onTap: () => print("menuClicked"),
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 14),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: BaseStyle.textRegular12,
            )
          ],
        ),
      ),
    );
  }

  Widget topContent() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icHomePlace,
                width: 18,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Perumahan Permai Indah",
                style: BaseStyle.textRegularWhite14,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Halo Faiz, Iuran Tagihan Anda bulan ini",
            style: BaseStyle.textSemiBoldWhite18,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Rp. 150.000",
            style: BaseStyle.textRegularWhite18,
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () => print("clicked "),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bayar",
                  style: BaseStyle.textSemiBoldPrimary16,
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.chevron_right,
                  color: primary,
                )
              ],
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(white),
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 16, right: 6, top: 6, bottom: 6))),
          ),
        ],
      ),
    );
  }

  Widget promoSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleSection("Promo"),
          // PromoListWidget(data: [], isLoading: true)
        ],
      ),
    );
  }

  Widget titleSection(String text) {
    return Container(
      margin:EdgeInsets.only(left: 24, bottom: 6),
      child: Text(
        text,
        style: BaseStyle.textBold16,
      ),
    );
  }

  newsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleSection("Berita"),
          // NewsListWidget(data: [], isLoading: true)
        ],
      ),
    );
  }

  Widget terkelolaSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleSection("Lebih dekat dengan Terkelola"),
          // NewsListWidget(data: [], isLoading: true)
        ],
      ),
    );
  }
}
