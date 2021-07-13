
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/commons/nav_key.dart';
import 'package:terkelola/commons/screen_utils.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/ui/widgets/app_bar_custom.dart';
import 'package:terkelola/ui/widgets/default_button.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'empty_navigator.dart';
import 'empty_view_model.dart';

class EmptyScreen extends StatefulWidget { // ignore: must_be_immutable

  EmptyScreen();

  @override
  State<StatefulWidget> createState() {
    return _EmptyScreen();
  }
}

class _EmptyScreen extends BaseStateWidget<EmptyScreen>
    implements EmptyNavigator {
  EmptyViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = EmptyViewModel().setView(this) as EmptyViewModel?;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<EmptyViewModel?>(
        create: (context) => _viewModel,
        child: Consumer<EmptyViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  appBar: AppBarCustom.trans() as PreferredSizeWidget?,
                  backgroundColor: white,
                  body: Container(
                    child: Stack(
                      children: [
                        Text("Screen"),
                        viewModel.isLoading ? LoadingIndicator() : Container()
                      ],
                    ),
                  ),
                )));
  }
}
