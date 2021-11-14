import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timely/core/viewmodel/taskViewAndUpdate_viewModel.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future notificationSelected(
    String payload,
  ) {
    Map<String, dynamic> data = jsonDecode(payload);

    return TaskViewAndUpdateViewModel().viewSelectedTask(
        ctx: data['exIJJSX8RA1ctx'],
        taskName: data['exIJJSX8RA1taskName'],
        taskDesc: data['exIJJSX8RA1taskDesc'],
        taskTime: data['exIJJSX8RA1taskTime'],
        taskDate: data['exIJJSX8RA1taskDate'],
        taskId: data['exIJJSX8RA1taskId'],
        taskCategory: data['exIJJSX8RA1taskCategory'],
        taskColor: data['exIJJSX8RA1taskColor'],
        taskStatus: data['exIJJSX8RA1taskStatus']);
  }

  void init() {
    tz.initializeTimeZones();

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      'app_icon',
    );
    final IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSettings,
      macOS: null,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: notificationSelected,
    );
  }

  Future cancelNotification(int taskIdInInt) async {
    return flutterLocalNotificationsPlugin.cancel(taskIdInInt);
  }

  Future scheduleNotification(
      {@required String taskId,
      @required DateTime taskDate,
      @required TimeOfDay taskTime,
      @required int notificationId,
      @required String taskTitle,
      @required String taskDesc,
      @required String taskStaus,
      @required Color taskColor,
      @required String taskCategory,
      @required BuildContext context}) async {
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      taskId,
      taskTitle,
      taskDesc,
      importance: Importance.high,
      priority: Priority.high,
    );
    final IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails();
    final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
        macOS: null);

    final duration = DateTime(taskDate.year, taskDate.month, taskDate.day,
            taskTime.hour, taskTime.minute, 0, 0, 0)
        .difference(DateTime.now())
        .inSeconds;
    if (duration > 0) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          notificationId,
          taskTitle,
          taskDesc,
          tz.TZDateTime.now(tz.local).add(Duration(seconds: duration)),
          notificationDetails,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload:
              '{exIJJSX8RA1taskId: $taskId,exIJJSX8RA1taskName: $taskTitle,exIJJSX8RA1ctx: $context,exIJJSX8RA1taskDesc: $taskDesc,exIJJSX8RA1taskDate: $taskDate,exIJJSX8RA1taskCategory: $taskCategory,exIJJSX8RA1taskTime: $taskTime,exIJJSX8RA1taskColor: $taskColor,exIJJSX8RA1taskStatus: $taskStaus}',
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          androidAllowWhileIdle: true);
    }
  }
}
