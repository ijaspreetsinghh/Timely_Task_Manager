import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/app/taskModel.dart';
import 'package:timely/core/viewmodel/schedule_viewModel.dart';
import '../../../widgets/components.dart';
import '../../../widgets/constants.dart';

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

  final List<CategoryGrid> categoryList = [
    CategoryGrid(),
    CategoryGrid(),
    CategoryGrid(),
    CategoryGrid(),
  ];
  final List<HorizontalTaskBuilder> tomorrowWhitWeekList = [
    HorizontalTaskBuilder(
      color: kRedColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with jack',
    ),
    HorizontalTaskBuilder(
      color: kGreenColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with mickey',
    )
  ];

  final List<HorizontalTaskBuilder> tomorrowWeekList = [
    HorizontalTaskBuilder(
      color: kRedColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with jack',
    ),
    HorizontalTaskBuilder(
      color: kGreenColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with mickey',
    ),
    HorizontalTaskBuilder(
      color: kRedColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with jack',
    ),
    HorizontalTaskBuilder(
      color: kGreenColor,
      time: 'Tomorrow',
      taskTitle: 'Skype call with mickey',
    ),
  ];

  List<String> item = [
    "Clients",
    "Designer",
    "Developer",
    "Director",
    "Employee",
    "Manager",
    "Worker",
    "Owner"
  ];
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = item.removeAt(oldindex);
      item.insert(newindex, items);
    });
  }

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
        onModelReady: (model) => model.initiate(),
        initialiseSpecialViewModelsOnce: true,
        fireOnModelReadyOnce: true,
        builder: (context, model, child) {
          return Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: kPrimaryColor,
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
                                  'Hello, ${model.displayName.split(' ')[0]} ',
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
                            height: kVPadding * 2,
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: kGreyWhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kBorderRadius * 2),
                                    topRight:
                                        Radius.circular(kBorderRadius * 2))),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            child: TabBar(
                                // isScrollable: true,
                                indicatorColor: Colors.black,
                                indicatorSize: TabBarIndicatorSize.label,
                                // indicatorPadding: EdgeInsets.zero,

                                labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: kCircularStdFont,
                                  fontWeight: FontWeight.w700,
                                ),
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
                                ]),
                          ),
                        ],
                      ),
                    ),
                    // backgroundColor: kGreyWhite,
                    toolbarHeight: 180,
                    automaticallyImplyLeading: false,
                    foregroundColor: kRedColor,
                  ),
                  body: Container(
                    child: TabBarView(controller: _controller, children: [
                      Container(
                        color: kGreyWhite,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: model.stream,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data.docs;
                              int numberOfTasks = snapshot.data.docs.length;
                              List<TaskModel> availableGridTasks = [];
                              List<HorizontalTaskBuilder> tomorrowTaskList = [];
                              List<HorizontalTaskBuilder> weekTaskList = [];
                              if (numberOfTasks > 0) {
                                for (var dataItem in data) {
                                  String taskTitle = dataItem['Task Title'];
                                  Timestamp taskDateandTime =
                                      dataItem['Task Date Time'];
                                  String taskDesc =
                                      dataItem['Task Description'];
                                  String taskCategory =
                                      dataItem['Task Category'];
                                  bool isalarmSet = dataItem['isAlarmSet'];
                                  DateTime taskDate = DateTime(
                                      taskDateandTime.toDate().year,
                                      taskDateandTime.toDate().month,
                                      taskDateandTime.toDate().day);
                                  TimeOfDay taskTime = TimeOfDay(
                                      hour: taskDateandTime.toDate().hour,
                                      minute: taskDateandTime.toDate().minute);
                                  if (taskDate ==
                                      DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          0,
                                          0,
                                          0)) {
                                    availableGridTasks.add(
                                      TaskModel(
                                          taskTitle: taskTitle,
                                          taskDate: taskDate,
                                          taskTime: taskTime,
                                          taskDescription: taskDesc,
                                          isAlarmSet: isalarmSet,
                                          taskCategory: taskCategory),
                                    );
                                  }
                                  if (taskDate ==
                                      DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day + 1,
                                          0,
                                          0,
                                          0)) {
                                    tomorrowTaskList.add(HorizontalTaskBuilder(
                                        color: model.services.colorSelector(
                                            taskCategory: taskCategory),
                                        taskTitle: taskTitle,
                                        time:
                                            'Tomorrow at ${taskTime.format(context)}'));
                                  }
                                  if (taskDate.isAfter(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day + 1,
                                          0,
                                          0,
                                          0)) &&
                                      taskDate.isBefore(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day + 8,
                                          0,
                                          0,
                                          0))) {
                                    weekTaskList.add(HorizontalTaskBuilder(
                                        color: model.services.colorSelector(
                                            taskCategory: taskCategory),
                                        taskTitle: taskTitle,
                                        time:
                                            '${DateFormat('MMMMEEEEd').format(taskDate)} at ${taskTime.format(context)}'));
                                  }
                                }
                              }

                              return numberOfTasks > 0
                                  ? ListView(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.fromLTRB(
                                          kHPadding * 1.5,
                                          kVPadding * 2,
                                          kHPadding * 1.5,
                                          0),
                                      children: [
                                          GridView.count(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            crossAxisSpacing: kHPadding,
                                            childAspectRatio: 1.1,
                                            mainAxisSpacing: kHPadding,
                                            children: List.generate(
                                                availableGridTasks.length,
                                                (index) {
                                              return PriorityTaskGrid(
                                                color: model.selectColor(
                                                    thisTaskCategory:
                                                        availableGridTasks[
                                                                index]
                                                            .taskCategory),
                                                remainingTime:
                                                    'In ${availableGridTasks[index].taskTime.format(context)}',
                                                taskTitle:
                                                    availableGridTasks[index]
                                                        .taskTitle,
                                                time: availableGridTasks[index]
                                                    .taskTime
                                                    .format(context)
                                                    .toString(),
                                              );
                                            }),
                                          ),
                                          Container(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            padding: EdgeInsets.only(
                                                right: kHPadding * .7),
                                            child: Icon(
                                              Icons.more_horiz_rounded,
                                              size: 34,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: kVPadding * 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        child: Text(
                                                          'tomorrow'
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: model.selectedTaskListFromTomorrowThisWeek ==
                                                                    0
                                                                ? kBlackTextColor
                                                                : kGrayTextColor,
                                                            fontFamily:
                                                                kCircularStdFont,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    kHPadding /
                                                                        2,
                                                                vertical:
                                                                    kVPadding),
                                                      ),
                                                      onTap: () => model
                                                          .tskListFromTomorrowThisWeekTabSelector(
                                                              0),
                                                    ),
                                                    SizedBox(
                                                      width: kHPadding,
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        child: Text(
                                                          'This week'
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: model.selectedTaskListFromTomorrowThisWeek ==
                                                                    1
                                                                ? kBlackTextColor
                                                                : kGrayTextColor,
                                                            fontFamily:
                                                                kCircularStdFont,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    kHPadding /
                                                                        2,
                                                                vertical:
                                                                    kVPadding),
                                                      ),
                                                      onTap: () => model
                                                          .tskListFromTomorrowThisWeekTabSelector(
                                                              1),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'View All',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: kPrimaryColor,
                                                    fontFamily:
                                                        kCircularStdFont,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children:
                                                model.selectedTaskListFromTomorrowThisWeek ==
                                                        0
                                                    ? tomorrowTaskList
                                                    : weekTaskList,
                                          ),
                                        ])
                                  : Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kHPadding,
                                          vertical: kVPadding),
                                      alignment: AlignmentDirectional.center,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            height: 200,
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                'assets/images/organized.png'),
                                          ),
                                          SizedBox(
                                            height: kVPadding,
                                          ),
                                          FormHeading(
                                            title:
                                                'If you have time, you\'re productive. Timely helps you spend your time well.',
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                    );
                            } else {
                              return Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        color: kGreyWhite,
                        child: StreamBuilder(
                          stream: model.stream,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<HorizontalTaskBuilder> allTasksList = [];
                              var data = snapshot.data.docs;
                              for (var dataItem in data) {
                                String taskTitle = dataItem['Task Title'];
                                Timestamp taskDateandTime =
                                    dataItem['Task Date Time'];
                                String taskDesc = dataItem['Task Description'];
                                String taskCategory = dataItem['Task Category'];
                                bool isalarmSet = dataItem['isAlarmSet'];
                                DateTime taskDate = DateTime(
                                    taskDateandTime.toDate().year,
                                    taskDateandTime.toDate().month,
                                    taskDateandTime.toDate().day);
                                TimeOfDay taskTime = TimeOfDay(
                                    hour: taskDateandTime.toDate().hour,
                                    minute: taskDateandTime.toDate().minute);
                                allTasksList.add(HorizontalTaskBuilder(
                                    color: model.services.colorSelector(
                                        taskCategory: taskCategory),
                                    taskTitle: taskTitle,
                                    time: taskTime.format(context)));
                              }
                              return ListView(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.fromLTRB(
                                      0, kVPadding * 2, 0, 0),
                                  children: [
                                    GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kHPadding * 1.5),
                                      crossAxisCount: 2,
                                      crossAxisSpacing: kHPadding,
                                      mainAxisSpacing: kHPadding,
                                      childAspectRatio: 1.4,
                                      children: List.generate(
                                          categoryList.length, (index) {
                                        return categoryList[index];
                                      }),
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      padding: EdgeInsets.only(
                                          right: kHPadding * 1.5),
                                      child: Icon(
                                        Icons.more_horiz_rounded,
                                        size: 34,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: kVPadding * 2),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kHPadding * 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Tasks'.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: kBlackTextColor,
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
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kHPadding),
                                      child: Column(
                                        children: allTasksList,
                                      ),
                                    ),
                                  ]);
                            } else
                              return Container();
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => ScheduleViewModel());
  }
}
