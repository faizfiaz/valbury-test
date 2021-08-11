import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/commons/image_utils.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/styles.dart';
import 'package:terkelola/ui/widgets/app_bar_custom.dart';
import 'package:terkelola/ui/widgets/default_button.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';

import 'notification_list_navigator.dart';
import 'notification_list_view_model.dart';

class NotificationListScreen extends StatefulWidget {
  // ignore: must_be_immutable

  NotificationListScreen();

  @override
  State<StatefulWidget> createState() {
    return _NotificationListScreen();
  }
}

class _NotificationListScreen extends BaseStateWidget<NotificationListScreen>
    implements NotificationListNavigator {
  late NotificationListViewModel _viewModel;

  static const String noAction = "no_action";
  static const String pay = "pay";
  static const String seeDetail = "see_detail";
  static const String info = "info";

  @override
  void initState() {
    super.initState();
    _viewModel =
        NotificationListViewModel().setView(this) as NotificationListViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<NotificationListViewModel>(
        create: (context) => _viewModel,
        child: Consumer<NotificationListViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  appBar: AppBarCustom.buildAppBarActionText(
                      context,
                      "Notifikasi",
                      Icons.check_circle_outline,
                      () => _viewModel.markAllRead()) as PreferredSizeWidget?,
                  backgroundColor: white,
                  body: Container(
                    child: Stack(
                      children: [
                        ListView.builder(
                            itemCount: _viewModel.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                renderNotificationItem(index)),
                        viewModel.isLoading ? LoadingIndicator() : Container()
                      ],
                    ),
                  ),
                )));
  }

  Widget renderNotificationItem(int index) {
    var data = _viewModel.data[index];
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            color: data.isRead ? white : primaryBackground,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageUtils.isSvg(data.picture)
                      ? SvgPicture.asset(data.picture)
                      : Image.asset(data.picture),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //"${data.name} ${data.title} bulan ${data.month} ${data.message}";
                        RichText(
                            text: TextSpan(
                                text: "${data.name} ",
                                style: BaseStyle.textBold12,
                                children: [
                                  TextSpan(
                                      text: "${data.title} ",
                                      style: BaseStyle.textRegular12),
                                  TextSpan(
                                      text: "bulan ${data.month} ",
                                      style: BaseStyle.textBold12),
                                  TextSpan(
                                      text: "${data.message}",
                                      style: BaseStyle.textRegular12)
                                ])),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.date,
                          style: BaseStyle.textSecondaryRegular12,
                        )
                      ],
                    ),
                  ),
                  renderInfoOrAction(data.action, data.actionTitle)
                ],
              ),
            ),
          ),
          Divider(
            height: 0.5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget renderInfoOrAction(String action, String actionTitle) {
    if (action == noAction) {
      return Container();
    } else if (action == pay) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: FittedBox(
            fit: BoxFit.none,
            child: DefaultButton.redOutlineRoundedButtonSmall(
                context, actionTitle, () {})),
      );
    } else if (action == seeDetail) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: FittedBox(
            child: DefaultButton.redOutlineRoundedButtonSmall(
                context, actionTitle, () {})),
      );
    } else if (action == info) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          actionTitle,
          style: BaseStyle.textSemiBoldCustom(color: success, fontSize: 14),
        ),
      );
    }
    return Container();
  }
}
