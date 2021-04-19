import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'package:timely/constants.dart';

import '../../components.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0, backgroundColor: Colors.white,
            flexibleSpace: Container(
              color: kPrimaryColor,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      'Select day to views tasks ',
                      style: kCircularStdText.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                ],
              ),
            ),
            // backgroundColor: kGreyWhite,
            toolbarHeight: 160,
            automaticallyImplyLeading: false,
            foregroundColor: Colors.red,
          ),
          backgroundColor: kPrimaryColor,
          body: Container(
            decoration: BoxDecoration(
                color: kGreyWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius * 2),
                    topRight: Radius.circular(kBorderRadius * 2))),
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                  kHPadding * 1.5, kVPadding * 2, kHPadding * 1.5, kVPadding),
              children: [
                TimelineTile(
                  nodeAlign: TimelineNodeAlign.start,
                  contents: TimeLineTaskBuilder(
                    time: '9:00',
                    taskName: 'Skype call with mickey.',
                  ),
                  node: MyTaskTimelineIconBuilder(
                      color: kGreenColor,
                      icon: Icons.check,
                      lineType: SolidLine()),
                ),
                TimelineTile(
                  nodeAlign: TimelineNodeAlign.start,
                  contents: TimeLineTaskBuilder(
                    time: '9:00',
                    taskName: 'Skype call with mickey.',
                  ),
                  node: MyTaskTimelineIconBuilder(
                    color: kGreenColor,
                    icon: Icons.check,
                    lineType: DashedLine(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
