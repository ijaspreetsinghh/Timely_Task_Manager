import 'package:flutter/material.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/meta/view/Screens/MainAppPages/timelypagesdecider.dart';
import '../../../widgets/components.dart';
import '../../../widgets/constants.dart';

class GoToEmail extends StatefulWidget {
  static const route = 'GoToEmail';
  @override
  _GoToEmailState createState() => _GoToEmailState();
}

class _GoToEmailState extends State<GoToEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [kOffWhite, Colors.white],
                  end: AlignmentDirectional.bottomCenter,
                  stops: [.3, .9],
                  begin: AlignmentDirectional.topCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(
                flex: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kHPadding * 3),
                child: Column(
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(350 / 360),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        child: RotationTransition(
                            turns: AlwaysStoppedAnimation(10 / 360),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kHPadding, vertical: kHPadding),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                              ),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/plane.png',
                                ),
                                height: 80,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: kVPadding * 4,
                    ),
                    FormHeading(title: 'Check your email'),
                    SizedBox(
                      height: kVPadding,
                    ),
                    Text(
                      'We have sent a password recovery instructions to your email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kGrayTextColor,
                          fontSize: 14,
                          fontFamily: kCircularStdFont,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                    SizedBox(
                      height: kVPadding * 4,
                    ),
                    PrimaryButton(
                      title: 'Open Email',
                      action: () => print('hello'),
                    ),
                    SizedBox(
                      height: kVPadding * 3,
                    ),
                    GestureDetector(
                      onTap: () => NavigationService.instance
                          .replace(PagesDecider.route),
                      child: Text(
                        'Skip for now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kGrayTextColor,
                            fontSize: 16,
                            fontFamily: kCircularStdFont,
                            fontWeight: FontWeight.w600,
                            height: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'Did not receive the email? Check your spam filter or ',
                      style: TextStyle(
                          color: kBlackTextColor.withOpacity(.8),
                          fontFamily: kMuliFont,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                      children: [
                        TextSpan(
                            text: 'try another email address',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                            ))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
