import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/secondTab_ViewModel.dart';
import 'package:timely/meta/view/Screens/MainAppPages/viewAllTasksPage.dart';

import '../../../../main.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/components.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondTabViewModel>.reactive(
        onModelReady: (model) => model.dateSelector(dateToday),
        builder: (context, model, child) {
          return Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: Scaffold(
                extendBody: true,
                endDrawerEnableOpenDragGesture: false,
                key: model.scaffoldKey,
                appBar: AppBar(
                  actions: <Widget>[Container()],
                  brightness: Brightness.light,
                  elevation: 0, backgroundColor: Colors.white,
                  flexibleSpace: Container(
                    color: kPrimaryColor,
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kHPadding * 1.5,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    DateFormat('MMMMEEEEd')
                                        .format(model.selectedDate),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: kCircularStdFont,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                    onTap: () => model.openEndDrawer(),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: kHPadding / 2,
                                          top: kVPadding / 2,
                                          bottom: kVPadding / 2,
                                          right: 0),
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/menu.png',
                                        ),
                                        fit: BoxFit.fitWidth,
                                        height: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                model.selectedDate == dateToday
                                    ? 'You have total ${model.numberOfTasks} tasks today.'
                                    : model.selectedDate ==
                                            DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day + 1,
                                                0,
                                                0,
                                                0)
                                        ? 'You have total 5 tasks tomorrow.'
                                        : 'You have total 5 tasks on ${DateFormat('MMMEd').format(model.selectedDate)}.',
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.7),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                    fontSize: 14,
                                    fontFamily: kMuliFont),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kVPadding * 2,
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: kHPadding,
                          ),
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: model
                                .dateProvider(DateTime.now())
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        model.dateSelector(e);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: 60,
                                        height: 70,
                                        alignment: AlignmentDirectional.center,
                                        margin: EdgeInsets.only(
                                            right: kHPadding / 1.5),
                                        decoration: BoxDecoration(
                                            color: model.selectedDate == e
                                                ? Colors.white
                                                : Colors.white.withOpacity(.1),
                                            borderRadius: BorderRadius.circular(
                                                kBorderRadius)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${e.day}',
                                              style: kCircularStdText.copyWith(
                                                  color: model.selectedDate == e
                                                      ? kBlackTextColor
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: kVPadding / 2,
                                            ),
                                            Text(
                                              DateFormat('EE').format(e),
                                              style: kCircularStdText.copyWith(
                                                  color: model.selectedDate == e
                                                      ? kGrayTextColor
                                                      : kLightGrey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(kHPadding * 1.5,
                              kVPadding * 2, kHPadding * 1.5, 0),
                          margin: EdgeInsets.only(
                            top: kVPadding * 2,
                          ),
                          decoration: BoxDecoration(
                            color: kGreyWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kBorderRadius * 2),
                              topRight: Radius.circular(kBorderRadius * 2),
                            ),
                          ),
                          child: Row(
                            children: [
                              FormHeading(title: 'My Tasks'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // backgroundColor: kGreyWhite,
                  toolbarHeight: 220,
                  automaticallyImplyLeading: false,
                  foregroundColor: kRedColor,
                ),
                backgroundColor: kGreyWhite,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      // transform: Matrix4.translationValues(0, -30, 0),
                      padding: EdgeInsets.fromLTRB(
                          kHPadding * 1.5, 0, kHPadding * 1.5, kVPadding * 3),
                      decoration: BoxDecoration(
                          color: kGreyWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kBorderRadius * 2),
                              topRight: Radius.circular(kBorderRadius * 2))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: kVPadding,
                          ),
                          StreamBuilder(
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data.docs;
                                List<HorizontalTaskBuilder> taskList = [];
                                for (var dataItem in data) {
                                  String taskTitle = dataItem['Task Title'];
                                  Timestamp taskDateandTime =
                                      dataItem['Task Date Time'];
                                  String taskDesc =
                                      dataItem['Task Description'];
                                  String taskCategory =
                                      dataItem['Task Category'];
                                  bool isalarmSet = dataItem['isAlarmSet'];
                                  String taskStatus = dataItem['Task Status'];
                                  String taskId = dataItem.id;
                                  DateTime taskDate = DateTime(
                                      taskDateandTime.toDate().year,
                                      taskDateandTime.toDate().month,
                                      taskDateandTime.toDate().day);
                                  TimeOfDay taskTime = TimeOfDay(
                                      hour: taskDateandTime.toDate().hour,
                                      minute: taskDateandTime.toDate().minute);
                                  if (taskDate == model.selectedDate) {
                                    taskList.add(
                                      HorizontalTaskBuilder(
                                        taskId: taskId,
                                        taskStatus: taskStatus,
                                        isAlarmSet: isalarmSet,
                                        color: model.services.colorSelector(
                                            taskCategory: taskCategory),
                                        taskTitle: taskTitle,
                                        time: taskTime,
                                        taskDescription: taskDesc,
                                        taskDate: taskDate,
                                        category: taskCategory,
                                        taskTime: taskTime,
                                      ),
                                    );
                                  }
                                  model.setTotalTasks(taskList.length);
                                }
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: taskList.length > 0
                                      ? taskList
                                      : [NoTaskFound()],
                                );
                              } else
                                return Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                            },
                            stream: model.stream,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                endDrawer: Drawer(
                  elevation: 20.0,
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: kVPadding),
                      physics: BouncingScrollPhysics(),
                      children: [
                        ListTile(
                          leading: Icon(Icons.history_rounded),
                          title: Text(
                            'Tasks History',
                            style: kCircularStdText.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: kBlackTextColor),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.upcoming_rounded),
                          onTap: () {
                            NavigationService.instance.goBack();
                            NavigationService.instance
                                .pushNamed(ViewAllTasksPage.route);
                          },
                          title: Text(
                            'View Upcoming Tasks',
                            style: kCircularStdText.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: kBlackTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => SecondTabViewModel());
  }
}

class TimelineTaskBuilder extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String time;
  final String taskTitle;
  const TimelineTaskBuilder(
      {@required this.icon,
      @required this.time,
      @required this.taskTitle,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(3),
          child: Icon(
            icon,
            size: 16,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          width: kVPadding,
        ),
        Text(
          time,
          style: kHintTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          width: kVPadding,
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: kVPadding),
            padding: EdgeInsets.only(
                left: kHPadding,
                right: kHPadding,
                top: kVPadding * 3,
                bottom: kVPadding * 3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: kCircularStdText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
