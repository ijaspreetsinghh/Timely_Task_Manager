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
