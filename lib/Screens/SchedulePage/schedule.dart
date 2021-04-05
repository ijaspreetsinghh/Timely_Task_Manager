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
  double screenSize;
  double screenRatio;
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 3);
    super.initState();
  }

  List<PriorityTaskGrid> gridList = [
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
  ];
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kHPadding * 1.5, vertical: kVPadding * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Jaspreet ',
                        style: kCircularStdText.copyWith(
                            color: Colors.white,
                            fontSize: 24,
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
                  SizedBox(
                    height: kVPadding,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    margin: EdgeInsets.only(bottom: kVPadding),
                    child: Text(
                      'You have some important tasks to do for today.',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                          fontFamily: kMuliFont),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kGreyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius * 2.5),
                      topRight: Radius.circular(kBorderRadius * 2.5))),
              padding: EdgeInsets.symmetric(
                vertical: kVPadding * 2,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: kCircularStdFont,
                        fontWeight: FontWeight.w700,
                      ),
                      // labelPadding: EdgeInsets.only(
                      //   right: kHPadding * 1.5,
                      // ),
                      unselectedLabelColor: kGrayTextColor,
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
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
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: TabBarView(controller: _tabController, children: [
                      Column(
                        children: [
                          Flexible(
                              // padding: EdgeInsets.all(12.0),
                              child: GridView.builder(
                            itemCount: 3,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemBuilder: (BuildContext context, int index) {
                              return gridList[index];
                            },
                          )),
                          Container(
                            padding: EdgeInsets.only(right: kHPadding * 1.5),
                            child: Icon(
                              Icons.more_horiz_rounded,
                              size: 34,
                              color: kPrimaryColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5),
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kHPadding * 1.5),
                                decoration: BoxDecoration(color: kGreyWhite),
                                child: Row(
                                  children: [
                                    Text(
                                      'Skype call with Jack',
                                      style: kCircularStdText.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Text('hii'),
                      Text('hii2')
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
