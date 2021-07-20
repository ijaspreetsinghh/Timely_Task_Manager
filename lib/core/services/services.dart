import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/meta/view/Screens/ForgotPassword/gotoemail.dart';
import 'package:timely/meta/view/Screens/MainAppPages/timelypagesdecider.dart';
import 'package:timely/meta/view/Screens/Onboarding/welcomeScreen.dart';
import 'package:timely/meta/view/Screens/SignUp/signup.dart';
import 'package:timely/meta/widgets/constants.dart';

class Services extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String _messageTitle = "Empty";
  get messageTitle => _messageTitle;
  String _notificationAlert = "alert";
  get notificationAlert => _notificationAlert;

  String displayName;
  String email;
  String photoUrl;
  bool isEmailVerified;
  final firebaseStorageRef = FirebaseStorage.instance.ref();
  bool _isPro = false;
  get isPro => _isPro;

  initializeUser() async {
    photoUrl = auth.currentUser.photoURL;
    displayName = auth.currentUser.displayName;
    email = auth.currentUser.email;
    isEmailVerified = auth.currentUser.emailVerified;
    // var data;
    // await users
    //     .doc(auth.currentUser.uid)
    //     .get()
    //     .then((value) => data = value.data());
    // _isPro = data['isPro'];
    notifyListeners();
  }

  Future createTask(
      {@required taskDateTime,
      @required taskTitle,
      @required taskDescription,
      @required alarmSet,
      @required taskCategory}) {
    NavigationService.instance.showLoader(title: 'Creating Task');
    return users.doc(auth.currentUser.uid).collection('Tasks').add({
      'Task Title': taskTitle,
      'Task Description': taskDescription,
      'Task Date Time': taskDateTime,
      'isAlarmSet': alarmSet,
      'Task Category': taskCategory,
      'Task Status': 'Pending',
    }).then((value) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Success',
          content: 'Task create for \'$taskTitle\'',
          primaryAction: () =>
              NavigationService.instance.replace(PagesDecider.route),
          primaryActionTitle: 'OK');
    }).catchError((onError) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Failure',
          content: 'Request failed, try after some time',
          primaryAction: () => NavigationService.instance.goBack(),
          primaryActionTitle: 'Try again');
    });
  }

  Color colorSelector({String taskCategory}) {
    if (taskCategory == 'Work')
      return kRedColor;
    else if (taskCategory == 'Home')
      return kGreenColor;
    else if (taskCategory == 'Personal')
      return kPrimaryColor;
    else
      return kAquaColor;
  }

  Stream getTasks() {
    return users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .orderBy('Task Date Time')
        .snapshots();
  }

  Stream getHistorys() {
    return users
        .doc(auth.currentUser.uid)
        .collection('History')
        .orderBy('Task Date Time')
        .snapshots();
  }

  Future uploadImageToFirebase({BuildContext context, thisImageFile}) async {
    NavigationService.instance.showLoader(title: 'Setting Profile Image');
    var snapshot = await firebaseStorageRef
        .child('ProfilePictures/${Services().auth.currentUser.uid}')
        .putFile(thisImageFile)
        .catchError((onError) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong while uploading profile image.',
          primaryActionTitle: 'Close',
          primaryAction: () => NavigationService.instance.goBack());
    });

    await snapshot.ref.getDownloadURL().then((value) async {
      await auth.currentUser
          .updateProfile(photoURL: value)
          .catchError((onError) {
        NavigationService.instance.hideLoader();
        NavigationService.instance.showAlertWithOneButton(
            title: 'Error',
            content: 'Something went wrong while setting profile image.',
            primaryActionTitle: 'Close',
            primaryAction: () => NavigationService.instance.goBack());
      });
      NavigationService.instance.hideLoader();
    }).catchError((onError) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong while uploading profile image.',
          primaryActionTitle: 'Close',
          primaryAction: () => NavigationService.instance.goBack());
    });
  }

  Future updateDisplayName(name) async {
    NavigationService.instance.goBack();
    NavigationService.instance.showLoader(title: 'Updating Name');

    return await auth.currentUser
        .updateProfile(displayName: name)
        .catchError((error) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong. ${error.code}',
          primaryAction: () => NavigationService.instance.goBack(),
          primaryActionTitle: 'OK');
    });
  }

  Future updateEmail(email, currentPassword) async {
    NavigationService.instance.goBack();
    NavigationService.instance.showLoader(title: 'Updating');
    return auth.currentUser
        .reauthenticateWithCredential(EmailAuthProvider.credential(
            email: auth.currentUser.email, password: currentPassword))
        .then((value) async {
      await auth.currentUser
          .verifyBeforeUpdateEmail(
        email,
      )
          .then((value) async {
        NavigationService.instance.hideLoader();
        await NavigationService.instance.replace(WelcomeScreen.route);
        NavigationService.instance.showAlertWithOneButton(
            title: 'Email Changed',
            content:
                "Your sign in email has been changed to '$email'. You may need to sign in again with the new email.",
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Sign In Now');
      }).catchError((error) {
        NavigationService.instance.hideLoader();
        NavigationService.instance.showAlertWithOneButton(
            title: 'Error',
            content: 'Something went wrong. ${error.code}',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'OK');
      });
    }).catchError((error) {
      NavigationService.instance.hideLoader();
      if (error.code == 'wrong-password') {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Wrong password',
            content: 'Email can not be updated without the current password.',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try Again');
      } else {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Failure',
            content: 'Request failed, try after some time',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try again');
      }
    });
  }

  Future updatePassword(currentPassword, newPassword) async {
    NavigationService.instance.goBack();
    NavigationService.instance.showLoader(title: 'Updating');
    return auth.currentUser
        .reauthenticateWithCredential(EmailAuthProvider.credential(
            email: auth.currentUser.email, password: currentPassword))
        .then((value) async {
      await auth.currentUser.updatePassword(newPassword).then((value) async {
        NavigationService.instance.hideLoader();

        NavigationService.instance.showAlertWithOneButton(
          title: 'Success',
          content:
              "Your password has been changed successfully for account '${auth.currentUser.email}'",
          primaryActionTitle: 'OK',
          primaryAction: () {
            NavigationService.instance.goBack();
            NavigationService.instance.replace(PagesDecider.route);
          },
        );
      }).catchError((error) {
        NavigationService.instance.hideLoader();
        NavigationService.instance.showAlertWithOneButton(
            title: 'Error',
            content: 'Something went wrong. ${error.code}',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'OK');
      });
    }).catchError((error) {
      NavigationService.instance.hideLoader();
      if (error.code == 'wrong-password') {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Wrong password',
            content: 'Please check your current password and try again.',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try Again');
      } else {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Failure',
            content: 'Request failed, try after some time',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try again');
      }
    });
  }

  String nameValidator(value) {
    if (value.isEmpty) {
      return 'Name cannot be blank';
    } else if (value.length < 3) {
      return 'Invalid name';
    } else if (value == displayName) {
      return 'No change detected';
    }
    return null;
  }

  String passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return '6-30 characters password';
    } else if (value.length < 6) {
      return 'Minimum 6 characters';
    } else if (value.length > 30) {
      return 'Maximum 30 characters';
    }
    return null;
  }

  String emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be blank';
    } else if (!RegExp(kRegExp).hasMatch(value)) {
      return 'Not an email';
    }
    return null;
  }

  Future verifyEmail() async {
    NavigationService.instance.goBack();
    NavigationService.instance.showLoader(title: 'Generating email');
    return auth.currentUser.sendEmailVerification().then((value) async {
      NavigationService.instance.hideLoader();
      NavigationService.instance.pushNamed(GoToEmail.route);
    }).catchError((error) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong. ${error.code}.',
          primaryActionTitle: 'OK',
          primaryAction: () => NavigationService.instance.goBack());
    });
  }

  Future registerUser({String email, String password, String name}) async {
    NavigationService.instance.showLoader(title: 'Validating Credentials');

    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await initializeUser();
      await updateDisplayName(name);
      await addUserData();
      if (auth.currentUser != null) {
        auth.currentUser.emailVerified
            ? NavigationService.instance.pushNamed(PagesDecider.route)
            : NavigationService.instance.pushNamed(GoToEmail.route);
      }
    }).catchError((e) {
      NavigationService.instance.goBack();

      if (e.code == 'email-already-in-use') {
        NavigationService.instance.showAlertWithTwoButtons(
            title: 'Account already exists',
            content:
                "We already have an account with email '$email'. Try another email, or reset your account password.",
            primaryAction: () {
              NavigationService.instance.goBack();
              resetUserPassword(thisEmail: email);
            },
            secondaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Reset Password',
            secondaryActionTitle: 'Try Changing Email');
      } else if (e.code == 'weak-password') {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Weak password detected',
            content: 'Please use a strong password and try again.',
            primaryAction: () {
              NavigationService.instance.goBack();
              resetUserPassword(thisEmail: email);
            },
            primaryActionTitle: 'OK');
      } else {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Failure',
            content: 'Request failed, try after some time',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try again');
      }
    });
    // NavigationService.instance.hideLoader();
  }

  Future addUserData() async {
    await users
        .doc(auth.currentUser.uid)
        .set({'isPro': false}).catchError((error) {
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong. ${error.code}',
          primaryAction: () => NavigationService.instance.goBack(),
          primaryActionTitle: 'OK');
    });
    await users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .doc('dummyId')
        .set({}).catchError((error) {
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong. ${error.code}',
          primaryAction: () => NavigationService.instance.goBack(),
          primaryActionTitle: 'OK');
    });
    await users
        .doc(auth.currentUser.uid)
        .collection('History')
        .doc('dummyId')
        .set({}).catchError((error) {
      NavigationService.instance.hideLoader();
      NavigationService.instance.showAlertWithOneButton(
          title: 'Error',
          content: 'Something went wrong. ${error.code}',
          primaryAction: () => NavigationService.instance.goBack(),
          primaryActionTitle: 'OK');
    });
  }

  Future updateTask(
      {@required thisTaskId,
      @required taskName,
      @required taskDesc,
      @required taskDate,
      @required taskTime,
      @required isAlarmSet,
      @required taskCategory,
      @required taskStatus}) {
    Timestamp myTaskDateTime = Timestamp.fromDate(DateTime(taskDate.year,
        taskDate.month, taskDate.day, taskTime.hour, taskTime.minute, 0));
    NavigationService.instance.goBack();

    NavigationService.instance.showLoader(title: 'Updating Task');
    return users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .doc(thisTaskId)
        .update({
      'Task Category': taskCategory,
      'Task Description': taskDesc,
      'Task Title': taskName,
      'isAlarmSet': isAlarmSet,
      'Task Status': taskStatus,
      'Task Date Time': myTaskDateTime
    }).then(
      (value) {
        NavigationService.instance.hideLoader();
      },
    ).catchError(
      (onError) => print('error'),
    );
  }

  Future markTaskAsDone(
      {@required thisTaskId,
      @required taskName,
      @required taskDesc,
      @required taskDate,
      @required taskTime,
      @required isAlarmSet,
      @required taskCategory,
      @required taskStatus}) {
    NavigationService.instance.goBack();

    NavigationService.instance.showLoader(title: 'Updating Task Status');
    Timestamp myTaskDateTime = Timestamp.fromDate(DateTime(taskDate.year,
        taskDate.month, taskDate.day, taskTime.hour, taskTime.minute, 0));
    return users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .doc(thisTaskId)
        .update({
      'Task Category': taskCategory,
      'Task Description': taskDesc,
      'Task Title': taskName,
      'isAlarmSet': isAlarmSet,
      'Task Status': 'Done',
      'Task Date Time': myTaskDateTime
    }).then(
      (value) {
        NavigationService.instance.hideLoader();
      },
    ).catchError(
      (onError) => print('error'),
    );
  }

  Future markTaskAsInComplete(
      {@required thisTaskId,
      @required taskName,
      @required taskDesc,
      @required taskDate,
      @required taskTime,
      @required isAlarmSet,
      @required taskCategory,
      @required taskStatus}) {
    NavigationService.instance.goBack();

    NavigationService.instance.showLoader(title: 'Updating Task Status');
    Timestamp myTaskDateTime = Timestamp.fromDate(DateTime(taskDate.year,
        taskDate.month, taskDate.day, taskTime.hour, taskTime.minute, 0));
    return users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .doc(thisTaskId)
        .update({
      'Task Category': taskCategory,
      'Task Description': taskDesc,
      'Task Title': taskName,
      'isAlarmSet': isAlarmSet,
      'Task Status': 'Pending',
      'Task Date Time': myTaskDateTime
    }).then(
      (value) {
        NavigationService.instance.hideLoader();
      },
    ).catchError(
      (onError) => print('error'),
    );
  }

  Future deleteTask(thisTaskId) {
    NavigationService.instance.goBack();

    NavigationService.instance.showLoader(title: 'Deleting Task');
    return users
        .doc(auth.currentUser.uid)
        .collection('Tasks')
        .doc(thisTaskId)
        .delete()
        .then(
      (value) {
        NavigationService.instance.hideLoader();
      },
    );
  }

  logOut() async {
    await auth.signOut();
    NavigationService.instance.replace(WelcomeScreen.route);
  }

  Future resetUserPassword({thisEmail}) async {
    NavigationService.instance
        .showLoader(title: 'Generating password reset email');
    await auth.sendPasswordResetEmail(email: thisEmail).then((value) {
      NavigationService.instance.goBack();
      NavigationService.instance.pushNamed(GoToEmail.route);
    }).catchError((e) {
      NavigationService.instance.goBack();
      if (e.code == 'user-not-found') {
        NavigationService.instance.showAlertWithOneButton(
            title: 'User not found',
            content:
                'Please check if you have created any account with \'$thisEmail\', or try changing email.',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'OK');
      } else {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Failure',
            content: 'Request failed, try after some time',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try again');
      }
    });
  }

  Future signInUser({thisEmail, thisPassword}) async {
    NavigationService.instance.showLoader(title: 'Validating Credentials');
    await auth
        .signInWithEmailAndPassword(email: thisEmail, password: thisPassword)
        .then((value) async {
      await initializeUser();

      if (auth.currentUser != null) {
        auth.currentUser.emailVerified
            ? NavigationService.instance.pushNamed(PagesDecider.route)
            : NavigationService.instance.pushNamed(GoToEmail.route);
      }
    }).catchError((e) {
      NavigationService.instance.hideLoader();

      if (e.code == 'wrong-password') {
        NavigationService.instance.showAlertWithTwoButtons(
            title: 'Invalid Credentials',
            content:
                'Email and Password provided by you does\'nt match. Please check your email or password.',
            primaryActionTitle: 'Reset Password',
            secondaryActionTitle: 'Try Again',
            secondaryAction: () => NavigationService.instance.goBack(),
            primaryAction: () {
              NavigationService.instance.goBack();
              resetUserPassword(thisEmail: thisEmail);
            });
      } else if (e.code == 'user-not-found') {
        NavigationService.instance.showAlertWithTwoButtons(
            title: 'Can\'t Find Account',
            content:
                "We can't find an account with email '$thisEmail'. Try another email, or if you don't have an account, you can create one.",
            primaryActionTitle: 'Create Account',
            secondaryActionTitle: 'Try Again',
            secondaryAction: () => NavigationService.instance.goBack(),
            primaryAction: () {
              NavigationService.instance.goBack();
              NavigationService.instance.pushNamed(SignUp.route);
            });
      } else {
        NavigationService.instance.showAlertWithOneButton(
            title: 'Failure',
            content: 'Request failed, try after some time',
            primaryAction: () => NavigationService.instance.goBack(),
            primaryActionTitle: 'Try again');
      }
    });
  }
}
