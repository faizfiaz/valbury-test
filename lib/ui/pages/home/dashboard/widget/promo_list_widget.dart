import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/constants/colors.dart';

class PromoListWidget extends StatefulWidget {
  final List<Object> data;
  final bool isLoading;

  PromoListWidget({required this.data, required this.isLoading});

  @override
  State<StatefulWidget> createState() {
    return _PromoListWidget();
  }
}

class _PromoListWidget extends BaseStateWidget<PromoListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? skeletonWidget() : renderListData();
  }

  Widget renderListData() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("asd");
        });
  }

  Widget skeletonWidget() {
    return SizedBox(
      height: 100,
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
              child: Shimmer.fromColors(
                baseColor: greyDummy,
                highlightColor: greyLine,
                child: Container(
                  width: 180,
                  height: 0,
                  color: Colors.grey,
                ),
              ),
            );
          }),
    );
  }
}
