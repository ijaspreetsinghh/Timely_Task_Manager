import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:timely/core/services/services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  Services services = Services();
  var autoValidate = AutovalidateMode.disabled;

  String emailValidator(value) {
    return services.emailValidator(value);
  }

  void formValidator() {
    String email = emailController.text;
    autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (forgotPasswordFormKey.currentState.validate()) {
      services.resetUserPassword(thisEmail: email);
    }
  }
}
