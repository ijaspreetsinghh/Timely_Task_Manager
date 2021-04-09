import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../components.dart';

class Schedule extends StatefulWidget {
  static const route = 'Schedule';
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with TickerProviderStateMixin {
  TabController _controller;
  final List<PriorityTaskGrid> gridList = [
    PriorityTaskGrid(
      color: kGreenColor,
      remainingTime: 'In 2 hrs 12 mins',
      taskTitle: 'Skype call with Jack',
      time: '9:00 am',
    ),
    PriorityTaskGrid(
      color: kYellowColor,
      remainingTime: 'In 2 hrs 12 mins',
      taskTitle: 'Video call about app',
      time: '10:30 am',
    ),
    PriorityTaskGrid(
      color: kAquaColor,
      remainingTime: 'In 2 hrs 12 mins',
      taskTitle: 'Start development discussing',
      time: '1:20 pm',
    ),
    PriorityTaskGrid(
      color: kRedColor,
      remainingTime: 'In 2 hrs 12 mins',
      taskTitle: 'Start development discussing',
      time: '1:20 pm',
    ),
  ];
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
            child: DefaultTabController(
          length: 3,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHPadding * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Jaspreet ',
                            style: kCircularStdText.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Image(
                            alignment: AlignmentDirectional.topStart,
                            image: AssetImage(
                              'assets/images/hand.png',
                            ),
                            height: 28,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kVPadding / 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      margin: EdgeInsets.only(bottom: kVPadding),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHPadding * 1.5),
                      child: Text(
                        'You have some important tasks to do for today.',
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            fontSize: 14,
                            fontFamily: kMuliFont),
                      ),
                    ),
                    SizedBox(
                      height: kVPadding,
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: kGreyWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kBorderRadius * 2),
                              topRight: Radius.circular(kBorderRadius * 2))),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: kCircularStdFont,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelPadding: EdgeInsets.zero,
                          unselectedLabelColor: kGrayTextColor,
                          labelColor: Colors.black,
                          controller: _controller,
                          tabs: [
                            Tab(
                              text: 'Today\'s Priority'.toUpperCase(),
                            ),
                            Tab(
                              text: 'Categories'.toUpperCase(),
                            ),
                            Tab(
                              text: 'Notes'.toUpperCase(),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              // backgroundColor: kGreyWhite,
              toolbarHeight: 160,
              automaticallyImplyLeading: false,
              foregroundColor: Colors.red,
            ),
            body: TabBarView(controller: _controller, children: [
              Container(
                color: kGreyWhite,
                padding: EdgeInsets.symmetric(
                    vertical: kVPadding, horizontal: kHPadding * .7),
                child: ListView(children: [
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(gridList.length, (index) {
                      return gridList[index];
                    }),
                  ),
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
                  Column(
                    children: [
                      TodayHorizontalTaskBuilder(
                        color: kRedColor,
                        time: 'Tomorrow',
                        taskTitle: 'Skype call with jack',
                      ),
                      TodayHorizontalTaskBuilder(
                        color: kGreenColor,
                        time: 'Tomorrow',
                        taskTitle: 'Skype call with mickey',
                      )
                    ],
                  ),
                ]),
              ),
              Text('hii'),
              Text('hii2')
            ]),
          ),
        )));
  }
}
