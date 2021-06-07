import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class SecondTabViewModel extends StreamViewModel {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  openEndDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }

  var _numberOfTasks;
  get numberOfTasks => _numberOfTasks;
  var _selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
  get selectedDate => _selectedDate;
  Services services = Services();
  dateSelector(DateTime thisDate) {
    _selectedDate = thisDate;

    notifyListeners();
  }

  setTotalTasks(value) {
    _numberOfTasks = value;
    // notifyListeners();
    print(numberOfTasks);
  }

  List dateProvider(DateTime today) {
    var startDate = today;
    var endDate = today.add(
      Duration(days: 30),
    );
    var daysToGenerate = endDate.difference(startDate).inDays;

    List<DateTime> days = List.generate(
      daysToGenerate,
      (index) => DateTime(
        startDate.year,
        startDate.month,
        startDate.day + (index),
      ),
    );

    return days;
  }

  Stream getTasks() {
    return services.getTasks();
  }

  @override
  Stream get stream => getTasks();
}
