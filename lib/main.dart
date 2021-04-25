import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'meta/view/Screens/Onboarding/onboarding.dart';
import 'meta/view/Screens/ForgotPassword/forgotpassword.dart';
import 'meta/view/Screens/ForgotPassword/gotoemail.dart';
import 'meta/view/Screens/MainAppPages/schedule.dart';
import 'meta/view/Screens/MainAppPages/timelypagesdecider.dart';
import 'meta/view/Screens/SignIn/signin.dart';
import 'meta/widgets/constants.dart';
import 'meta/view/Screens/SignUp/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor,
            splashColor: kGrayTextColor,
            highlightColor: kGrayTextColor),
        themeMode: ThemeMode.light,
        initialRoute: Onboarding.route,
        routes: {
          App.route: (context) => App(),
          ForgotPassword.route: (context) => ForgotPassword(),
          SignUp.route: (context) => SignUp(),
          SignIn.route: (context) => SignIn(),
          GoToEmail.route: (context) => GoToEmail(),
          Schedule.route: (context) => Schedule(),
          PagesDecider.route: (context) => PagesDecider(),
          Onboarding.route: (context) => Onboarding(),
        },
      ),
    );
  }
}

class App extends StatefulWidget {
  static const route = 'App';
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}
