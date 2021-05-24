import 'package:stacked/stacked.dart';

class SecondTabViewModel extends BaseViewModel {
  var _selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
  get selectedDate => _selectedDate;

  dateSelector(DateTime thisDate) {
    _selectedDate = thisDate;

    notifyListeners();
  }

  List dateProvider(DateTime today) {
    var startDate = today;
    var endDate = today.add(Duration(days: 30));
    var daysToGenerate = endDate.difference(startDate).inDays;

    List<DateTime> days = List.generate(
        daysToGenerate,
        (index) =>
            DateTime(startDate.year, startDate.month, startDate.day + (index)));

    return days;
  }
}
