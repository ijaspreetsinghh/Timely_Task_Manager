import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/onBoarding_viewModel.dart';
import 'package:timely/meta/view/Screens/Onboarding/welcomeScreen.dart';

import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';
import 'dart:math' as math;

const TWO_PI = 3.14 * 2;

class OnBoarding extends StatelessWidget {
  static const route = 'Onboarding';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.white,
                  body: Container(
                    constraints: BoxConstraints(maxWidth: 450.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              kHPadding, kVPadding * 2, kHPadding * 1.5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: model.currentPage != 0 ? true : false,
                                child: GestureDetector(
                                  onTap: () => model.moveToPreviousPage(),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: kGrayTextColor,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: model.currentPage != 2 ? true : false,
                                child: GestureDetector(
                                  onTap: () => model.skipOnBoarding(),
                                  child: Text(
                                    'Skip',
                                    style: kCircularStdText.copyWith(
                                        color: kGrayTextColor,
                                        fontFamily: kMuliFont,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 200,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: model.pageController,
                            onPageChanged: (page) => model.pageChanger(page),
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    OnBoardingPageTitle(
                                      pageTitle:
                                          'Organize it all \nwith Timely',
                                      topMargin: kHPadding * 2,
                                    ),
                                    OnBoardingImage(
                                      verticalPadding: kVPadding * 2,
                                      imagePath: 'assets/images/on1.png',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    OnBoardingImage(
                                      imagePath: 'assets/images/on2.png',
                                      verticalPadding: kVPadding * 2,
                                    ),
                                    OnBoardingPageTitle(
                                      topMargin: kHPadding * 2,
                                      pageTitle: 'A task manager you can trust',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    OnBoardingPageTitle(
                                      topMargin: kHPadding * 2,
                                      pageTitle: 'Free up your mental space',
                                    ),
                                    OnBoardingImage(
                                      imagePath: 'assets/images/on3.png',
                                      verticalPadding: kVPadding * 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return SweepGradient(
                                    startAngle: 0,
                                    endAngle: math.pi * (model.currentPage + 2),
                                    tileMode: TileMode.repeated,
                                    stops: [
                                      0.5,
                                      0.5,
                                    ],
                                    center: Alignment.center,
                                    colors: [
                                      kPrimaryColor,
                                      Colors.transparent,
                                    ]).createShader(rect);
                              },
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (model.currentPage == 2) {
                                  NavigationService.instance
                                      .replace(WelcomeScreen.route);
                                } else {
                                  model.moveToNextPage();
                                }
                              },
                              onLongPress: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Press to move to the next page."),
                              )),
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                width: 84,
                                height: 84,
                                margin: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 82,
                                  height: 82,
                                  decoration: BoxDecoration(
                                    color: kPrimaryButtonColor.withOpacity(.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                      alignment: AlignmentDirectional.center,
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        color: kPrimaryButtonColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        model.currentPage != 2
                                            ? Icons.arrow_forward_ios_rounded
                                            : Icons.check,
                                        color: Colors.white,
                                        size: 28,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
        viewModelBuilder: () => OnBoardingViewModel());
  }
}
