import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/meta/view/Screens/MainAppPages/createTask.dart';
import 'package:timely/meta/view/Screens/MainAppPages/profileInformationPage.dart';
import 'package:timely/meta/view/Screens/Onboarding/welcomeScreen.dart';
import 'package:timely/theme.dart';
import 'core/services/navigationService.dart';
import 'meta/view/Screens/Onboarding/onboarding.dart';
import 'meta/view/Screens/ForgotPassword/forgotpassword.dart';
import 'meta/view/Screens/ForgotPassword/gotoemail.dart';
import 'meta/view/Screens/MainAppPages/schedule.dart';
import 'meta/view/Screens/MainAppPages/timelypagesdecider.dart';
import 'meta/view/Screens/SignIn/signin.dart';
import 'meta/widgets/constants.dart';
import 'meta/view/Screens/SignUp/signup.dart';

const applicationVersion = '1.0.0+1';
const applicationName = 'Timely';
const applicationLegalese = '2021 \u00a9 Timely';
const defaultProfilePictureLocation =
    'https://firebasestorage.googleapis.com/v0/b/timely-80246.appspot.com/o/profile.png?alt=media&token=a6994fcb-5b8a-4f61-8407-4eea93d7d532';
var dateToday = DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text(
              'Error',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            color: Colors.red,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ));
      },
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Services services = Services();

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
        navigatorKey: NavigationService.instance.navigationKey,
        theme: myTheme,
        themeMode: ThemeMode.light,
        initialRoute: services.auth.currentUser == null
            ? OnBoarding.route
            : PagesDecider.route,
        routes: {
          App.route: (context) => App(),
          ForgotPassword.route: (context) => ForgotPassword(),
          SignUp.route: (context) => SignUp(),
          SignIn.route: (context) => SignIn(),
          GoToEmail.route: (context) => GoToEmail(),
          Schedule.route: (context) => Schedule(),
          PagesDecider.route: (context) => PagesDecider(),
          OnBoarding.route: (context) => OnBoarding(),
          WelcomeScreen.route: (context) => WelcomeScreen(),
          ProfileInformationPage.route: (context) => ProfileInformationPage(),
          CreateTask.route: (context) => CreateTask(),
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class App extends StatefulWidget {
  static const route = 'App';
  Services services = Services();
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    loadUser();
    super.initState();
  }

  loadUser() async {
    widget.services.initializeUser();
  }

  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}
