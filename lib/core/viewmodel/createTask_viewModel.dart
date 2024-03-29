import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:timely/app/taskCategory.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class CreateTaskViewModel extends BaseViewModel {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  get autoValidate => _autoValidate;
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();
  GlobalKey<FormState> createTaskFormKey = GlobalKey();
  Services services = Services();
  DateTime _pickedDate = DateTime.now();
  TimeOfDay _pickedTime = TimeOfDay.now();

  get pickedDate => _pickedDate;
  get pickedTime => _pickedTime;

  String _taskTitle = '';
  get taskTitle => _taskTitle;
  String _selectedCategoryTitle = 'Home';
  get selectedCategoryTitle => _selectedCategoryTitle;
  Color _selectedCategoryColor = kGreenColor;
  get selectedCategoryColor => _selectedCategoryColor;

  bool _isAlarmSet = true;
  get isAlarmSet => _isAlarmSet;

  taskTitleValidator(thisTaskTitle) {
    if (thisTaskTitle.length < 1) {
      return 'Task without it\'s name?';
    }
  }

  List<TaskCategory> availableCategories = [
    TaskCategory(categoryTitle: 'Home', categoryColor: kGreenColor),
    TaskCategory(categoryTitle: 'Work', categoryColor: kRedColor),
    TaskCategory(categoryTitle: 'Personal', categoryColor: kPrimaryColor),
  ];
  showCategorySelectionSheet({
    BuildContext ctx,
  }) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 20,
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffbbbbb9),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  height: 3,
                  width: 75,
                  alignment: AlignmentDirectional.center,
                ),
                SizedBox(
                  height: kVPadding,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(kHPadding * 1.5, kVPadding * 2,
                      kHPadding * 1.5, kVPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                      FormHeading(title: 'Categorize Task'),
                      SizedBox(
                        height: kVPadding * 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:
                            List.generate(availableCategories.length, (index) {
                          return TextButton(
                            onPressed: () {
                              _selectedCategoryTitle =
                                  availableCategories[index].categoryTitle;
                              _selectedCategoryColor =
                                  availableCategories[index].categoryColor;
                              notifyListeners();
                              NavigationService.instance.goBack();
                            },
                            style: TextButton.styleFrom(
                                primary:
                                    availableCategories[index].categoryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: kHPadding,
                                    vertical: kVPadding)),
                            child: Row(
                              children: [
                                Text(
                                  availableCategories[index].categoryTitle,
                                  style: kCircularStdText.copyWith(
                                      color: availableCategories[index]
                                          .categoryColor,
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.w700), //categoryColor??
                                ),
                                SizedBox(
                                  width: kHPadding,
                                ),
                                Visibility(
                                  child: Icon(
                                    Icons.check,
                                    size: 22,
                                  ),
                                  visible: selectedCategoryTitle ==
                                      availableCategories[index].categoryTitle,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: kVPadding * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  validateCreateTask() {
    _autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (createTaskFormKey.currentState.validate()) {
      createTask();
    }
  }

  Future createTask() async {
    Timestamp myTimeStamp = Timestamp.fromDate(DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
        0));
    String createTaskTitle = taskTitleController.text;
    bool alarmSet = isAlarmSet;
    String createTaskDesc = taskDescController.text;
    String createTaskCategory = selectedCategoryTitle;
    await services.createTask(
        alarmSet: alarmSet,
        taskDateTime: myTimeStamp,
        taskTitle: createTaskTitle,
        taskDescription: createTaskDesc,
        taskCategory: createTaskCategory);
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
