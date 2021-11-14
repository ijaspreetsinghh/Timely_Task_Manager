import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/timelyPageDeciderViewModel.dart';
import 'package:timely/meta/view/Screens/MainAppPages/createTask.dart';
import '../../../../main.dart';
import '../../Screens/MainAppPages/fifthTab.dart';
import 'package:timely/meta/widgets/constants.dart';
import 'schedule.dart';
import 'secondTab.dart';
import '../../../extensions/neumorphism.dart';
import '../../../../core/services/services.dart';

// ignore: must_be_immutable
class PagesDecider extends StatelessWidget {
  static const route = 'PagesDecider';

  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  DateTime currentBackPressTime;

  final List _children = [Schedule(), SecondTab(), FifthTab()];
  // final DateTime pickedDate = DateTime.now();
  // final TimeOfDay startTime = TimeOfDay.now();
//  final TimeOfDay endTime =;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PageDeciderViewModel>.reactive(
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (currentBackPressTime == null ||
                  now.difference(currentBackPressTime) >
                      Duration(milliseconds: 1500)) {
                currentBackPressTime = now;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Press back again to exit."),
                  duration: Duration(milliseconds: 1500),
                ));
                return Future.value(false);
              }
              return Future.value(true);
            },
            child: Scaffold(
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _children[model.selectedIndex],
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
                      currentIndex: model.selectedIndex,
                      unselectedItemColor: kGreyWhite,
                      selectedItemColor: kPrimaryColor,
                      iconSize: 28,
                      onTap: model.onItemTapped,
                    ),
                  ).addNeumorphism()
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
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
            ),
          );
        },
        viewModelBuilder: () => PageDeciderViewModel());
  }
}
