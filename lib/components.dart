import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      margin: EdgeInsets.only(
          top: kHPadding * .7, left: kHPadding * .7, right: kHPadding * .7),
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
                width: 35,
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
