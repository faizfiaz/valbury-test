import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/ui/pages/empty/empty_screen.dart';
import 'package:valburytest/ui/pages/home/dashboard/dashboard_screen.dart';
import 'package:valburytest/ui/pages/home/home_listener.dart';
import 'package:valburytest/ui/pages/home/profile/profile_screen.dart';
import 'package:valburytest/ui/pages/home/services/services_screen.dart';

import 'home_navigator.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseStateWidget<HomeScreen> implements HomeNavigator, HomeListener {
  late HomeViewModel _viewModel;

  final List<Widget> screens = [];
  PageController _pageController = PageController();
  int _indexPage = 0;

  @override
  void initState() {
    super.initState();
    screens.add(DashboardScreen(this));
    screens.add(ServicesScreen());
    screens.add(EmptyScreen());
    screens.add(ProfileScreen());

    _viewModel = HomeViewModel().setView(this) as HomeViewModel;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) => _viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) => Scaffold(
            backgroundColor: white,
            bottomNavigationBar: buildBottomBar(),
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _indexPage = index);
              },
              children: screens
            ),
          ),
        ));
  }

  static const double opacityInActive = 0.5;

  BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: _indexPage,
      onTap: (index) {
        scrollPageNow(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: Opacity(
              child: SvgPicture.asset(icHome),
              opacity: opacityInActive,
            ),
            activeIcon: SvgPicture.asset(icHome),
            label: "Beranda"),
        BottomNavigationBarItem(
            icon: Opacity(
              child: SvgPicture.asset(icPPOB),
              opacity: opacityInActive,
            ),
            activeIcon: SvgPicture.asset(icPPOB),
            label: "PPOB"),
        BottomNavigationBarItem(
            icon: Opacity(
              child: SvgPicture.asset(icHistory),
              opacity: opacityInActive,
            ),
            activeIcon: SvgPicture.asset(icHistory),
            label: "Riwayat Transaksi"),
        BottomNavigationBarItem(
            icon: Opacity(
              child: SvgPicture.asset(icProfile),
              opacity: opacityInActive,
            ),
            activeIcon: SvgPicture.asset(icProfile),
            label: "Akun"),
      ],
    );
  }

  @override
  onClickOthersPPOB() {
   scrollPageNow(1);
  }

  void scrollPageNow(int index) {
    setState(() {
      _indexPage = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInBack);
    });
  }
}
