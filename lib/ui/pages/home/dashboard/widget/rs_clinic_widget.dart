import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/styles.dart';
import 'package:valburytest/model/entity/chips.dart';
import 'package:valburytest/model/entity/rs_clinic.dart';
import 'package:valburytest/ui/widgets/shimmer_grey.dart';

class RSClinicWidget extends StatefulWidget {
  final List<RSClinic> data;
  late bool isLoading;
  late BaseStateWidget<RSClinicWidget> stateWidget;
  final Function(int id) listener;

  RSClinicWidget(
      {required this.data, required this.isLoading, required this.listener});

  @override
  State<StatefulWidget> createState() {
    stateWidget = _RSClinicWidget();
    return stateWidget;
  }

  void addData(List<RSClinic> dummyRSClinic) {
    data.clear();
    data.addAll(dummyRSClinic);
    isLoading = false;
    stateWidget.refreshState();
  }

  void showLoading() {
    isLoading = true;
    stateWidget.refreshState();
  }
}

class _RSClinicWidget extends BaseStateWidget<RSClinicWidget> {
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
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return renderItem(index, widget.data[index]);
        });
  }

  Widget skeletonWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin:
                EdgeInsets.only(top: index == 0 ? 0 : 10, left: 20, right: 20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: ShimmerGrey(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Container(width: 120, height: 20, child: ShimmerGrey()),
                      SizedBox(
                        height: 8,
                      ),
                      Container(width: 120, height: 20, child: ShimmerGrey()),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 60,
                    height: 20,
                    child: ShimmerGrey(),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget renderItem(int index, RSClinic data) {
    return Card(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 10, left: 20, right: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset(
                data.pictureUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      data.name,
                      style: BaseStyle.textSemiBold14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      data.address,
                      style: BaseStyle.textRegular11,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => widget.listener.call(data.id),
              child: Text("Lihat Data", style: BaseStyle.textSemiBoldPrimary12),
            )
          ],
        ),
      ),
    );
  }
}
