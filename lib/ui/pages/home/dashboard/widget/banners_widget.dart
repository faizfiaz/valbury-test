import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/commons/screen_utils.dart';
import 'package:valburytest/model/entity/banners.dart';
import 'package:valburytest/ui/widgets/shimmer_grey.dart';

class BannersWidget extends StatefulWidget {
  final List<Banners> data;
  late bool isLoading;
  late BaseStateWidget<BannersWidget> stateWidget;
  final Function(int id) listener;

  BannersWidget(
      {required this.data, required this.isLoading, required this.listener});

  @override
  State<StatefulWidget> createState() {
    stateWidget = _BannersWidget();
    return stateWidget;
  }

  void addData(List<Banners> dummyBanners) {
    data.clear();
    data.addAll(dummyBanners);
    isLoading = false;
    stateWidget.refreshState();
  }

  void showLoading() {
    isLoading = true;
    stateWidget.refreshState();
  }
}

class _BannersWidget extends BaseStateWidget<BannersWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading ? skeletonWidget() : renderListData();
  }

  Widget renderListData() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return renderItem(index, widget.data[index]);
          }),
    );
  }

  Widget skeletonWidget() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
                margin: EdgeInsets.only(
                    left: index == 0 ? 20 : 0, right: index == 9 ? 20 : 10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ShimmerGrey(260, 160));
          }),
    );
  }

  Widget renderItem(int index, Banners data) {
    return Card(
      margin: EdgeInsets.only(
          left: index == 0 ? 20 : 0, right: index == 9 ? 20 : 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
          width: ScreenUtils.getScreenWidth(context) - 120, height: 160, child: Image.asset(data.imageBanner, fit: BoxFit.cover,)),
    );
  }
}
