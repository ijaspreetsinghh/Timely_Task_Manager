import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskModel {
  TaskModel(
      {@required this.taskTitle,
      @required this.taskDate,
      @required this.taskDescription,
      @required this.isAlarmSet,
      @required this.taskCategory,
      @required this.taskTime,
      @required this.taskId,
      @required this.taskStatus});
  String taskTitle;
  String taskDescription;
  bool isAlarmSet;
  DateTime taskDate;
  TimeOfDay taskTime;
  String taskCategory;
  String taskId;
  String taskStatus;
}
