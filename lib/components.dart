import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final dynamic action;
  PrimaryButton({this.title, this.action});
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(357 / 360),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryButtonColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(3 / 360),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryButtonColor,
                padding: EdgeInsets.symmetric(
                    horizontal: kHPadding * 1.5, vertical: kVPadding * 1.3),
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
                      fontSize: 18,
                      fontFamily: kCircularStdFont,
                      fontWeight: FontWeight.w400),
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
  FormHeading({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.left,
        style: kCircularStdText.copyWith(
            fontSize: 22, fontWeight: FontWeight.w700, color: kBlackTextColor));
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
              SvgPicture.asset(
                'assets/icons/plus.svg',
                color: kPrimaryColor,
                height: kVPadding * 3,
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
    return Row(
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
    );
  }
}

class MyTaskTimelineIconBuilder extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Widget lineType;
  const MyTaskTimelineIconBuilder(
      {@required this.icon, @required this.color, @required this.lineType});

  @override
  Widget build(BuildContext context) {
    return TimelineNode(
      overlap: true,
      indicator: DotIndicator(
        size: 20,
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        color: color,
      ),
      endConnector: lineType,
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashedLineConnector(
      color: kGrayTextColor.withOpacity(.5),
      thickness: 2,
      dash: 5,
      gap: 3,
    );
  }
}

class SolidLine extends StatelessWidget {
  const SolidLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SolidLineConnector(
      color: kGrayTextColor.withOpacity(.5),
      thickness: 2,
    );
  }
}
