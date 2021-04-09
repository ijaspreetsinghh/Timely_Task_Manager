import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timely/Screens/ForgotPassword/forgotpassword.dart';
import 'package:timely/Screens/ForgotPassword/gotoemail.dart';
import 'package:timely/Screens/SchedulePage/schedule.dart';
import 'package:timely/Screens/SignIn/signin.dart';
import 'constants.dart';
import 'Screens/SignUp/signup.dart';

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
        ),
        themeMode: ThemeMode.light,
        initialRoute: App.route,
        routes: {
          App.route: (context) => App(),
          ForgotPassword.route: (context) => ForgotPassword(),
          SignUp.route: (context) => SignUp(),
          SignIn.route: (context) => SignIn(),
          GoToEmail.route: (context) => GoToEmail(),
          Schedule.route: (context) => Schedule(),
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
