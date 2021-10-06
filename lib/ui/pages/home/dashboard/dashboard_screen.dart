import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/commons/screen_utils.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/constants/styles.dart';
import 'package:valburytest/model/entity/banners.dart';
import 'package:valburytest/model/entity/chips.dart';
import 'package:valburytest/model/entity/rs_clinic.dart';
import 'package:valburytest/routes.dart';
import 'package:valburytest/ui/pages/home/dashboard/widget/banners_widget.dart';
import 'package:valburytest/ui/pages/home/dashboard/widget/chips_widget.dart';
import 'package:valburytest/ui/pages/home/dashboard/widget/rs_clinic_widget.dart';
import 'package:valburytest/ui/widgets/circle_badge_number.dart';
import 'package:valburytest/ui/widgets/colored_safe_area.dart';
import 'package:valburytest/ui/widgets/loading_indicator.dart';

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
    with SingleTickerProviderStateMixin
    implements DashboardNavigator {
  late DashboardViewModel _viewModel;

  late TabController tabController;

  late ChipsWidget _rsChips;
  late ChipsWidget _clinicChips;
  late RSClinicWidget _rsListWidget;
  late RSClinicWidget _clinicListWidget;
  late BannersWidget _bannersWidget;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _viewModel = DashboardViewModel().setView(this) as DashboardViewModel;
    initWidgets();
    _viewModel.getData();
  }

  void initWidgets() {
    _rsChips = ChipsWidget(
      data: [],
      isLoading: _viewModel.rsLoadingChip,
      chipListener: (id) {
        _rsListWidget.showLoading();
        _viewModel.reloadRsList(false, id);
      },
    );

    _rsListWidget = RSClinicWidget(
        data: [],
        isLoading: _viewModel.rsLoadingList,
        listener: (id) => {underConstructionFunction()});

    _clinicChips = ChipsWidget(
      data: [],
      isLoading: _viewModel.clinicLoadingChip,
      chipListener: (id) {
        _clinicListWidget.showLoading();
        _viewModel.reloadClinicList(false, id);
      },
    );

    _clinicListWidget = RSClinicWidget(
        data: [],
        isLoading: _viewModel.clinicLoadingList,
        listener: (id) => {underConstructionFunction()});

    _bannersWidget = BannersWidget(data: [],
        isLoading: true,
        listener: (id) => {underConstructionFunction()});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<DashboardViewModel>(
        create: (context) => _viewModel,
        child: Consumer<DashboardViewModel>(
            builder: (context, viewModel, _) =>
                ColoredSafeArea(
                  color: white,
                  child: Scaffold(
                    backgroundColor: white,
                    body: Container(
                      color: white,
                      child: Column(
                        children: [
                          buildToolbar(),
                          Expanded(
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [buildMainContent()],
                                  ),
                                ),
                                viewModel.isLoading
                                    ? LoadingIndicator()
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  //region widget
  Widget buildToolbar() {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Text(
                      "Valbury",
                      style: BaseStyle.textBold20,
                    )),
                Row(
                  children: [
                    Image.asset(
                      imgCompanyLogo,
                      width: 100,
                      height: 50,
                    ),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () => navigatePage(notificationRN),
                      child: Stack(
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
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TabBar(
            labelColor: primaryText,
            labelStyle: BaseStyle.textSemiBoldPrimary12,
            controller: tabController,
            tabs: [
              Tab(text: "Dashboard"),
              Tab(text: txt("chart")),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          rsSection(),
          SizedBox(height: 16,),
          _bannersWidget,
          clinicSection(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget rsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              titleSection(txt("hospital")),
              Expanded(child: SizedBox()),
              seeAllSection(txt("see_all"), () => underConstructionFunction())
            ],
          ),
          SizedBox(
            height: 8,
          ),
          _rsChips,
          SizedBox(height: 12,),
          _rsListWidget
        ],
      ),
    );
  }

  Widget clinicSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              titleSection(txt("clinic")),
              Expanded(child: SizedBox()),
              seeAllSection(txt("see_all"), () => underConstructionFunction())
            ],
          ),
          SizedBox(
            height: 8,
          ),
          _clinicChips,
          SizedBox(height: 12,),
          _clinicListWidget
        ],
      ),
    );
  }

  Widget titleSection(String text) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 6),
      child: Text(
        text,
        style: BaseStyle.textBold16,
      ),
    );
  }

  Widget seeAllSection(String text, Function() action) {
    return InkWell(
      onTap: () => action.call(),
      child: Container(
        margin: EdgeInsets.only(bottom: 6, right: 24),
        child: Text(
          text,
          style: BaseStyle.textSemiBold12,
        ),
      ),
    );
  }

  Widget bannerSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }

  //endregion

  underConstructionFunction() {
    ScreenUtils.showToastMessage(txt("under_construction"));
  }

  @override
  void populateRsChips(List<Chips> dummyChips) {
    _rsChips.addData(dummyChips);
  }

  @override
  void populateRsList(List<RSClinic> dummyRs) {
    _rsListWidget.addData(dummyRs);
  }

  @override
  void populateBannerList(List<Banners> dummyBanners) {
    _bannersWidget.addData(dummyBanners);
  }

  @override
  void populateClinicChips(List<Chips> dummyChips) {
    _clinicChips.addData(dummyChips);
  }

  @override
  void populateClinicList(List<RSClinic> dummyClinic) {
    _clinicListWidget.addData(dummyClinic);
  }
}
