import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/notificationsPage_viewModel.dart';
import 'package:timely/meta/widgets/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key key}) : super(key: key);
  static const route = 'NotificationsPage';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsPageViewModel>.reactive(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Container(
            color: kGreyWhite,
            child: SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text(model.notificationMessageTitle),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => NotificationsPageViewModel());
  }
}
