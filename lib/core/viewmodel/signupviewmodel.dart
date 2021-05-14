import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    Icons.lock_outline_rounded,
    size: 18,
  );
  Services services = Services();
  bool obscureText = true;
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  String nameValidator(value) {
    return services.nameValidator(value);
  }

  String emailValidator(value) {
    return services.emailValidator(value);
  }

  String passwordValidator(value) {
    return services.passwordValidator(value);
  }

  void formValidator() {
    String email = emailController.text;
    String name = nameController.text;
    String password = passwordController.text;
    autoValidate = AutovalidateMode.onUserInteraction;
    notifyListeners();
    if (signUpFormKey.currentState.validate()) {
      services.registerUser(email: email, name: name, password: password);
    }
  }
}
