import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../meta/widgets/constants.dart';

class SignInViewModel extends BaseViewModel {
  GlobalKey<FormState> signInFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    Icons.lock_outline_rounded,
    size: 18,
  );

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
    if (value == null || value.isEmpty) {
      return 'Email cannot be blank';
    } else if (!RegExp(kRegExp).hasMatch(value)) {
      return 'Not an email';
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

  void formValidator() {
    autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (signInFormKey.currentState.validate()) {}
  }
}
