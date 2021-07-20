import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/view_history_tasks_page_viewModel.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class ViewHistoryTasksPage extends StatelessWidget {
  static const route = 'ViewHistoryTasksPage';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewHistoryTasksPageViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: kGreyWhite,
                appBar: AppBar(
                  elevation: 0,
                  title: FormHeading(
                    title: 'History',
                  ),
                  backgroundColor: kGreyWhite,
                  leading: BackButtonWithoutAppBar(
                    iconColor: kBlackTextColor,
                  ),
                  leadingWidth: 35,
                ),
                body: StreamBuilder(
                  stream: model.stream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<HorizontalTaskBuilder> allTasksList = [];
                      var data = snapshot.data.docs;
                      for (var dataItem in data) {
                        String taskTitle = dataItem['Task Title'];
                        Timestamp taskDateandTime = dataItem['Task Date Time'];
                        String taskDesc = dataItem['Task Description'];
                        String taskCategory = dataItem['Task Category'];
                        String taskId = dataItem.id;
                        bool isalarmSet = dataItem['isAlarmSet'];
                        String taskStatus = dataItem['Task Status'];
                        DateTime taskDate = DateTime(
                            taskDateandTime.toDate().year,
                            taskDateandTime.toDate().month,
                            taskDateandTime.toDate().day);
                        TimeOfDay taskTime = TimeOfDay(
                            hour: taskDateandTime.toDate().hour,
                            minute: taskDateandTime.toDate().minute);
                        allTasksList.add(
                          HorizontalTaskBuilder(
                            taskId: taskId,
                            isAlarmSet: isalarmSet,
                            color: model.services
                                .colorSelector(taskCategory: taskCategory),
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
                          shrinkWrap: true,
                          padding: EdgeInsets.fromLTRB(0, kVPadding * 2, 0, 0),
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: kHPadding),
                              child: allTasksList.length > 0
                                  ? AbsorbPointer(
                                      child: Column(children: allTasksList))
                                  : Container(
                                      alignment: AlignmentDirectional.center,
                                      margin:
                                          EdgeInsets.only(top: kVPadding * 10),
                                      child: FormHeading(
                                        title: 'No History',
                                        color: Color(0xff777777),
                                      ),
                                    ),
                            ),
                          ]);
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => ViewHistoryTasksPageViewModel());
  }
}
