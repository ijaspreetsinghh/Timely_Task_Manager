import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/meta/view/Screens/MainAppPages/createTask.dart';
import '../../Screens/MainAppPages/fourthTab.dart';
import '../../Screens/MainAppPages/fifthTab.dart';
import '../../Screens/MainAppPages/thirdTab.dart';
import 'package:timely/meta/widgets/constants.dart';
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
    if (index == 2) {
      NavigationService.instance.pushNamed(CreateTask.route);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // void _showBottomSheet() {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       elevation: 20,
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       isDismissible: true,
  //       enableDrag: true,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Wrap(
  //             // mainAxisSize: MainAxisSize.min,
  //             alignment: WrapAlignment.center,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     color: Color(0xffbbbbb9),
  //                     borderRadius: BorderRadius.circular(kBorderRadius)),
  //                 height: 3,
  //                 width: 75,
  //                 alignment: AlignmentDirectional.center,
  //               ),
  //               SizedBox(
  //                 height: kVPadding,
  //               ),
  //               Container(
  //                 // height: MediaQuery.of(context).size.height * .7,
  //                 padding: EdgeInsets.fromLTRB(kHPadding * .7, kVPadding * 1.5,
  //                     kHPadding * .7, kVPadding),
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(kBorderRadius * 2),
  //                         topRight: Radius.circular(kBorderRadius * 2))),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     SizedBox(
  //                       height: kVPadding,
  //                     ),
  //                     FormHeading(
  //                       title: 'Create Task',
  //                     ),
  //                     SizedBox(
  //                       height: kVPadding,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: kHPadding * .8),
  //                       child: TextField(
  //                         style: kCircularStdText.copyWith(
  //                             fontSize: 20, color: kBlackTextColor),
  //                         textCapitalization: TextCapitalization.sentences,
  //                         cursorColor: kPrimaryColor,
  //                         cursorHeight: 26,
  //                         decoration: InputDecoration(
  //                           hintText: 'Your Task Name',
  //                           hintStyle: kHintTextStyle,
  //                           border: UnderlineInputBorder(
  //                               borderSide: BorderSide(color: kGrayTextColor)),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(top: kVPadding * 2),
  //                       padding: EdgeInsets.symmetric(
  //                         horizontal: kHPadding * .7,
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.stretch,
  //                         children: [
  //                           Text(
  //                             'Date'.toUpperCase(),
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                               color: kGrayTextColor,
  //                               fontFamily: kCircularStdFont,
  //                               fontWeight: FontWeight.w700,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: kVPadding,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               FocusScope.of(context).requestFocus();
  //                               showTimePicker(
  //                                       context: context,
  //                                       initialTime: TimeOfDay.now())
  //                                   .then((start) {
  //                                 setState(() {
  //                                   startTime = start;
  //                                 });
  //                               });
  //                             },
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text(
  //                                   DateFormat('yMMMMd')
  //                                       .format(pickedDate ?? DateTime.now()),
  //                                   style: TextStyle(
  //                                     fontSize: 14,
  //                                     color: kBlackTextColor,
  //                                     fontFamily: kCircularStdFont,
  //                                     fontWeight: FontWeight.w700,
  //                                   ),
  //                                 ),
  //                                 Icon(
  //                                   Icons.calendar_today_rounded,
  //                                   color: kGrayTextColor,
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           Divider(
  //                             color: kGrayTextColor.withOpacity(.5),
  //                             thickness: 1,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(top: kVPadding * 3),
  //                       padding:
  //                           EdgeInsets.symmetric(horizontal: kHPadding * .8),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Start Time'.toUpperCase(),
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                   color: kGrayTextColor,
  //                                   fontFamily: kCircularStdFont,
  //                                   fontWeight: FontWeight.w700,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: kVPadding,
  //                               ),
  //                               GestureDetector(
  //                                 onTap: () => showTimePicker(
  //                                         context: context,
  //                                         initialTime: TimeOfDay.now())
  //                                     .then((start) {
  //                                   setState(() {
  //                                     startTime = start;
  //                                   });
  //                                 }),
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Text(
  //                                       DateFormat('yMMMMd').format(
  //                                           pickedDate ?? DateTime.now()),
  //                                       style: TextStyle(
  //                                         fontSize: 14,
  //                                         color: kBlackTextColor,
  //                                         fontFamily: kCircularStdFont,
  //                                         fontWeight: FontWeight.w700,
  //                                       ),
  //                                     ),
  //                                     Icon(
  //                                       Icons.keyboard_arrow_down_rounded,
  //                                       color: kGrayTextColor,
  //                                     )
  //                                   ],
  //                                 ),
  //                               ),
  //                               Divider(
  //                                 color: kGrayTextColor.withOpacity(.5),
  //                                 thickness: 1,
  //                               ),
  //                             ],
  //                           ),
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Start Time'.toUpperCase(),
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                   color: kGrayTextColor,
  //                                   fontFamily: kCircularStdFont,
  //                                   fontWeight: FontWeight.w700,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: kVPadding,
  //                               ),
  //                               GestureDetector(
  //                                 onTap: () => showTimePicker(
  //                                         context: context,
  //                                         initialTime: TimeOfDay.now())
  //                                     .then((start) {
  //                                   setState(() {
  //                                     startTime = start;
  //                                   });
  //                                 }),
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Text(
  //                                       DateFormat('yMMMMd').format(
  //                                           pickedDate ?? DateTime.now()),
  //                                       style: TextStyle(
  //                                         fontSize: 14,
  //                                         color: kBlackTextColor,
  //                                         fontFamily: kCircularStdFont,
  //                                         fontWeight: FontWeight.w700,
  //                                       ),
  //                                     ),
  //                                     Icon(
  //                                       Icons.keyboard_arrow_down_rounded,
  //                                       color: kGrayTextColor,
  //                                     )
  //                                   ],
  //                                 ),
  //                               ),
  //                               Divider(
  //                                 color: kGrayTextColor.withOpacity(.5),
  //                                 thickness: 1,
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.only(top: kVPadding * 3),
  //                       padding: EdgeInsets.symmetric(
  //                         horizontal: kHPadding * .7,
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.stretch,
  //                         children: [
  //                           Text(
  //                             'description'.toUpperCase(),
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                               color: kGrayTextColor,
  //                               fontFamily: kCircularStdFont,
  //                               fontWeight: FontWeight.w700,
  //                             ),
  //                           ),
  //                           TextField(
  //                             maxLines: 4,
  //                             minLines: 1,
  //                             style: kCircularStdText.copyWith(
  //                                 fontSize: 16, color: kBlackTextColor),
  //                             textCapitalization: TextCapitalization.sentences,
  //                             cursorColor: kPrimaryColor,
  //                             cursorHeight: 22,
  //                             decoration: InputDecoration(
  //                               hintText: 'Brief Description',
  //                               hintStyle: kHintTextStyle,
  //                               border: UnderlineInputBorder(
  //                                   borderSide:
  //                                       BorderSide(color: kGrayTextColor)),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: kVPadding * 3,
  //                     ),
  //                     Container(
  //                       margin: EdgeInsets.fromLTRB(kHPadding * 3,
  //                           kVPadding * 2, kHPadding * 3, kVPadding * 4),
  //                       child: PrimaryButton(
  //                         title: 'Create Task',
  //                         action: () => print('hi'),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          elevation: 10,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 28,
              ),
              icon: SvgPicture.asset(
                'assets/icons/home-alt.svg',
                height: 28,
                color: kGrayTextColor.withOpacity(.7),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/list.svg',
                height: 28,
              ),
              icon: SvgPicture.asset(
                'assets/icons/list-alt.svg',
                height: 28,
                color: kGrayTextColor.withOpacity(.7),
              ),
              label: 'My Tasks',
            ),
            BottomNavigationBarItem(
              icon: Hero(
                tag: 'Create Task',
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(7),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              label: 'Add Task',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                height: 28,
              ),
              icon: SvgPicture.asset(
                'assets/icons/calendar-alt.svg',
                height: 28,
                color: kGrayTextColor.withOpacity(.7),
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 28,
              ),
              icon: SvgPicture.asset(
                'assets/icons/user-alt.svg',
                height: 28,
                color: kGrayTextColor.withOpacity(.7),
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: kGreyWhite,
          selectedItemColor: kPrimaryColor,
          iconSize: 28,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
