import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class ScheduleViewModel extends StreamViewModel<QuerySnapshot> {
  Services services = Services();
  String _displayName;
  get displayName => _displayName;
  initiate() {
    _displayName = services.auth.currentUser.displayName;
  }

  Color selectColor({@required thisTaskCategory}) {
    return services.colorSelector(taskCategory: thisTaskCategory);
  }

  int _selectedTaskListFromTomorrowThisWeek = 0;
  get selectedTaskListFromTomorrowThisWeek =>
      _selectedTaskListFromTomorrowThisWeek;
  tskListFromTomorrowThisWeekTabSelector(value) {
    _selectedTaskListFromTomorrowThisWeek = value;
    notifyListeners();
  }

  Stream<QuerySnapshot> getTasks() {
    return services.getTasks();
  }

  @override
  Stream<QuerySnapshot> get stream => getTasks();
}
