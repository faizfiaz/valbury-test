import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/ui/widgets/app_bar_custom.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';

import 'home_navigator.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen();

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseStateWidget<HomeScreen> implements HomeNavigator {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel().setView(this) as HomeViewModel;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) => _viewModel,
        child: Consumer<HomeViewModel>(
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
