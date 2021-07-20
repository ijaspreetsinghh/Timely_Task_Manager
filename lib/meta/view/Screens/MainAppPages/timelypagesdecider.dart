import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/meta/view/Screens/MainAppPages/createTask.dart';
import '../../../../main.dart';
import '../../Screens/MainAppPages/fifthTab.dart';
import 'package:timely/meta/widgets/constants.dart';
import 'schedule.dart';
import 'secondTab.dart';
import '../../../extensions/neumorphism.dart';
import '../../../../core/services/services.dart';

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

  List _children = [Schedule(), SecondTab(), FifthTab()];
  DateTime pickedDate;
  TimeOfDay startTime;
  TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _children[_selectedIndex],
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            margin: EdgeInsets.only(
                bottom: kVPadding * 2,
                right: kHPadding * 2,
                left: kHPadding * 2),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
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
                // BottomNavigationBarItem(
                //   icon: Hero(
                //     tag: 'Create Task',
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: kPrimaryColor,
                //           borderRadius: BorderRadius.circular(50)),
                //       padding: EdgeInsets.all(7),
                //       child: Icon(
                //         Icons.add_rounded,
                //         color: Colors.white,
                //         size: 24,
                //       ),
                //     ),
                //   ),
                //   label: 'Add Task',
                // ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 16,
                    backgroundColor: kBlackTextColor.withOpacity(.03),
                    backgroundImage: NetworkImage(
                        Services().auth.currentUser.photoURL ??
                            defaultProfilePictureLocation),
                  ),
                  label: 'User Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: kGreyWhite,
              selectedItemColor: kPrimaryColor,
              iconSize: 28,
              onTap: _onItemTapped,
            ),
          ).addNeumorphism()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: kVPadding * 10),
        child: FloatingActionButton(
          tooltip: 'Create Task',
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.add_rounded,
            size: 32,
          ),
          onPressed: () =>
              NavigationService.instance.pushNamed(CreateTask.route),
        ),
      ),
    );
  }
}
