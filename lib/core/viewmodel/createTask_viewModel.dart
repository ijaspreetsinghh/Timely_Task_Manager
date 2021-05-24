import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:timely/core/services/services.dart';

class CreateTaskViewModel extends BaseViewModel {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  Services services = Services();
  DateTime _pickedDate = DateTime.now();
  TimeOfDay _pickedTime = TimeOfDay.now();

  get pickedDate => _pickedDate;
  get pickedTime => _pickedTime;

  bool _isAlarmSet = false;
  get isAlarmSet => _isAlarmSet;
  changeCheckBox() {
    _isAlarmSet = !_isAlarmSet;
    notifyListeners();
  }

  Future createTask() async {
    await services.createTask();
  }

  pickTime(time) {
    var selectedTime = time;
    if (selectedTime != null) {
      _pickedTime = selectedTime;
    }

    notifyListeners();
  }

  pickDate(date) {
    var selectedDate = date;
    if (selectedDate != null) {
      _pickedDate = selectedDate;
    }

    notifyListeners();
  }
}
