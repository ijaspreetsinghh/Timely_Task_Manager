import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/app/taskModel.dart';
import 'package:timely/core/services/notificationService.dart';
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

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  List<String> subTitles = [
    'The key is in not spending time, but in investing it.',
    'Time is the wisest counselor of all.',
    'Time is the most valuable thing a man can spend.',
    'Lost time is never found again.',
    'Better three hours too soon than a minute too late.',
    'The two most powerful warriors are patience and time.',
    'It is the time you have wasted for your rose that makes your rose so important.',
  ];
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
                  backgroundColor: kGreyWhite,
                  appBar: AppBar(
                    brightness: Brightness.light,
                    elevation: 0,
                    flexibleSpace: Container(
                      color: kPrimaryColor,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: kHPadding * 1.5, right: kHPadding / 2),
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
                                ),
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
                              subTitles[model.randomNumber],
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
                                    text: 'All Tasks'.toUpperCase(),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    // backgroundColor: kGreyWhite,
                    toolbarHeight: 180,
                    automaticallyImplyLeading: false,
                  ),
                  body: Container(
                    child: TabBarView(
                        controller: _controller,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            color: kGreyWhite,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: model.stream,
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  var data = snapshot.data.docs;
                                  int numberOfTasks = snapshot.data.docs.length;
                                  List<TaskModel> availableGridTasks = [];
                                  List<HorizontalTaskBuilder> tomorrowTaskList =
                                      [];
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
                                      String taskStatus =
                                          dataItem['Task Status'];

                                      String taskId = dataItem.id;
                                      DateTime taskDate = DateTime(
                                          taskDateandTime.toDate().year,
                                          taskDateandTime.toDate().month,
                                          taskDateandTime.toDate().day);
                                      TimeOfDay taskTime = TimeOfDay(
                                          hour: taskDateandTime.toDate().hour,
                                          minute:
                                              taskDateandTime.toDate().minute);

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
                                              taskId: taskId,
                                              taskStatus: taskStatus,
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
                                        tomorrowTaskList.add(
                                          HorizontalTaskBuilder(
                                            taskId: taskId,
                                            color: model.services.colorSelector(
                                                taskCategory: taskCategory),
                                            taskStatus: taskStatus,
                                            taskTitle: taskTitle,
                                            taskTime: taskTime,
                                            isAlarmSet: isalarmSet,
                                            time: taskTime,
                                            category: taskCategory,
                                            taskDate: taskDate,
                                            taskDescription: taskDesc,
                                          ),
                                        );
                                      }
                                      if (taskDate.isAfter(DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day + 1,
                                              0,
                                              0,
                                              0)) &&
                                          taskDate.isBefore(
                                            DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day + 8,
                                                0,
                                                0,
                                                0),
                                          )) {
                                        weekTaskList.add(
                                          HorizontalTaskBuilder(
                                            taskId: taskId,
                                            color: model.services.colorSelector(
                                                taskCategory: taskCategory),
                                            taskStatus: taskStatus,
                                            taskTitle: taskTitle,
                                            isAlarmSet: isalarmSet,
                                            time: taskTime,
                                            taskDescription: taskDesc,
                                            taskDate: taskDate,
                                            category: taskCategory,
                                            taskTime: taskTime,
                                          ),
                                        );
                                      }

                                      String notificationID =
                                          '${taskDate.month}${taskDate.day}${taskTime.hour}${taskTime.minute}';

                                      NotificationService()
                                          .scheduleNotification(
                                              taskId: taskId,
                                              taskDate: taskDate,
                                              taskTime: taskTime,
                                              notificationId:
                                                  int.parse(notificationID),
                                              taskDesc: taskDesc,
                                              taskTitle: taskTitle,
                                              context: context,
                                              taskCategory: taskCategory,
                                              taskColor: model.services
                                                  .colorSelector(
                                                      taskCategory:
                                                          taskCategory),
                                              taskStaus: taskStatus);
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
                                              availableGridTasks.length > 0
                                                  ? GridView.count(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing:
                                                          kHPadding,
                                                      childAspectRatio: 1.1,
                                                      mainAxisSpacing:
                                                          kHPadding,
                                                      children: List.generate(
                                                          availableGridTasks
                                                              .length, (index) {
                                                        return PriorityTaskGrid(
                                                          taskStatus:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskStatus,
                                                          taskId:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskId,
                                                          taskDate:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskDate,
                                                          isAlarmSet:
                                                              availableGridTasks[
                                                                      index]
                                                                  .isAlarmSet,
                                                          taskCategory:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskCategory,
                                                          taskDesc:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskDescription,
                                                          color: model.selectColor(
                                                              thisTaskCategory:
                                                                  availableGridTasks[
                                                                          index]
                                                                      .taskCategory),
                                                          remainingTime:
                                                              'In ${availableGridTasks[index].taskTime.format(context)}',
                                                          taskTitle:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskTitle,
                                                          time:
                                                              availableGridTasks[
                                                                      index]
                                                                  .taskTime,
                                                        );
                                                      }),
                                                    )
                                                  : NoTaskFound(
                                                      title:
                                                          'No task created for today.',
                                                      imageSize: 150,
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
                                                                    FontWeight
                                                                        .w700,
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
                                                                    FontWeight
                                                                        .w700,
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
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Column(
                                                    children:
                                                        model.selectedTaskListFromTomorrowThisWeek ==
                                                                0
                                                            ? tomorrowTaskList
                                                            : weekTaskList,
                                                  ),
                                                  SizedBox(
                                                    height: kVPadding * 10,
                                                  )
                                                ],
                                              ),
                                            ])
                                      : NoTaskFound();
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
                                    String taskDesc =
                                        dataItem['Task Description'];
                                    String taskCategory =
                                        dataItem['Task Category'];
                                    String taskId = dataItem.id;
                                    bool isalarmSet = dataItem['isAlarmSet'];
                                    String taskStatus = dataItem['Task Status'];
                                    DateTime taskDate = DateTime(
                                        taskDateandTime.toDate().year,
                                        taskDateandTime.toDate().month,
                                        taskDateandTime.toDate().day);
                                    TimeOfDay taskTime = TimeOfDay(
                                        hour: taskDateandTime.toDate().hour,
                                        minute:
                                            taskDateandTime.toDate().minute);
                                    allTasksList.add(
                                      HorizontalTaskBuilder(
                                        taskId: taskId,
                                        isAlarmSet: isalarmSet,
                                        color: model.services.colorSelector(
                                            taskCategory: taskCategory),
                                        taskStatus: taskStatus,
                                        taskTitle: taskTitle,
                                        time: taskTime,
                                        taskTime: taskTime,
                                        category: taskCategory,
                                        taskDate: taskDate,
                                        taskDescription: taskDesc,
                                      ),
                                    );
                                  }

                                  return ListView(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.fromLTRB(
                                          0, kVPadding * 2, 0, 0),
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kHPadding),
                                          child: Column(
                                            children: [
                                              Column(
                                                children:
                                                    allTasksList.length > 0
                                                        ? allTasksList
                                                        : [
                                                            NoTaskFound(
                                                              imageSize: 150,
                                                            )
                                                          ],
                                              ),
                                              SizedBox(
                                                height: kVPadding * 10,
                                              )
                                            ],
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
