import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/createTask_viewModel.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class CreateTask extends StatelessWidget {
  static const route = 'CreateTask';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateTaskViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: kPrimaryColor,
                appBar: AppBar(
                  brightness: Brightness.light,
                  elevation: 0, backgroundColor: Colors.white,
                  flexibleSpace: Container(
                    color: kPrimaryColor,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BackButtonWithoutAppBar(
                          iconColor: Colors.white,
                        ),
                        SizedBox(
                          height: kVPadding,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kHPadding * 1.5),
                          child: FormHeading(
                            title: 'Add Task',
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: kVPadding * 3,
                        ),
                      ],
                    ),
                  ),
                  // backgroundColor: kGreyWhite,
                  toolbarHeight: 130,
                  automaticallyImplyLeading: false,
                  foregroundColor: kRedColor,
                ),
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kHPadding * 1.5, vertical: kVPadding * 3),
                  decoration: BoxDecoration(
                      color: kGreyWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadius * 2),
                          topRight: Radius.circular(kBorderRadius * 2))),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: kHPadding * .7),
                    physics: BouncingScrollPhysics(),
                    children: [
                      TextField(
                        style: kCircularStdText.copyWith(
                            fontSize: 20, color: kBlackTextColor),
                        textCapitalization: TextCapitalization.sentences,
                        cursorColor: kPrimaryColor,
                        cursorHeight: 26,
                        decoration: InputDecoration(
                          hintText: 'Zoom meeting with John.. etc.',
                          hintStyle: kHintTextStyle,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGrayTextColor)),
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
                              }).catchError((onError) => print(onError));
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
                              maxLines: 9,
                              minLines: 1,
                              style: kCircularStdText.copyWith(
                                  fontSize: 16, color: kBlackTextColor),
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: kPrimaryColor,
                              cursorHeight: 22,
                              decoration: InputDecoration(
                                hintText: 'The agenda of the meeting will be..',
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
                            'category Tag'.toUpperCase(),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TaskCategoryButton(
                                      title: 'Work',
                                      categoryColor: kRedColor,
                                    ),
                                    TaskCategoryButton(
                                      title: 'Home',
                                      categoryColor: kGreenColor,
                                    ),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: kHPadding),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.5, color: kPrimaryColor),
                                      // border: Border.all(color: kGreyWhite, width: 2),
                                      borderRadius: BorderRadius.circular(
                                        kBorderRadius / 2,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kHPadding,
                                        vertical: kVPadding / 5),
                                    child: Icon(
                                      Icons.add_rounded,
                                      size: 28,
                                      color: kPrimaryColor,
                                    ))
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
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius / 2),
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
                    ],
                  ),
                ),
                extendBody: true,
                bottomNavigationBar: Container(
                  padding: EdgeInsets.only(bottom: kVPadding),
                  margin: EdgeInsets.zero,
                  child: Hero(
                    tag: 'Create Task',
                    child: Container(
                      margin: EdgeInsets.fromLTRB(kHPadding * 3, kVPadding / 2,
                          kHPadding * 3, kVPadding),
                      child: PrimaryButton(
                        title: 'Create Task',
                        action: () => print('hi'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => CreateTaskViewModel());
  }
}

class TaskCategoryButton extends StatelessWidget {
  final String title;
  final Color categoryColor;
  TaskCategoryButton({@required this.title, @required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kHPadding),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(.15),
        // border: Border.all(color: kGreyWhite, width: 2),
        borderRadius: BorderRadius.circular(kBorderRadius / 2),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: kHPadding * 2, vertical: kVPadding),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: kCircularStdText.copyWith(
            color: categoryColor, fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}
