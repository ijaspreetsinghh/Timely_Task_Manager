import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskModel {
  TaskModel(
      {@required this.taskTitle,
      @required this.taskDate,
      @required this.taskDescription,
      @required this.isAlarmSet,
      @required this.taskCategory,
      @required this.taskTime});
  String taskTitle;
  String taskDescription;
  bool isAlarmSet;
  DateTime taskDate;
  TimeOfDay taskTime;
  String taskCategory;
}
