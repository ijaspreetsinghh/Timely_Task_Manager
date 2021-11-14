import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/core/viewmodel/taskViewAndUpdate_viewModel.dart';

import 'constants.dart';

Services services = Services();

class PrimaryButton extends StatelessWidget {
  final String title;
  final dynamic action;
  final Color buttonColor;
  final Color buttonBackgroundColor;
  final Color textColor;
  final double hPadding;
  final double vPadding;
  final double textSize;
  PrimaryButton(
      {this.title,
      this.action,
      this.buttonBackgroundColor,
      this.buttonColor,
      this.textColor,
      this.hPadding,
      this.textSize,
      this.vPadding});
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(357 / 360),
      child: Container(
        decoration: BoxDecoration(
          color: (buttonBackgroundColor ?? kPrimaryButtonColor).withOpacity(.3),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(3 / 360),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: textColor,
                shadowColor: Colors.transparent,
                primary: buttonColor ?? kPrimaryButtonColor,
                padding: EdgeInsets.symmetric(
                    horizontal: hPadding ?? (kHPadding * 1.5),
                    vertical: vPadding ?? (kVPadding * 1.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                )),
            onPressed: () => action(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: textSize ?? 18,
                      color: textColor ?? Colors.white,
                      fontFamily: kCircularStdFont,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeading extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final TextAlign alignment;
  FormHeading(
      {@required this.title, this.color, this.fontSize, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment ?? TextAlign.left,
      overflow: TextOverflow.visible,
      style: kCircularStdText.copyWith(
          fontSize: fontSize ?? 22,
          fontWeight: FontWeight.w700,
          color: color ?? kBlackTextColor),
    );
  }
}

class PriorityTaskGrid extends StatelessWidget {
  final String taskTitle;
  final String remainingTime;
  final Color color;
  final TimeOfDay time;
  final String taskDesc;
  final String taskCategory;
  final bool isAlarmSet;
  final DateTime taskDate;
  final String taskId;
  final String taskStatus;

  PriorityTaskGrid(
      {@required this.color,
      @required this.remainingTime,
      @required this.taskTitle,
      @required this.time,
      @required this.isAlarmSet,
      @required this.taskCategory,
      @required this.taskDesc,
      @required this.taskDate,
      @required this.taskId,
      @required this.taskStatus});
  IconData getIcon(
      thisTaskStatus, TimeOfDay thisTaskTime, DateTime thisTaskDate) {
    if (thisTaskStatus == 'Pending') {
      DateTime taskDeadline = DateTime(thisTaskDate.year, thisTaskDate.month,
          thisTaskDate.day, thisTaskTime.hour, thisTaskTime.minute, 0);

      if (taskDeadline.isBefore(DateTime.now())) {
        return Icons.priority_high_rounded;
      } else {
        return Icons.access_time_rounded;
      }
    } else if (taskStatus == 'Done') {
      return Icons.check;
    } else {
      return Icons.priority_high;
    }
  }

  Color getColor(
      thisTaskStatus, TimeOfDay thisTaskTime, DateTime thisTaskDate) {
    if (thisTaskStatus == 'Pending') {
      DateTime taskDeadline = DateTime(thisTaskDate.year, thisTaskDate.month,
          thisTaskDate.day, thisTaskTime.hour, thisTaskTime.minute, 0);

      if (taskDeadline.isBefore(DateTime.now())) {
        return kRedColor;
      } else {
        return kYellowColor;
      }
    } else if (taskStatus == 'Done') {
      return kGreenColor;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewAndUpdateViewModel>.reactive(
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () => model.viewSelectedTask(
                taskId: taskId,
                taskName: taskTitle,
                ctx: context,
                taskDesc: taskDesc,
                taskDate: taskDate,
                taskCategory: taskCategory,
                taskTime: time,
                taskColor: color,
                taskStatus: taskStatus),
            child: Container(
              padding: EdgeInsets.only(
                  left: kVPadding, top: kVPadding, bottom: kVPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: taskStatus == 'Done' ? kGreenColor : Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time.format(context),
                        style: kHintTextStyle.copyWith(
                          fontSize: 13,
                          color: taskStatus == 'Done'
                              ? Colors.white
                              : kGrayTextColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kBorderRadius),
                                bottomLeft: Radius.circular(kBorderRadius))),
                        width: 30,
                        height: 7,
                      )
                    ],
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                  Expanded(
                    child: Text(
                      taskTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: kCircularStdText.copyWith(
                          color: taskStatus == 'Done'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          getIcon(taskStatus, time, taskDate),
                          size: 14,
                          color: kGreyWhite,
                        ),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: getColor(taskStatus, time, taskDate),
                              width: 2),
                          color: getColor(taskStatus, time, taskDate),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: kVPadding),
                          child: AlarmBellIcon(
                            isAlarmSet: isAlarmSet,
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => TaskViewAndUpdateViewModel());
  }
}

class CategoryGrid extends StatelessWidget {
  CategoryGrid(
      {@required this.icon,
      @required this.categoryName,
      @required this.numberOfTasks});
  final IconData icon;
  final String categoryName;
  final int numberOfTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.all(kVPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: services.colorSelector(taskCategory: categoryName),
                    borderRadius: BorderRadius.circular(kBorderRadius / 3)),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              SizedBox(
                width: kHPadding * 1.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    numberOfTasks.toString(),
                    style: kCircularStdText.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Tasks',
                    style: TextStyle(
                        color: kGrayTextColor,
                        fontSize: 14,
                        fontFamily: kCircularStdFont,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: kVPadding,
          ),
          Text(
            categoryName,
            style: kCircularStdText.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class HorizontalTaskBuilder extends StatelessWidget {
  final String taskTitle;
  final TimeOfDay time;
  final Color color;
  final String taskDescription;
  final String category;
  final DateTime taskDate;
  final TimeOfDay taskTime;
  final bool isAlarmSet;
  final String taskStatus;
  final String taskId;
  HorizontalTaskBuilder(
      {@required this.color,
      @required this.taskTitle,
      @required this.time,
      @required this.taskTime,
      @required this.taskDate,
      @required this.taskDescription,
      @required this.category,
      @required this.isAlarmSet,
      @required this.taskStatus,
      @required this.taskId});

  IconData getIcon(
      thisTaskStatus, TimeOfDay thisTaskTime, DateTime thisTaskDate) {
    if (thisTaskStatus == 'Pending') {
      DateTime taskDeadline = DateTime(thisTaskDate.year, thisTaskDate.month,
          thisTaskDate.day, thisTaskTime.hour, thisTaskTime.minute, 0);

      if (taskDeadline.isBefore(DateTime.now())) {
        return Icons.priority_high_rounded;
      } else {
        return Icons.access_time_rounded;
      }
    } else if (taskStatus == 'Done') {
      return Icons.check;
    } else {
      return Icons.priority_high;
    }
  }

  Color getColor(
      thisTaskStatus, TimeOfDay thisTaskTime, DateTime thisTaskDate) {
    if (thisTaskStatus == 'Pending') {
      DateTime taskDeadline = DateTime(thisTaskDate.year, thisTaskDate.month,
          thisTaskDate.day, thisTaskTime.hour, thisTaskTime.minute, 0);

      if (taskDeadline.isBefore(DateTime.now())) {
        return kRedColor;
      } else {
        return kYellowColor;
      }
    } else if (taskStatus == 'Done') {
      return kGreenColor;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewAndUpdateViewModel>.reactive(
        builder: (context, model, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Icon(
                  getIcon(taskStatus, taskTime, taskDate),
                  size: 18,
                  color: kGreyWhite,
                ),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: getColor(taskStatus, taskTime, taskDate),
                      width: 2),
                  color: getColor(taskStatus, taskTime, taskDate),
                ),
              ),
              SizedBox(
                width: kHPadding,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => model.viewSelectedTask(
                      taskId: taskId,
                      taskName: taskTitle,
                      ctx: context,
                      taskDesc: taskDescription,
                      taskDate: taskDate,
                      taskCategory: category,
                      taskTime: time,
                      taskColor: color,
                      taskStatus: taskStatus),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: kVPadding),
                    padding: EdgeInsets.only(
                        left: kHPadding,
                        top: kVPadding * 2,
                        bottom: kVPadding * 2),
                    decoration: BoxDecoration(
                        color:
                            taskStatus == 'Done' ? kGreenColor : Colors.white,
                        borderRadius: BorderRadius.circular(kBorderRadius)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kBorderRadius),
                                  bottomLeft: Radius.circular(kBorderRadius))),
                          width: 25,
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                taskTitle,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: kCircularStdText.copyWith(
                                    color: taskStatus == 'Done'
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: kHPadding / 2),
                          child: Text(
                            '${time.format(context)} on ${DateFormat('MMMMEEEEd').format(taskDate)}',
                            style: kHintTextStyle.copyWith(
                              fontSize: 13,
                              color: taskStatus == 'Done'
                                  ? Colors.white
                                  : kGrayTextColor,
                              fontFamily: kCircularStdFont,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        viewModelBuilder: () => TaskViewAndUpdateViewModel());
  }
}

class AlarmBellIcon extends StatelessWidget {
  const AlarmBellIcon({@required this.isAlarmSet, this.iconSize, this.color});
  final bool isAlarmSet;
  final double iconSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(15 / 360),
      child: Icon(
        isAlarmSet
            ? Icons.notifications_active_outlined
            : Icons.notifications_off_outlined,
        color: color ?? (isAlarmSet ? kPrimaryColor : kGrayTextColor),
        size: iconSize ?? 18,
      ),
    );
  }
}

class MyTaskNameBuilder extends StatelessWidget {
  final String taskTitle;

  MyTaskNameBuilder({@required this.taskTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: kHPadding, top: kVPadding * 2, bottom: kVPadding * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  taskTitle,
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: kCircularStdText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeLineTaskBuilder extends StatelessWidget {
  final String taskName;
  final String time;
  const TimeLineTaskBuilder({@required this.time, @required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kVPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: kHPadding,
          ),
          Text(
            time,
            style: kHintTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          SizedBox(
            width: kHPadding,
          ),
          Flexible(
            flex: 2,
            child: MyTaskNameBuilder(
              taskTitle: taskName,
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonWithoutAppBar extends StatelessWidget {
  final Color iconColor;
  const BackButtonWithoutAppBar({this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: iconColor ?? kPrimaryColor,
        size: 24,
      ),
      onPressed: () => NavigationService.instance.goBack(),
    );
  }
}

class OnBoardingPageTitle extends StatelessWidget {
  final String pageTitle;
  OnBoardingPageTitle(
      {@required this.pageTitle, @required this.topMargin, this.textColor});
  final double topMargin;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kHPadding * 2,
        right: kHPadding * 2,
        top: topMargin,
      ),
      alignment: AlignmentDirectional.topStart,
      child: Text(
        pageTitle,
        style: kCircularStdText.copyWith(
            color: textColor ?? kBlackTextColor,
            fontSize: 26,
            fontFamily: kMuliFont,
            height: 1.3,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  final String imagePath;
  final double verticalPadding;
  OnBoardingImage({@required this.imagePath, @required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: kHPadding),
      child: Image(
        image: AssetImage(imagePath),
      ),
    );
  }
}

class ProfileEntryField extends StatelessWidget {
  final String buttonTitle;
  final String entryText;
  final Function action;
  ProfileEntryField(
      {@required this.action,
      @required this.buttonTitle,
      @required this.entryText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            entryText,
            overflow: TextOverflow.ellipsis,
            style: kCircularStdText.copyWith(
                fontWeight: FontWeight.w700,
                color: kBlackTextColor,
                fontSize: 18),
          ),
        ),
        SizedBox(
          width: kHPadding / 2,
        ),
        GestureDetector(
          onTap: action,
          child: Container(
            margin: EdgeInsets.only(top: kVPadding),
            decoration: BoxDecoration(
              color: kBlackTextColor,
              // border: Border.all(color: kGreyWhite, width: 2),
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: kHPadding, vertical: kVPadding / 1.5),
            child: Text(
              buttonTitle,
              overflow: TextOverflow.ellipsis,
              style: kCircularStdText.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

class NoTaskFound extends StatelessWidget {
  const NoTaskFound({this.title, this.imageSize});
  final String title;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyWhite,
      padding: EdgeInsets.symmetric(horizontal: kHPadding, vertical: kVPadding),
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: imageSize ?? 200,
            fit: BoxFit.contain,
            image: AssetImage('assets/images/organized.png'),
          ),
          SizedBox(
            height: kVPadding,
          ),
          FormHeading(
            title: title ?? 'No task for selected date.',
            fontSize: 18,
            alignment: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}
