import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timely/meta/widgets/constants.dart';

import '../../main.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();
  // var overLay = OverlayEntry(builder: (context) => LoadingWidget());
  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> replace(String _rn) {
    return navigationKey.currentState
        .pushNamedAndRemoveUntil(_rn, (route) => false);
  }

  Future<dynamic> pushNamed(String _rn) {
    return navigationKey.currentState.pushNamed(_rn);
  }

  Future<dynamic> pushReplace(String _rn) {
    return navigationKey.currentState.pushReplacementNamed(_rn);
  }

  Future<dynamic> materialRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState.push(_rn);
  }

  Future<dynamic> materialRouteReplace(MaterialPageRoute _rn) {
    return navigationKey.currentState.pushReplacement(_rn);
  }

  goBack() {
    return navigationKey.currentState.pop();
  }

  showLoader({String title}) {
    // return navigationKey.currentState.overlay.insert(overLay);
    return showDialog(
      barrierColor: Colors.black.withOpacity(.7),
      barrierDismissible: false,
      context: navigationKey.currentContext,
      builder: (context) => LoaderAlertBox(
        title: title,
      ),
    );
  }

  hideLoader() {
    // return overLay.remove();
    return goBack();
  }

  showAlertWithTwoButtons(
      {title,
      content,
      primaryAction,
      secondaryAction,
      primaryActionTitle,
      secondaryActionTitle}) {
    return showDialog(
        barrierColor: Colors.black.withOpacity(.7),
        barrierDismissible: false,
        context: navigationKey.currentContext,
        builder: (context) => AlertBoxWithTwoButton(
              title: title,
              content: content,
              action1: primaryAction,
              action2: secondaryAction,
              titleAction1: primaryActionTitle,
              titleAction2: secondaryActionTitle,
            ));
  }

  showAlertWithTwoButtonsWithoutText({
    primaryAction,
    secondaryAction,
    primaryActionTitle,
    secondaryActionTitle,
  }) {
    return showDialog(
        barrierColor: Colors.black.withOpacity(.7),
        barrierDismissible: false,
        context: navigationKey.currentContext,
        builder: (context) => AlertBoxWithTwoButtonWithoutText(
              action1: primaryAction,
              action2: secondaryAction,
              titleAction1: primaryActionTitle,
              titleAction2: secondaryActionTitle,
            ));
  }

  showAboutAppDialog() {
    return showDialog(
      barrierColor: Colors.black.withOpacity(.7),
      barrierDismissible: false,
      context: navigationKey.currentContext,
      builder: (context) => AboutAppDialog(
        title: 'Timely',
        content:
            'Timely is a productivity tool designed to help individuals and teams stay organized and get more done.',
        action1: () {
          goBack();
          showLicensePage(
              context: context,
              applicationName: applicationName,
              applicationLegalese: applicationLegalese,
              applicationVersion: applicationVersion);
        },
        action2: () => goBack(),
        titleAction1: 'View Licenses',
        titleAction2: 'Close',
      ),
    );
  }

  // viewTaskInAlert(
  //     {@required taskName,
  //     @required taskDesc,
  //     @required taskTime,
  //     @required taskDate,
  //     @required taskCategory,
  //     @required taskColor}) {
  //   showDialog(
  //       barrierColor: Colors.black.withOpacity(.7),
  //       // barrierDismissible: false,
  //
  //       context: navigationKey.currentContext,
  //       builder: (context) => ViewTaskInAlert(
  //           taskName: taskName,
  //           taskDesc: taskDesc,
  //           taskTime: taskTime,
  //           taskDate: taskDate,
  //           taskCategory: taskCategory,
  //           taskColor: taskColor));
  // }

  showAlertWithOneButton({
    title,
    content,
    primaryAction,
    primaryActionTitle,
  }) {
    return showDialog(
        barrierColor: Colors.black.withOpacity(.7),
        barrierDismissible: false,
        context: navigationKey.currentContext,
        builder: (context) => AlertBoxWithOneButton(
              title: title,
              content: content,
              action: primaryAction,
              titleAction: primaryActionTitle,
            ));
  }
}

class LoaderAlertBox extends StatefulWidget {
  final String title;
  LoaderAlertBox({this.title});

  @override
  _LoaderAlertBox createState() => _LoaderAlertBox();
}

