import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timely/Screens/MainAppPages/fifthTab.dart';
import 'package:timely/Screens/MainAppPages/fourthTab.dart';
import 'package:timely/Screens/MainAppPages/thirdTab.dart';
import 'package:timely/components.dart';
import 'package:timely/constants.dart';
import 'schedule.dart';
import 'secondTab.dart';

class PagesDecider extends StatefulWidget {
  static const route = 'PagesDecider';
  @override
  _PagesDeciderState createState() => _PagesDeciderState();
}

class _PagesDeciderState extends State<PagesDecider> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        // barrierColor: kPrimaryColor,
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .7,
            padding: EdgeInsets.fromLTRB(
                kHPadding * .7, kVPadding * 3, kHPadding * .7, kVPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius * 2),
                    topRight: Radius.circular(kBorderRadius * 2))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kHPadding * .8),
                  child: TextField(
                    style: kCircularStdText.copyWith(
                        fontSize: 20, color: kBlackTextColor),
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: kPrimaryColor,
                    cursorHeight: 26,
                    decoration: InputDecoration(
                      hintText: 'Your Task Name',
                      hintStyle: kHintTextStyle,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          borderSide: BorderSide(color: kGrayTextColor)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kVPadding * 2),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPadding * .7,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Date'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: kGrayTextColor,
                          fontFamily: kCircularStdFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: kVPadding,
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus();
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((start) {
                            setState(() {
                              startTime = start;
                            });
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('yMMMMd')
                                  .format(pickedDate ?? DateTime.now()),
                              style: TextStyle(
                                fontSize: 14,
                                color: kBlackTextColor,
                                fontFamily: kCircularStdFont,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.calendar_today_rounded,
                              color: kGrayTextColor,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: kGrayTextColor.withOpacity(.5),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kVPadding * 3),
                  padding: EdgeInsets.symmetric(horizontal: kHPadding * .8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              color: kGrayTextColor,
                              fontFamily: kCircularStdFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          GestureDetector(
                            onTap: () => showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((start) {
                              setState(() {
                                startTime = start;
                              });
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('yMMMMd')
                                      .format(pickedDate ?? DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kBlackTextColor,
                                    fontFamily: kCircularStdFont,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: kGrayTextColor,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: kGrayTextColor.withOpacity(.5),
                            thickness: 1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              color: kGrayTextColor,
                              fontFamily: kCircularStdFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          GestureDetector(
                            onTap: () => showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((start) {
                              setState(() {
                                startTime = start;
                              });
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('yMMMMd')
                                      .format(pickedDate ?? DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kBlackTextColor,
                                    fontFamily: kCircularStdFont,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: kGrayTextColor,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: kGrayTextColor.withOpacity(.5),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kVPadding * 3),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPadding * .7,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'description'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: kGrayTextColor,
                          fontFamily: kCircularStdFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextField(
                        maxLines: 4,
                        minLines: 1,
                        style: kCircularStdText.copyWith(
                            fontSize: 16, color: kBlackTextColor),
                        textCapitalization: TextCapitalization.sentences,
                        cursorColor: kPrimaryColor,
                        cursorHeight: 22,
                        decoration: InputDecoration(
                          hintText: 'Brief Description',
                          hintStyle: kHintTextStyle,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGrayTextColor)),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: kHPadding * 3, vertical: kVPadding * 2),
                  child: PrimaryButton(
                    title: 'Create Task',
                    action: () => print('hi'),
                  ),
                )
              ],
            ),
          );
        });
  }

  List _children = [
    Schedule(),
    SecondTab(),
    ThirdTab(),
    FourthTab(),
    FifthTab()
  ];
  DateTime pickedDate;
  TimeOfDay startTime;
  TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.add_rounded,
            size: 36,
          ),
          onPressed: () => _showBottomSheet()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort_rounded),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 32,
              color: Colors.transparent,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Business',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: kGrayTextColor.withOpacity(.5),
        selectedItemColor: kPrimaryColor,
        iconSize: 24,
        onTap: _onItemTapped,
      ),
    );
  }
}
