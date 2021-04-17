import 'package:flutter/material.dart';
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
                  kHPadding * 1.5, kVPadding * 2, kHPadding * 1.5, 0),
              children: [
                Text(
                  'My Tasks',
                  style: kCircularStdText.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kVPadding * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      width: kHPadding,
                    ),
                    Text(
                      '9:00',
                      style: kHintTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: kHPadding,
                    ),
                    Flexible(
                      flex: 2,
                      child: MyTaskNameBuilder(
                        taskTitle: 'Skype call with mickey.',
                      ),
                    ),
                  ],
                ),
                CustomPaint(
                    size: Size(2, 50.0), painter: DashedLineVerticalPainter())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