class _LoaderAlertBox extends State<LoaderAlertBox>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.symmetric(
                  horizontal: kHPadding * 2.5, vertical: kVPadding * 4),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                  SizedBox(
                    height: kVPadding * 3,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: kCircularStdText.copyWith(
                        color: kBlackTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class AlertBox extends StatefulWidget {
  final String title;
  final String content;
  AlertBox({this.content, this.title});

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.symmetric(
                  horizontal: kHPadding * 2.5, vertical: kVPadding * 4),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: kCircularStdText.copyWith(
                        color: kBlackTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  Text(
                    widget.content,
                    textAlign: TextAlign.center,
                    style: kCircularStdText.copyWith(
                        color: kGrayTextColor, fontSize: 14),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class AlertBoxWithOneButton extends StatefulWidget {
  final String title;
  final String content;
  final Function action;
  final String titleAction;
  AlertBoxWithOneButton(
      {@required this.content,
      @required this.title,
      @required this.action,
      @required this.titleAction});

  @override
  _AlertBoxWithOneButton createState() => _AlertBoxWithOneButton();
}

class _AlertBoxWithOneButton extends State<AlertBoxWithOneButton>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.fromLTRB(0, kVPadding * 4, 0, 0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kBlackTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 3,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kGrayTextColor, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    child: TextButton(
                        onPressed: widget.action,
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction,
                          style: kCircularStdText.copyWith(
                              color: kPrimaryColor, fontSize: 16),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class AlertBoxWithTwoButton extends StatefulWidget {
  final String title;
  final String content;
  final Function action1;
  final Function action2;
  final String titleAction1;
  final String titleAction2;
  AlertBoxWithTwoButton(
      {@required this.content,
      @required this.title,
      @required this.action1,
      @required this.action2,
      @required this.titleAction1,
      @required this.titleAction2});

  @override
  _AlertBoxWithTwoButton createState() => _AlertBoxWithTwoButton();
}

class _AlertBoxWithTwoButton extends State<AlertBoxWithTwoButton>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.fromLTRB(0, kVPadding * 4, 0, 0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kBlackTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 3,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kGrayTextColor, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    child: TextButton(
                        onPressed: widget.action1,
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction1,
                          style: kCircularStdText.copyWith(
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                              fontSize: 16),
                        )),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    height: .5,
                    color: kBlackTextColor.withOpacity(.2),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    child: TextButton(
                        onPressed: widget.action2,
                        style: TextButton.styleFrom(
                            primary: kBlackTextColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction2,
                          style: kCircularStdText.copyWith(
                              color: kBlackTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class AboutAppDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function action1;
  final Function action2;
  final String titleAction1;
  final String titleAction2;
  AboutAppDialog(
      {@required this.content,
      @required this.title,
      @required this.action1,
      @required this.action2,
      @required this.titleAction1,
      @required this.titleAction2});

  @override
  _AboutAppDialog createState() => _AboutAppDialog();
}

class _AboutAppDialog extends State<AboutAppDialog>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.fromLTRB(0, kVPadding * 4, 0, 0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 50,
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kBlackTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 3,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: kCircularStdText.copyWith(
                          color: kGrayTextColor, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    child: TextButton(
                        onPressed: widget.action1,
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction1,
                          style: kCircularStdText.copyWith(
                              color: kPrimaryColor, fontSize: 16),
                        )),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    height: .5,
                    color: kBlackTextColor.withOpacity(.2),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 6, 0),
                    child: TextButton(
                        onPressed: widget.action2,
                        style: TextButton.styleFrom(
                            primary: kBlackTextColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction2,
                          style: kCircularStdText.copyWith(
                              color: kBlackTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class AlertBoxWithTwoButtonWithoutText extends StatefulWidget {
  final Function action1;
  final Function action2;
  final String titleAction1;
  final String titleAction2;

  AlertBoxWithTwoButtonWithoutText({
    @required this.action1,
    @required this.action2,
    @required this.titleAction1,
    @required this.titleAction2,
  });

  @override
  _AlertBoxWithTwoButtonWithoutText createState() =>
      _AlertBoxWithTwoButtonWithoutText();
}

class _AlertBoxWithTwoButtonWithoutText
    extends State<AlertBoxWithTwoButtonWithoutText>
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              width: 275,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: widget.action1,
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction1,
                          style: kCircularStdText.copyWith(
                              color: kPrimaryColor, fontSize: 16),
                        )),
                  ),
                  Container(
                    height: .5,
                    color: kBlackTextColor.withOpacity(.2),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: widget.action2,
                        style: TextButton.styleFrom(
                            primary: kBlackTextColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 2)),
                        child: Text(
                          widget.titleAction2,
                          style: kCircularStdText.copyWith(
                              color: kBlackTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

// class ViewTaskInAlert extends StatefulWidget {
//   ViewTaskInAlert({
//     @required this.taskName,
//     @required this.taskDesc,
//     @required this.taskTime,
//     @required this.taskDate,
//     @required this.taskCategory,
//     @required this.taskColor,
//   });
//   final String taskName;
//   final String taskDesc;
//   final String taskTime;
//   final Color taskColor;
//   final String taskCategory;
//   final String taskDate;
//   @override
//   _ViewTaskInAlert createState() => _ViewTaskInAlert();
// }
//
// class _ViewTaskInAlert extends State<ViewTaskInAlert>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 200));
//     scaleAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut);
//
//     controller.addListener(() {
//       setState(() {});
//     });
//
//     controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Material(
//         color: Colors.transparent,
//         child: ScaleTransition(
//           scale: scaleAnimation,
//           child: Hero(
//             tag: 'View Task',
//             child: Container(
//                 width: 275,
//                 constraints: BoxConstraints(maxHeight: 600),
//                 padding: EdgeInsets.fromLTRB(0, kVPadding * 2, 0, 0),
//                 decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(kBorderRadius))),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: kHPadding * 1.5),
//                                 child: FormHeading(
//                                   title: widget.taskName,
//                                   fontSize: 20,
//                                 )),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: services.colorSelector(
//                                     taskCategory: widget.taskCategory),
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(kBorderRadius),
//                                     bottomLeft:
//                                         Radius.circular(kBorderRadius))),
//                             width: 30,
//                             height: 10,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: kVPadding * 2,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: kHPadding * 1.5),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             FieldTitle(
//                               fieldName: 'date',
//                             ),
//                             Text(
//                               widget.taskDate,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 3,
//                               style: kCircularStdText.copyWith(
//                                   color: kBlackTextColor,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: kVPadding * 2,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: kHPadding * 1.5),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             FieldTitle(
//                               fieldName: 'time',
//                             ),
//                             Text(
//                               widget.taskTime,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 3,
//                               style: kCircularStdText.copyWith(
//                                   color: kBlackTextColor,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: kVPadding,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: kHPadding * 1.5),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             FieldTitle(
//                               fieldName: 'description',
//                             ),
//                             Text(
//                               widget.taskDesc,
//                               overflow: TextOverflow.visible,
//                               style: kCircularStdText.copyWith(
//                                   color: kBlackTextColor,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: kVPadding * 2,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               transform: Matrix4.translationValues(0, 6, 0),
//                               child: TextButton(
//                                   onPressed: () => editSelectedTask(),
//                                   style: TextButton.styleFrom(
//                                       primary: kPrimaryColor,
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: kHPadding * 1.5,
//                                           vertical: kVPadding * 2)),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.edit_rounded,
//                                         color: kPrimaryColor,
//                                       ),
//                                       SizedBox(
//                                         width: kHPadding / 2,
//                                       ),
//                                       Text(
//                                         'Edit',
//                                         style: kCircularStdText.copyWith(
//                                             fontWeight: FontWeight.w700,
//                                             color: kPrimaryColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ),
//                           Container(
//                             width: .5,
//                             height: 30,
//                             transform: Matrix4.translationValues(0, 6, 0),
//                             color: kBlackTextColor.withOpacity(.2),
//                           ),
//                           Expanded(
//                             child: Container(
//                               transform: Matrix4.translationValues(0, 6, 0),
//                               child: TextButton(
//                                   onPressed: () => print('hon'),
//                                   style: TextButton.styleFrom(
//                                       primary: kRedColor,
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: kHPadding * 1.5,
//                                           vertical: kVPadding * 2)),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.delete_outline_rounded,
//                                         color: kRedColor,
//                                       ),
//                                       SizedBox(
//                                         width: kHPadding / 2,
//                                       ),
//                                       Text(
//                                         'Delete',
//                                         style: kCircularStdText.copyWith(
//                                             fontWeight: FontWeight.w700,
//                                             color: kRedColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         transform: Matrix4.translationValues(0, 6, 0),
//                         height: .5,
//                         color: kBlackTextColor.withOpacity(.2),
//                       ),
//                       Container(
//                         transform: Matrix4.translationValues(0, 6, 0),
//                         child: TextButton(
//                             onPressed: () => print('hi'),
//                             style: TextButton.styleFrom(
//                                 primary: kBlackTextColor,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: kHPadding * 1.5,
//                                     vertical: kVPadding * 2)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.check,
//                                 ),
//                                 SizedBox(
//                                   width: kHPadding,
//                                 ),
//                                 Text(
//                                   'Mark as Done',
//                                   style: kCircularStdText.copyWith(
//                                       color: kBlackTextColor,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ],
//                             )),
//                       )
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
