import 'package:flutter/material.dart';
import 'package:timely/core/services/navigationService.dart';

import 'constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final dynamic action;
  final Color buttonColor;
  final Color buttonBackgroundColor;
  final Color textColor;
  final double hPadding;
  final double vPadding;
  final double textSize;
  PrimaryButton(
      {this.title,
      this.action,
      this.buttonBackgroundColor,
      this.buttonColor,
      this.textColor,
      this.hPadding,
      this.textSize,
      this.vPadding});
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(357 / 360),
      child: Container(
        decoration: BoxDecoration(
          color: (buttonBackgroundColor ?? kPrimaryButtonColor).withOpacity(.3),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(3 / 360),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: textColor,
                shadowColor: Colors.transparent,
                primary: buttonColor ?? kPrimaryButtonColor,
                padding: EdgeInsets.symmetric(
                    horizontal: hPadding ?? (kHPadding * 1.5),
                    vertical: vPadding ?? (kVPadding * 1.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                )),
            onPressed: () => action(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: textSize ?? 18,
                      color: textColor ?? Colors.white,
                      fontFamily: kCircularStdFont,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeading extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  FormHeading({@required this.title, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.left,
        style: kCircularStdText.copyWith(
            fontSize: fontSize ?? 22,
            fontWeight: FontWeight.w700,
            color: color ?? kBlackTextColor));
  }
}

class PriorityTaskGrid extends StatelessWidget {
  final String taskTitle;
  final String remainingTime;
  final Color color;
  final String time;
  PriorityTaskGrid(
      {@required this.color,
      @required this.remainingTime,
      @required this.taskTitle,
      @required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: kVPadding, top: kVPadding, bottom: kVPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: kHintTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kBorderRadius),
                        bottomLeft: Radius.circular(kBorderRadius))),
                width: 30,
                height: 7,
              )
            ],
          ),
          SizedBox(
            height: kVPadding,
          ),
          Expanded(
            child: Text(
              taskTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: kCircularStdText.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: kVPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                remainingTime,
                style: kHintTextStyle.copyWith(
                  fontSize: 12,
                  color: kGrayTextColor.withOpacity(.7),
                  fontFamily: kCircularStdFont,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: kVPadding),
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(15 / 360),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.all(kVPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kYellowColor,
                    borderRadius: BorderRadius.circular(kBorderRadius / 3)),
                child: Icon(
                  Icons.star_border_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: kHPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '12',
                    style: kCircularStdText.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Tasks',
                    style: TextStyle(
                        color: kGrayTextColor,
                        fontSize: 14,
                        fontFamily: kCircularStdFont,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: kVPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Important',
                style: kCircularStdText.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TodayHorizontalTaskBuilder extends StatelessWidget {
  final String taskTitle;
  final String time;
  final Color color;
  TodayHorizontalTaskBuilder(
      {@required this.color, @required this.taskTitle, @required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kVPadding),
      padding: EdgeInsets.only(
          left: kHPadding, top: kVPadding * 2, bottom: kVPadding * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius),
                    bottomLeft: Radius.circular(kBorderRadius))),
            width: 25,
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskTitle,
                style: kCircularStdText.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: kHPadding / 2),
            child: Text(time,
                style: kHintTextStyle.copyWith(
                  fontSize: 12,
                  color: kGrayTextColor.withOpacity(.7),
                  fontFamily: kCircularStdFont,
                )),
          )
        ],
      ),
    );
  }
}

class MyTaskNameBuilder extends StatelessWidget {
  final String taskTitle;

  MyTaskNameBuilder({@required this.taskTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: kHPadding, top: kVPadding * 2, bottom: kVPadding * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  taskTitle,
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: kCircularStdText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeLineTaskBuilder extends StatelessWidget {
  final String taskName;
  final String time;
  const TimeLineTaskBuilder({@required this.time, @required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kVPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: kHPadding,
          ),
          Text(
            time,
            style: kHintTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          SizedBox(
            width: kHPadding,
          ),
          Flexible(
            flex: 2,
            child: MyTaskNameBuilder(
              taskTitle: taskName,
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonWithoutAppBar extends StatelessWidget {
  final Color iconColor;
  const BackButtonWithoutAppBar({this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: iconColor ?? kPrimaryColor,
        size: 24,
      ),
      onPressed: () => NavigationService.instance.goBack(),
    );
  }
}

class OnBoardingPageTitle extends StatelessWidget {
  final String pageTitle;
  OnBoardingPageTitle(
      {@required this.pageTitle, @required this.topMargin, this.textColor});
  final double topMargin;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kHPadding * 2,
        right: kHPadding * 2,
        top: topMargin,
      ),
      alignment: AlignmentDirectional.topStart,
      child: Text(
        pageTitle,
        style: kCircularStdText.copyWith(
            color: textColor ?? kBlackTextColor,
            fontSize: 26,
            fontFamily: kMuliFont,
            height: 1.3,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  final String imagePath;
  final double verticalPadding;
  OnBoardingImage({@required this.imagePath, @required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Image(
        image: AssetImage(imagePath),
      ),
    );
  }
}

class ProfileEntryField extends StatelessWidget {
  final String buttonTitle;
  final String entryText;
  final Function action;
  ProfileEntryField(
      {@required this.action,
      @required this.buttonTitle,
      @required this.entryText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            entryText,
            overflow: TextOverflow.ellipsis,
            style: kCircularStdText.copyWith(
                fontWeight: FontWeight.w700,
                color: kBlackTextColor,
                fontSize: 18),
          ),
        ),
        SizedBox(
          width: kHPadding / 2,
        ),
        GestureDetector(
          onTap: action,
          child: Container(
            margin: EdgeInsets.only(top: kVPadding),
            decoration: BoxDecoration(
              color: kBlackTextColor,
              // border: Border.all(color: kGreyWhite, width: 2),
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: kHPadding, vertical: kVPadding / 1.5),
            child: Text(
              buttonTitle,
              overflow: TextOverflow.ellipsis,
              style: kCircularStdText.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
