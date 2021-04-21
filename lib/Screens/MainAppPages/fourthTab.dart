import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constants.dart';
import 'package:flutter/material.dart';

class FourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyWhite,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   brightness: Brightness.light,
          //   elevation: 0, backgroundColor: Colors.white,
          //   flexibleSpace: Container(
          //     color: kPrimaryColor,
          //     padding: EdgeInsets.zero,
          //     margin: EdgeInsets.zero,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Padding(
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
          //           child: Text(
          //             'Select day to views tasks ',
          //             style: kCircularStdText.copyWith(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w700),
          //           ),
          //         ),
          //         SizedBox(
          //           height: kVPadding * 2,
          //         ),
          //         SizedBox(
          //           height: kVPadding,
          //         ),
          //       ],
          //     ),
          //   ),
          //   // backgroundColor: kGreyWhite,
          //   toolbarHeight: 160,
          //   automaticallyImplyLeading: false,
          //   foregroundColor: Colors.red,
          // ),
          backgroundColor: kGreyWhite,
          body: Container(
            child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(showAgenda: true),
            ),
          ),
        ),
      ),
    );
  }
}
