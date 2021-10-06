import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/constants/styles.dart';
import 'package:valburytest/model/entity/services_menu.dart';
import 'package:valburytest/ui/widgets/loading_indicator.dart';

import 'services_navigator.dart';
import 'services_view_model.dart';

class ServicesScreen extends StatefulWidget {
  // ignore: must_be_immutable

  ServicesScreen();

  @override
  State<StatefulWidget> createState() {
    return _ServicesScreen();
  }
}

class _ServicesScreen extends BaseStateWidget<ServicesScreen>
    implements ServicesNavigator {
  late ServicesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ServicesViewModel().setView(this) as ServicesViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ServicesViewModel>(
        create: (context) => _viewModel,
        child: Consumer<ServicesViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  backgroundColor: white,
                  body: SafeArea(
                    child: Container(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                buildFavoritesWidget(),
                                buildSectionMenu("Tagihan", _viewModel.billsMenu),
                                buildSectionMenu("PPOB", _viewModel.ppobMenu),
                                buildSectionMenu("Surat Pengantar", _viewModel.coverLetterMenu),
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

  Widget buildFavoritesWidget() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Favorit",
                style: BaseStyle.textBold16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "(akan tampil di halaman home)",
                style: BaseStyle.textRegular12,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () => print("add"),
                      child: Container(
                          padding: EdgeInsets.all(18),
                          child: SvgPicture.asset(icAddFavorites))),
                  InkWell(
                      onTap: () => print("add"),
                      child: Container(
                          padding: EdgeInsets.all(18),
                          child: SvgPicture.asset(icAddFavorites))),
                  InkWell(
                      onTap: () => print("add"),
                      child: Container(
                          padding: EdgeInsets.all(18),
                          child: SvgPicture.asset(icAddFavorites))),
                  InkWell(
                      onTap: () => print("add"),
                      child: Container(
                          padding: EdgeInsets.all(18),
                          child: SvgPicture.asset(icAddFavorites)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSectionMenu(String title, List<ServicesMenu> serviceList) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BaseStyle.textBold16,
          ),
          SizedBox(
            height: 8,
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 4 / 3.5),
              itemCount: serviceList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return buildItemMenu(index, serviceList[index]);
              }),
        ],
      ),
    );
  }

  Widget buildItemMenu(int index, ServicesMenu servicesMenu) {
    return InkWell(
      onTap: () => print("clicked ${servicesMenu.action}"),
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(servicesMenu.icon),
              SizedBox(
                height: 4,
              ),
              Text(
                servicesMenu.name,
                style: BaseStyle.textRegular12,
              )
            ],
          )),
    );
  }
}
