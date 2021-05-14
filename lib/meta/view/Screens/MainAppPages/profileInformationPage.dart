import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/profileInformationPage_viewModel.dart';

import 'package:timely/meta/widgets/components.dart';
import 'package:timely/meta/widgets/constants.dart';

class ProfileInformationPage extends StatefulWidget {
  static const route = 'ProfileInformationPage';
  const ProfileInformationPage({Key key}) : super(key: key);

  @override
  _ProfileInformationPageState createState() => _ProfileInformationPageState();
}

class _ProfileInformationPageState extends State<ProfileInformationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileInformationPageViewModel>.reactive(
        // onModelReady: (model) => model.initialize(),
        fireOnModelReadyOnce: true,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: kVPadding * 1.5),
                  children: [
                    Row(
                      children: [
                        BackButtonWithoutAppBar(
                          iconColor: kBlackTextColor,
                        ),
                        FormHeading(
                          title: 'My Account',
                          fontSize: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kVPadding * 3,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Hero(
                                child: CircleAvatar(
                                  backgroundColor: kGreyWhite,
                                  radius: 45,
                                  backgroundImage:
                                      AssetImage('assets/images/logo.png'),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/250?image=9'),
                                  ),
                                ),
                                tag: 'Display Image',
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        color: kBlackTextColor,
                                        shape: BoxShape.circle),
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.edit_rounded,
                                      color: kGreyWhite,
                                      size: 16,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            width: kHPadding * 1.5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'Display Name',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      model.services.auth.currentUser
                                              .displayName ??
                                          'NA',
                                      overflow: TextOverflow.ellipsis,
                                      style: kCircularStdText.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: kVPadding),
                                  decoration: BoxDecoration(
                                    color: kBlackTextColor.withOpacity(.03),
                                    // border: Border.all(color: kGreyWhite, width: 2),
                                    borderRadius: BorderRadius.circular(
                                        kBorderRadius / 2),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kHPadding / 1.5,
                                      vertical: kVPadding / 2),
                                  child: Text(
                                    'FREE',
                                    overflow: TextOverflow.ellipsis,
                                    style: kCircularStdText.copyWith(
                                        color: kBlackTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kBlackTextColor.withOpacity(.03),
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: EdgeInsets.symmetric(
                          horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                      margin: EdgeInsets.symmetric(
                          horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Display Name',
                            style: kCircularStdText.copyWith(
                                fontWeight: FontWeight.w700,
                                color: kBlackTextColor.withOpacity(.7)),
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          ProfileEntryField(
                            entryText:
                                model.services.auth.currentUser.displayName ??
                                    'NA',
                            buttonTitle: 'Edit',
                            action: () {
                              model.showUpdateName(
                                ctx: context,
                              );
                            },
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Row(
                            children: [
                              Text(
                                'Email',
                                style: kCircularStdText.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kBlackTextColor.withOpacity(.7)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (model.services.auth.currentUser
                                      .emailVerified) {
                                    print('email verified');
                                  } else {
                                    NavigationService.instance
                                        .showAlertWithTwoButtons(
                                      title: 'Verification Pending',
                                      content:
                                          'We have sent an email with a confirmation link to your email address. If you do not receive a confirmation email, please check your spam folder.',
                                      primaryAction: () => model.verifyEmail(),
                                      primaryActionTitle: 'Resend email',
                                      secondaryActionTitle: 'Later',
                                      secondaryAction: () =>
                                          NavigationService.instance.goBack(),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: kHPadding),
                                  decoration: BoxDecoration(
                                    color: model.services.auth.currentUser
                                            .emailVerified
                                        ? kGreenColor.withOpacity(.05)
                                        : kRedColor.withOpacity(.05),
                                    // border: Border.all(color: kGreyWhite, width: 2),
                                    borderRadius: BorderRadius.circular(
                                        kBorderRadius / 2),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kHPadding / 2,
                                      vertical: kVPadding / 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        model.services.auth.currentUser
                                                .emailVerified
                                            ? 'Verified'
                                            : 'Verification Pending',
                                        overflow: TextOverflow.ellipsis,
                                        style: kCircularStdText.copyWith(
                                            color: model.services.auth
                                                    .currentUser.emailVerified
                                                ? kGreenColor
                                                : kRedColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: kHPadding / 2,
                                      ),
                                      Icon(
                                        model.services.auth.currentUser
                                                .emailVerified
                                            ? Icons.verified_rounded
                                            : Icons.error_rounded,
                                        color: model.services.auth.currentUser
                                                .emailVerified
                                            ? kGreenColor
                                            : kRedColor,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          Hero(
                            tag: 'Email',
                            child: Material(
                              type: MaterialType.transparency,
                              child: ProfileEntryField(
                                entryText:
                                    model.services.auth.currentUser.email ??
                                        'NA',
                                buttonTitle: 'Edit',
                                action: () =>
                                    model.showUpdateEmail(ctx: context),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kVPadding * 3,
                          ),
                          Text(
                            'Password',
                            style: kCircularStdText.copyWith(
                                fontWeight: FontWeight.w700,
                                color: kBlackTextColor.withOpacity(.7)),
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          ProfileEntryField(
                            entryText: '• • • • • • • •',
                            buttonTitle: 'Change',
                            action: () =>
                                model.showUpdatePassword(ctx: context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kBlackTextColor.withOpacity(.03),
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: EdgeInsets.symmetric(
                          horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                      margin: EdgeInsets.only(
                          top: 0,
                          left: kHPadding * 1.5,
                          bottom: kVPadding * 3,
                          right: kHPadding * 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Subscription',
                            style: kCircularStdText.copyWith(
                                fontWeight: FontWeight.w700,
                                color: kBlackTextColor.withOpacity(.7)),
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  model.isProUser
                                      ? 'Timely Pro'
                                      : 'Timely Free',
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
                                onTap: () => print('hu'),
                                child: Container(
                                  margin: EdgeInsets.only(top: kVPadding),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFFff0f7b),
                                        const Color(0xFFf89b29),
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp,
                                    ),
                                    // border: Border.all(color: kGreyWhite, width: 2),
                                    borderRadius: BorderRadius.circular(
                                        kBorderRadius / 2),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kHPadding,
                                      vertical: kVPadding / 1.5),
                                  child: Text(
                                    model.isProUser
                                        ? 'Pro User'
                                        : 'Upgrade to Pro',
                                    overflow: TextOverflow.ellipsis,
                                    style: kCircularStdText.copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kVPadding * 2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kHPadding * 1.5,
                      ),
                      child: PrimaryButton(
                        action: () => model.logOut(),
                        title: 'Sign Out',
                        textColor: Colors.white,
                        buttonColor: kBlackTextColor,
                        buttonBackgroundColor: kBlackTextColor.withOpacity(.3),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => ProfileInformationPageViewModel());
  }
}

class ProfileEntryField extends StatelessWidget {
  final String buttonTitle;
  final String entryText;
  final Function action;

  ProfileEntryField({
    @required this.action,
    @required this.buttonTitle,
    @required this.entryText,
  });

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
