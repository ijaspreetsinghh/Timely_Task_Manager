import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/secondTab_ViewModel.dart';

import '../../../widgets/constants.dart';
import '../../../widgets/components.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondTabViewModel>.reactive(
        onModelReady: (model) => model.dateSelector(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            0,
            0,
            0)),
        builder: (context, model, child) {
          return Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    brightness: Brightness.light,
                    elevation: 0, backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      color: kPrimaryColor,
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kHPadding * 1.5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('MMMMEEEEd')
                                      .format(model.selectedDate),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: kCircularStdFont,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  model.selectedDate ==
                                          DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              0,
                                              0,
                                              0)
                                      ? 'You have total 5 tasks today.'
                                      : model.selectedDate ==
                                              DateTime(
                                                  DateTime.now().year,
                                                  DateTime.now().month,
                                                  DateTime.now().day + 1,
                                                  0,
                                                  0,
                                                  0)
                                          ? 'You have total 5 tasks tomorrow.'
                                          : 'You have total 5 tasks on ${DateFormat('MMMEd').format(model.selectedDate)}.',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0,
                                      fontSize: 14,
                                      fontFamily: kMuliFont),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kVPadding * 2,
                          ),
                          SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: kHPadding,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: model
                                  .dateProvider(DateTime.now())
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          model.dateSelector(e);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          width: 60,
                                          height: 70,
                                          alignment:
                                              AlignmentDirectional.center,
                                          margin: EdgeInsets.only(
                                              right: kHPadding / 1.5),
                                          decoration: BoxDecoration(
                                              color: model.selectedDate == e
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius)),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${e.day}',
                                                style: kCircularStdText.copyWith(
                                                    color:
                                                        model.selectedDate == e
                                                            ? kBlackTextColor
                                                            : Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: kVPadding / 2,
                                              ),
                                              Text(
                                                DateFormat('EE').format(e),
                                                style: kCircularStdText.copyWith(
                                                    color:
                                                        model.selectedDate == e
                                                            ? kGrayTextColor
                                                            : kLightGrey,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(kHPadding * 1.5,
                                kVPadding * 2, kHPadding * 1.5, 0),
                            margin: EdgeInsets.only(
                              top: kVPadding * 2,
                            ),
                            decoration: BoxDecoration(
                              color: kGreyWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kBorderRadius * 2),
                                topRight: Radius.circular(kBorderRadius * 2),
                              ),
                            ),
                            child: Row(
                              children: [
                                FormHeading(title: 'My Tasks'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // backgroundColor: kGreyWhite,
                    toolbarHeight: 220,
                    automaticallyImplyLeading: false,
                    foregroundColor: kRedColor,
                  ),
                  backgroundColor: kGreyWhite,
                  body: ListView(
                    physics: BouncingScrollPhysics(),
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        // transform: Matrix4.translationValues(0, -30, 0),
                        padding: EdgeInsets.fromLTRB(
                            kHPadding * 1.5, 0, kHPadding * 1.5, kVPadding * 3),
                        decoration: BoxDecoration(
                            color: kGreyWhite,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kBorderRadius * 2),
                                topRight: Radius.circular(kBorderRadius * 2))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: kVPadding,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
        viewModelBuilder: () => SecondTabViewModel());
  }
}

// TimelineTaskBuilder(
//                                   icon: Icons.check,
//                                   color: kGreenColor,
//                                   time: '9:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),
//                                 TimelineTaskBuilder(
//                                   icon: Icons.access_time_rounded,
//                                   color: kYellowColor,
//                                   time: '10:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),
//                                 TimelineTaskBuilder(
//                                   icon: Icons.access_time_rounded,
//                                   color: kRedColor,
//                                   time: '11:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),
//                                 TimelineTaskBuilder(
//                                   icon: Icons.check,
//                                   color: kGreenColor,
//                                   time: '9:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),
//                                 TimelineTaskBuilder(
//                                   icon: Icons.access_time_rounded,
//                                   color: kYellowColor,
//                                   time: '10:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),
//                                 TimelineTaskBuilder(
//                                   icon: Icons.access_time_rounded,
//                                   color: kRedColor,
//                                   time: '11:00',
//                                   taskTitle: 'Skype call with jack',
//                                 ),

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.start,
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
