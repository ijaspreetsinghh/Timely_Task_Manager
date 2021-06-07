import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/taskViewAndUpdate_viewModel.dart';
import 'package:timely/meta/view/Screens/MainAppPages/createTask.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class TaskViewAndUpdate extends StatefulWidget {
  TaskViewAndUpdate(
      {@required this.taskName,
      @required this.taskDesc,
      @required this.taskTime,
      @required this.taskDate,
      @required this.taskCategory,
      @required this.taskColor,
      @required this.taskId,
      @required this.isAlarmSet});
  final taskName;
  final taskDesc;
  final taskTime;
  final taskDate;
  final taskCategory;
  final taskColor;
  final taskId;
  final isAlarmSet;

  @override
  _TaskViewAndUpdateState createState() => _TaskViewAndUpdateState();
}

class _TaskViewAndUpdateState extends State<TaskViewAndUpdate> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewAndUpdateViewModel>.reactive(
        onModelReady: (model) => model.initialize(
            thisSelectedCategoryTitle: widget.taskCategory,
            thisSelectedCategoryColor: widget.taskColor,
            thisTaskDescription: widget.taskDesc,
            thisTaskTime: widget.taskTime,
            thisTaskName: widget.taskName,
            thisTaskDate: widget.taskDate),
        builder: (context, model, child) {
          return Column(
            // shrinkWrap: true,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                padding: EdgeInsets.fromLTRB(
                    kHPadding * 1.5, kVPadding * 4, 0, kVPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius * 2),
                    topRight: Radius.circular(kBorderRadius * 2),
                  ),
                ),
                duration: Duration(microseconds: 400),
                curve: Curves.ease,
                child: AnimatedCrossFade(
                  firstChild: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FormHeading(
                              title: widget.taskName,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: services.colorSelector(
                                    taskCategory: widget.taskCategory),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kBorderRadius),
                                    bottomLeft:
                                        Radius.circular(kBorderRadius))),
                            width: 30,
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kVPadding * 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHPadding * 1.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FieldTitle(
                                  fieldName: 'date',
                                ),
                                Text(
                                  DateFormat('MMMMEEEEd')
                                      .format(widget.taskDate),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: kCircularStdText.copyWith(
                                      color: kBlackTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: kHPadding * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FieldTitle(
                                    fieldName: 'time',
                                  ),
                                  Text(
                                    widget.taskTime.format(context),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: kCircularStdText.copyWith(
                                        color: kBlackTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kVPadding * 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHPadding * 1.5),
                        child: FieldTitle(
                          fieldName: 'description',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHPadding * 1.5),
                        child: Text(
                          widget.taskDesc == '' ? 'NA' : widget.taskDesc,
                          overflow: TextOverflow.visible,
                          style: kCircularStdText.copyWith(
                              color: kBlackTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: kVPadding * 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHPadding * 1.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                transform: Matrix4.translationValues(0, 6, 0),
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        edit = true;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                        primary: kPrimaryColor,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: kHPadding * 1.5,
                                            vertical: kVPadding * 2)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.edit_rounded,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(
                                          width: kHPadding / 2,
                                        ),
                                        Text(
                                          'Edit',
                                          style: kCircularStdText.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: kPrimaryColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Container(
                              width: .5,
                              height: 30,
                              transform: Matrix4.translationValues(0, 6, 0),
                              color: kBlackTextColor.withOpacity(.2),
                            ),
                            Expanded(
                              child: Container(
                                transform: Matrix4.translationValues(0, 6, 0),
                                child: TextButton(
                                    onPressed: () {
                                      model.deleteTask(taskId: widget.taskId);
                                    },
                                    style: TextButton.styleFrom(
                                        primary: kRedColor,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: kHPadding * 1.5,
                                            vertical: kVPadding * 2)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.delete_outline_rounded,
                                          color: kRedColor,
                                        ),
                                        SizedBox(
                                          width: kHPadding / 2,
                                        ),
                                        Text(
                                          'Delete',
                                          style: kCircularStdText.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: kRedColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, 6, 0),
                        height: .5,
                        color: kBlackTextColor.withOpacity(.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHPadding * 1.5),
                        child: Container(
                          transform: Matrix4.translationValues(0, 6, 0),
                          child: TextButton(
                              onPressed: () => model.markTaskAsDone(
                                  taskTime: model.pickedTime,
                                  taskDate: model.pickedDate,
                                  taskCategory: model.selectedCategoryTitle,
                                  taskDesc:
                                      model.taskDescriptionController.text,
                                  taskName: model.taskNameController.text,
                                  taskId: widget.taskId,
                                  isAlarmSet: model.isAlarmSet),
                              style: TextButton.styleFrom(
                                  primary: kBlackTextColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kHPadding * 1.5,
                                      vertical: kVPadding * 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                  ),
                                  SizedBox(
                                    width: kHPadding,
                                  ),
                                  Text(
                                    'Mark as Done',
                                    style: kCircularStdText.copyWith(
                                        color: kBlackTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  secondChild: IgnorePointer(
                    ignoring: !edit,
                    child: Form(
                      autovalidateMode: model.autoValidate,
                      key: model.updateTaskFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            style: kCircularStdText.copyWith(
                                fontSize: 20,
                                color: kBlackTextColor,
                                fontWeight: FontWeight.w700),
                            validator: (value) =>
                                model.taskTitleValidator(value),
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: kPrimaryColor,
                            cursorHeight: 26,
                            controller: model.taskNameController,
                            decoration: InputDecoration(
                              errorStyle: kErrorTextStyle,
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kRedColor),
                              ),
                              hintText: 'Zoom meeting with John.. etc.',
                              hintStyle: kHintTextStyle,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kGrayTextColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).requestFocus();
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(
                                        (DateTime.now().year),
                                        (DateTime.now().month + 1),
                                        (DateTime.now().day)),
                                  ).then((date) {
                                    model.pickDate(date);
                                  }).catchError((onError) {
                                    NavigationService.instance.hideLoader();
                                    NavigationService.instance
                                        .showAlertWithOneButton(
                                            title: 'Failure',
                                            content:
                                                'Following error occurred \'$onError\'.',
                                            primaryAction: () =>
                                                NavigationService.instance
                                                    .goBack(),
                                            primaryActionTitle: 'Try again');
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Date'.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: kGrayTextColor,
                                        fontFamily: kCircularStdFont,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('yMMMMd')
                                              .format(model.pickedDate),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: kBlackTextColor,
                                            fontFamily: kCircularStdFont,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kHPadding / 2),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).requestFocus();
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time) {
                                    model.pickTime(time);
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'time'.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: kGrayTextColor,
                                        fontFamily: kCircularStdFont,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          model.pickedTime.format(context),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: kBlackTextColor,
                                            fontFamily: kCircularStdFont,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kHPadding / 2),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'description'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kGrayTextColor,
                                  fontFamily: kCircularStdFont,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Scrollbar(
                                controller: model.scrollController,
                                child: TextField(
                                  maxLines: 5,
                                  minLines: 3,
                                  style: kCircularStdText.copyWith(
                                      fontSize: 16,
                                      color: kBlackTextColor,
                                      fontWeight: FontWeight.w500),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  cursorColor: kPrimaryColor,
                                  cursorHeight: 22,
                                  controller: model.taskDescriptionController,
                                  decoration: InputDecoration(
                                    hintText:
                                        'The agenda of the meeting will be..',
                                    hintStyle: kHintTextStyle,
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kGrayTextColor)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'category'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kGrayTextColor,
                                  fontFamily: kCircularStdFont,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: kVPadding,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TaskCategoryButton(
                                          title: model.selectedCategoryTitle,
                                          categoryColor:
                                              model.selectedCategoryColor,
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              model.showCategorySelectionSheet(
                                                  ctx: context),
                                          style: TextButton.styleFrom(
                                              primary: kBlackTextColor,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: kHPadding,
                                                  vertical: 0)),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Change Category',
                                                style:
                                                    kCircularStdText.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                width: kHPadding / 2,
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: kPrimaryColor,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () => model.changeCheckBox(),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 16,
                                    color: kGreyWhite,
                                  ),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: model.isAlarmSet == true
                                          ? kPrimaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                          kBorderRadius / 2),
                                      border: Border.all(
                                          color: kPrimaryColor, width: 1.5)),
                                ),
                              ),
                              SizedBox(
                                width: kVPadding,
                              ),
                              Text(
                                'Set alarm for notification.',
                                style: kCircularStdText.copyWith(
                                    color: kBlackTextColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  transform: Matrix4.translationValues(0, 6, 0),
                                  child: TextButton(
                                      onPressed: () {
                                        model.updateTask(
                                            taskTime: model.pickedTime,
                                            taskDate: model.pickedDate,
                                            taskCategory:
                                                model.selectedCategoryTitle,
                                            taskDesc: model
                                                .taskDescriptionController.text,
                                            taskName:
                                                model.taskNameController.text,
                                            taskId: widget.taskId,
                                            isAlarmSet: model.isAlarmSet);
                                      },
                                      style: TextButton.styleFrom(
                                          primary: kPrimaryColor,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kHPadding * 1.5,
                                              vertical: kVPadding * 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: kHPadding / 2,
                                          ),
                                          Text(
                                            'Update',
                                            style: kCircularStdText.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: kPrimaryColor,
                                                fontSize: 16),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 30,
                                transform: Matrix4.translationValues(0, 6, 0),
                                color: kBlackTextColor.withOpacity(.2),
                              ),
                              Expanded(
                                child: Container(
                                  transform: Matrix4.translationValues(0, 6, 0),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          edit = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                          primary: kRedColor,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kHPadding * 1.5,
                                              vertical: kVPadding * 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.close_rounded,
                                            color: kRedColor,
                                          ),
                                          SizedBox(
                                            width: kHPadding / 2,
                                          ),
                                          Text(
                                            'Cancel',
                                            style: kCircularStdText.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: kRedColor,
                                                fontSize: 16),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  duration: Duration(microseconds: 400),
                  crossFadeState: edit
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ),
            ],
          );
        },
        viewModelBuilder: () => TaskViewAndUpdateViewModel());
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    this.fieldName,
  });
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kVPadding / 2),
      child: Text(
        fieldName.toUpperCase(),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: kCircularStdText.copyWith(
            color: kGrayTextColor.withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
