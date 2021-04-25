import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../meta/widgets/constants.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  var autoValidate = AutovalidateMode.disabled;

  String emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be blank';
    } else if (!RegExp(kRegExp).hasMatch(value)) {
      return 'Not an email';
    }
    return null;
  }

  void formValidator() {
    autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (forgotPasswordFormKey.currentState.validate()) {}
  }
}
