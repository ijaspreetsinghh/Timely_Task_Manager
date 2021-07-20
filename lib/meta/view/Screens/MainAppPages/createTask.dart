import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
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
                backgroundColor: kGreyWhite,
                appBar: AppBar(
                  elevation: 0,
                  leading: BackButtonWithoutAppBar(
                    iconColor: Colors.white,
                  ),
                ),
                body: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: Form(
                    key: model.createTaskFormKey,
                    autovalidateMode: model.autoValidate,
                    child: ListView(
                      children: [
                        Container(
                          color: kPrimaryColor,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                                height: kVPadding * 7,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kHPadding * 1.5,
                              vertical: kVPadding * 3),
                          transform: Matrix4.translationValues(0, -40, 0),
                          decoration: BoxDecoration(
                              color: kGreyWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kBorderRadius * 2),
                                  topRight:
                                      Radius.circular(kBorderRadius * 2))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                style: kCircularStdText.copyWith(
                                    fontSize: 20, color: kBlackTextColor),
                                validator: (value) =>
                                    model.taskTitleValidator(value),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                cursorColor: kPrimaryColor,
                                cursorHeight: 26,
                                controller: model.taskTitleController,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            (DateTime.now().month),
                                            (DateTime.now().day + 30)),
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
                                                primaryActionTitle:
                                                    'Try again');
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          kHPadding / 2),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          kHPadding / 2),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
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
                                          fontSize: 16, color: kBlackTextColor),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      cursorColor: kPrimaryColor,
                                      cursorHeight: 22,
                                      controller: model.taskDescController,
                                      decoration: InputDecoration(
                                        hintText:
                                            'The agenda of the meeting will be..',
                                        hintStyle: kHintTextStyle,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kGrayTextColor)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              title:
                                                  model.selectedCategoryTitle,
                                              categoryColor:
                                                  model.selectedCategoryColor,
                                            ),
                                            TextButton(
                                              onPressed: () => model
                                                  .showCategorySelectionSheet(
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
                                                    style: kCircularStdText
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                extendBody: true,
                bottomNavigationBar: Container(
                  padding: EdgeInsets.only(bottom: kVPadding),
                  margin: EdgeInsets.zero,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        kHPadding * 3, kVPadding / 2, kHPadding * 3, kVPadding),
                    child: PrimaryButton(
                      title: 'Create Task',
                      action: () => model.validateCreateTask(),
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
        color: categoryColor.withOpacity(.1),
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

//GestureDetector(
//                                           onTap: () => NavigationService
//                                               .instance
//                                               .showAlertWithTwoButtons(
//                                                   title: 'PRO feature',
//                                                   content:
//                                                       'Enjoy unlimited categories and colors of your choice and a bunch of more features with PRO.',
//                                                   primaryActionTitle: 'Get PRO',
//                                                   primaryAction: () =>
//                                                       NavigationService.instance
//                                                           .goBack(),
//                                                   secondaryAction: () =>
//                                                       NavigationService.instance
//                                                           .goBack(),
//                                                   secondaryActionTitle:
//                                                       'Not now'),
//                                           child: Container(
//                                               margin: EdgeInsets.only(
//                                                   right: kHPadding,
//                                                   left: kHPadding),
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     width: 1.5,
//                                                     color: kPrimaryColor),
//                                                 // border: Border.all(color: kGreyWhite, width: 2),
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                   kBorderRadius / 2,
//                                                 ),
//                                               ),
//                                               padding: EdgeInsets.all(3),
//                                               child: Icon(
//                                                 Icons.add_rounded,
//                                                 size: 24,
//                                                 color: kPrimaryColor,
//                                               )),
//                                         )
