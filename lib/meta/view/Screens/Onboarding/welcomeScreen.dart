import 'package:flutter/material.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/meta/view/Screens/SignIn/signin.dart';
import 'package:timely/meta/view/Screens/SignUp/signup.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff5752BE),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: BoxConstraints(maxWidth: 450.0),
            decoration: BoxDecoration(color: Color(0xff5752BE)),
            child: ListView(
              physics: BouncingScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // OnBoardingPageTitle(
                //   pageTitle: 'Timely', //Let\'s get organized withs
                //   topMargin: kHPadding * 2,
                //   textColor: Colors.white,
                // ),
                SizedBox(
                  height: kVPadding * 2,
                ),
                OnBoardingImage(
                  imagePath: 'assets/images/welcomeScreen.png',
                  verticalPadding: kVPadding * 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kVPadding * 2),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPadding * 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormHeading(
                        title: 'A better way to manage life.',
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      SizedBox(
                        height: kVPadding,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      'If you have time, you\'re productive. '),
                              TextSpan(
                                  text: 'Timely',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: ' helps you spend your time well.'),
                            ],
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 14,
                                fontFamily: kCircularStdFont,
                                fontWeight: FontWeight.w400,
                                height: 1.2)),
                      ),
                      SizedBox(
                        height: kVPadding * 4,
                      ),
                      PrimaryButton(
                        title: 'Sign In',
                        action: () =>
                            NavigationService.instance.pushNamed(SignIn.route),
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                        buttonBackgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: kVPadding * 2.5,
                      ),
                      PrimaryButton(
                        title: 'Create Account',
                        action: () =>
                            NavigationService.instance.pushNamed(SignUp.route),
                        buttonColor: kBlackTextColor,
                        textColor: Colors.white,
                        buttonBackgroundColor: Colors.black,
                      ),
                      SizedBox(
                        height: kVPadding * 3,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'By continuing, you agree to our '),
                              TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policies.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ],
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 14,
                                fontFamily: kCircularStdFont,
                                fontWeight: FontWeight.w400,
                                height: 1.2)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
