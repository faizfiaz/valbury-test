import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/ui/widgets/app_bar_custom.dart';
import 'package:valburytest/ui/widgets/loading_indicator.dart';

import 'empty_navigator.dart';
import 'empty_view_model.dart';

class EmptyScreen extends StatefulWidget {
  // ignore: must_be_immutable

  EmptyScreen();

  @override
  State<StatefulWidget> createState() {
    return _EmptyScreen();
  }
}

class _EmptyScreen extends BaseStateWidget<EmptyScreen>
    implements EmptyNavigator {
  late EmptyViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = EmptyViewModel().setView(this) as EmptyViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<EmptyViewModel>(
        create: (context) => _viewModel,
        child: Consumer<EmptyViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  appBar: AppBarCustom.trans() as PreferredSizeWidget?,
                  backgroundColor: white,
                  body: Container(
                    child: Stack(
                      children: [
                        Center(child: Text("Screen")),
                        viewModel.isLoading ? LoadingIndicator() : Container()
                      ],
                    ),
                  ),
                )));
  }
}
