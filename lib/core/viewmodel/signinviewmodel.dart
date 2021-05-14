import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';

class SignInViewModel extends BaseViewModel {
  GlobalKey<FormState> signInFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    Icons.lock_outline_rounded,
    size: 18,
  );
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Services services = Services();
  bool obscureText = true;
  var autoValidate = AutovalidateMode.disabled;
  void toggle() {
    obscureText = !obscureText;
    obscureText == true
        ? showPasswordIcon = Icon(
            Icons.lock_outline_rounded,
            size: 18,
          )
        : showPasswordIcon = Icon(
            Icons.lock_open_rounded,
            size: 18,
          );
    notifyListeners();
  }

  String emailValidator(value) {
    return services.emailValidator(value);
  }

  String passwordValidator(value) {
    return services.passwordValidator(value);
  }

  void formValidator() {
    String email = emailController.text;
    String password = passwordController.text;
    autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (signInFormKey.currentState.validate()) {
      services.signInUser(thisEmail: email, thisPassword: password);
    }
  }
}
