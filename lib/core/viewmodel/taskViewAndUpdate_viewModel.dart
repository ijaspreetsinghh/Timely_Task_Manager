import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class TaskViewAndUpdateViewModel extends BaseViewModel {
  GlobalKey<FormState> updateTaskFormKey = GlobalKey();
  Services services = Services();
  editSelectedTask(
      {@required BuildContext ctx,
      @required taskName,
      @required taskDesc,
      @required taskTime,
      @required taskDate,
      @required taskCategory,
      @required taskColor}) {
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
            padding: EdgeInsets.fromLTRB(
                kHPadding * 1.5, kVPadding * 4, kHPadding * 1.5, kVPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kBorderRadius * 2),
                topRight: Radius.circular(kBorderRadius * 2),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FormHeading(
                        title: taskName,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      transform:
                          Matrix4.translationValues(kHPadding * 1.5, 0, 0),
                      decoration: BoxDecoration(
                          color: services.colorSelector(
                              taskCategory: taskCategory),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kBorderRadius),
                              bottomLeft: Radius.circular(kBorderRadius))),
                      width: 30,
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: kVPadding * 3,
                ),
                Row(
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
                          taskDate,
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
                      padding: const EdgeInsets.only(right: kHPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FieldTitle(
                            fieldName: 'time',
                          ),
                          Text(
                            taskTime,
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
                SizedBox(
                  height: kVPadding * 3,
                ),
                FieldTitle(
                  fieldName: 'description',
                ),
                Text(
                  taskDesc == '' ? 'NA' : taskDesc,
                  overflow: TextOverflow.visible,
                  style: kCircularStdText.copyWith(
                      color: kBlackTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
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
                            onPressed: () =>
                                NavigationService.instance.goBack(),
                            style: TextButton.styleFrom(
                                primary: kPrimaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: kHPadding * 1.5,
                                    vertical: kVPadding * 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            onPressed: () =>
                                NavigationService.instance.goBack(),
                            style: TextButton.styleFrom(
                                primary: kRedColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: kHPadding * 1.5,
                                    vertical: kVPadding * 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
                  transform: Matrix4.translationValues(0, 6, 0),
                  height: .5,
                  color: kBlackTextColor.withOpacity(.2),
                ),
                Container(
                  transform: Matrix4.translationValues(0, 6, 0),
                  child: TextButton(
                      onPressed: () => NavigationService.instance.goBack(),
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
              ],
            ),
          ),
        ],
      ),
    );
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
