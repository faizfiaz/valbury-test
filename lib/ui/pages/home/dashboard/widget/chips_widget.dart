import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/styles.dart';
import 'package:valburytest/model/entity/chips.dart';

class ChipsWidget extends StatefulWidget {
  final List<Chips> data;
  late bool isLoading;
  late BaseStateWidget<ChipsWidget> stateWidget;
  final Function(int id) chipListener;

  ChipsWidget(
      {required this.data,
      required this.isLoading,
      required this.chipListener});

  @override
  State<StatefulWidget> createState() {
    stateWidget = _ChipsWidget();
    return stateWidget;
  }

  void addData(List<Chips> dummyChips) {
    data.addAll(dummyChips);
    isLoading = false;
    stateWidget.refreshState();
  }
}

class _ChipsWidget extends BaseStateWidget<ChipsWidget> {

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
      height: 30,
      child: ListView.builder(
        controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return renderItemChip(index, widget.data[index]);
          }),
    );
  }

  Widget skeletonWidget() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
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
                  width: 120,
                  height: 0,
                  color: Colors.grey,
                ),
              ),
            );
          }),
    );
  }

  Widget renderItemChip(int index, Chips data) {
    return InkWell(
      onTap: () => selectData(data.id),
      child: Card(
          margin: EdgeInsets.only(
              left: index == 0 ? 20 : 0, right: index == 9 ? 20 : 10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: data.isSelected ? primary : primaryText, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Text(
                widget.data[index].name,
                style: data.isSelected
                    ? BaseStyle.textSemiBoldPrimary12
                    : BaseStyle.textSemiBold12,
              ),
            ),
          )),
    );
  }

  void selectData(int id) {
    setState(() {
      widget.data.forEach((element) {
        element.isSelected = element.id == id;
      });
    });
    widget.chipListener.call(id);
  }
}
