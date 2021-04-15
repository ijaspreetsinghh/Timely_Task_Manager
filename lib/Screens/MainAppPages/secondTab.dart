import 'package:flutter/material.dart';
import 'package:timely/constants.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
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
        body: Container(
          color: kGreyWhite,
          padding: EdgeInsets.symmetric(
              vertical: kVPadding, horizontal: kHPadding * .7),
          child: ListView(children: [
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.only(right: kHPadding * .7),
              child: Icon(
                Icons.more_horiz_rounded,
                size: 34,
                color: kPrimaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kVPadding * 2),
              padding: EdgeInsets.symmetric(horizontal: kHPadding * 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Today'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: kBlackTextColor,
                          fontFamily: kCircularStdFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: kHPadding,
                      ),
                      Text(
                        'This week'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: kGrayTextColor,
                          fontFamily: kCircularStdFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontFamily: kCircularStdFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
