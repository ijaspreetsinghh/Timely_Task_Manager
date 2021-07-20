import 'package:flutter/material.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class ViewAllTasksPage extends StatelessWidget {
  static const route = 'ViewAllTasksPage';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  BackButtonWithoutAppBar(
                    iconColor: kBlackTextColor,
                  ),
                  FormHeading(
                    title: 'All Tasks',
                    fontSize: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
