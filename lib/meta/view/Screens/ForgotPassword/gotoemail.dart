import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/meta/view/Screens/MainAppPages/timelypagesdecider.dart';
import 'package:timely/meta/view/Screens/Onboarding/welcomeScreen.dart';
import '../../../widgets/components.dart';
import '../../../widgets/constants.dart';

class GoToEmail extends StatefulWidget {
  static const route = 'GoToEmail';
  @override
  _GoToEmailState createState() => _GoToEmailState();
}

class _GoToEmailState extends State<GoToEmail> {
  Services services = Services();
  void openEmailApp(BuildContext context) {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? "message://" : "com.google.android.gm")
          .then((_) {})
          .catchError((err) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Something went wrong.')));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong.')));
    }
  }

  bool openMailClicked = false;

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
                      services.auth.currentUser != null
                          ? 'We have sent an email with a confirmation link to your registered email address.'
                          : 'We have sent a password recovery instructions to your email.',
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
                    services.auth.currentUser != null
                        ? openMailClicked
                            ? PrimaryButton(
                                title: 'Check Now',
                                buttonColor: kBlackTextColor,
                                action: () async {
                                  await services.auth.currentUser.reload();
                                  if (services.auth.currentUser.emailVerified ==
                                      true)
                                    NavigationService.instance
                                        .replace(PagesDecider.route);
                                },
                              )
                            : PrimaryButton(
                                title: 'Open Email',
                                action: () {
                                  setState(() {
                                    openMailClicked = true;
                                    openEmailApp(context);
                                  });
                                },
                              )
                        : openMailClicked
                            ? PrimaryButton(
                                title: 'SignIn Now',
                                buttonColor: kBlackTextColor,
                                action: () => NavigationService.instance
                                    .replace(WelcomeScreen.route),
                              )
                            : PrimaryButton(
                                title: 'Open Email',
                                action: () {
                                  setState(() {
                                    openMailClicked = true;

                                    openEmailApp(context);
                                  });
                                },
                              ),
                    SizedBox(
                      height: kVPadding * 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        services.auth.currentUser != null
                            ? NavigationService.instance
                                .replace(PagesDecider.route)
                            : NavigationService.instance
                                .replace(WelcomeScreen.route);
                      },
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
                          'Did not receive the email? Check your spam filter, ',
                      style: TextStyle(
                          color: kBlackTextColor.withOpacity(.8),
                          fontFamily: kMuliFont,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                      children: [
                        TextSpan(
                            text: 'This may take a few moment.',
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
