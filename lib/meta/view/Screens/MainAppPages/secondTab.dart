import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/constants.dart';
import '../../../widgets/components.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  DateTime _selectedDate = DateTime.now();

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
                    height: kVPadding,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: kHPadding / 2),
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectedTextColor: Colors.black,
                      selectionColor: Colors.white,
                      monthTextStyle: TextStyle(
                          fontFamily: kCircularStdFont,
                          color: Colors.white,
                          fontSize: 11),
                      dateTextStyle: TextStyle(
                          fontFamily: kCircularStdFont,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      dayTextStyle: TextStyle(
                          fontFamily: kCircularStdFont,
                          color: Colors.white,
                          fontSize: 11),
                      daysCount: 15,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                ],
              ),
            ),
            // backgroundColor: kGreyWhite,
            toolbarHeight: 160,
            automaticallyImplyLeading: false,
            foregroundColor: kRedColor,
          ),
          backgroundColor: kPrimaryColor,
          body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kHPadding * 1.5, vertical: kVPadding * 3),
              decoration: BoxDecoration(
                  color: kGreyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius * 2),
                      topRight: Radius.circular(kBorderRadius * 2))),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormHeading(title: 'My Tasks'),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  Column(
                    children: [
                      TimelineTaskBuilder(
                        icon: Icons.check,
                        color: kGreenColor,
                        time: '9:00',
                        taskTitle: 'Skype call with jack',
                      ),
                      TimelineTaskBuilder(
                        icon: Icons.check,
                        color: kGreenColor,
                        time: '9:00',
                        taskTitle: 'Skype call with jack',
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class TimelineTaskBuilder extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String time;
  final String taskTitle;
  const TimelineTaskBuilder(
      {@required this.icon,
      @required this.time,
      @required this.taskTitle,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          child: Icon(
            icon,
            size: 16,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          width: kVPadding,
        ),
        Text(
          time,
          style: kHintTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          width: kVPadding,
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: kVPadding),
            padding: EdgeInsets.only(
                left: kHPadding,
                right: kHPadding,
                top: kVPadding * 3,
                bottom: kVPadding * 3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskTitle,
                  style: kCircularStdText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
