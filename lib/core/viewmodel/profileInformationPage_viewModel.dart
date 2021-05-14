import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/services.dart';
import 'package:timely/meta/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:timely/meta/widgets/constants.dart';

class ProfileInformationPageViewModel extends BaseViewModel {
  Services services = Services();
  bool isProUser = true;

  GlobalKey<FormState> updateNameFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    Icons.lock_outline_rounded,
    size: 18,
  );
  bool obscureText = true;
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

  GlobalKey<FormState> updateEmailFormKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction;
  TextEditingController nameController =
      TextEditingController(text: Services().auth.currentUser.displayName);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  void updateNameFormValidator() {
    notifyListeners();
    if (updateNameFormKey.currentState.validate()) {
      services.updateDisplayName(nameController.text);
    }
  }

  void updateEmailFormValidator() {
    notifyListeners();
    if (updateEmailFormKey.currentState.validate()) {
      services.updateEmail(
          emailController.text, currentPasswordController.text);
    }
  }

  logOut() async {
    // services.initializeUser();
    await services.logOut();
  }

  String nameValidator(value) {
    return services.nameValidator(value);
  }

  String passwordValidator(value) {
    return services.passwordValidator(value);
  }

  String currentPasswordValidator(value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value.length > 30) {
      return 'Enter your current password.';
    }
    return null;
  }

  Future verifyEmail() {
    return services.verifyEmail();
  }

  String emailValidator(value) {
    return services.emailValidator(value);
  }

  void showUpdateName({
    BuildContext ctx,
  }) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 20,
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffbbbbb9),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  height: 3,
                  width: 75,
                  alignment: AlignmentDirectional.center,
                ),
                SizedBox(
                  height: kVPadding,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(kHPadding * 1.5, kVPadding * 2,
                      kHPadding * 1.5, kVPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadius * 2),
                          topRight: Radius.circular(kBorderRadius * 2))),
                  child: Form(
                    key: updateNameFormKey,
                    autovalidateMode: autoValidate,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FormHeading(title: 'Update Name'),
                        SizedBox(
                          height: kVPadding * 4,
                        ),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(kNameRegEx))
                          ],
                          controller: nameController,
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          style: kCircularStdText.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            errorStyle: kErrorTextStyle,
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kRedColor,
                                width: 2,
                              ),
                            ),
                            hintText: 'John Doe',
                            hintStyle: kHintTextStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 1.7),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Full Name',
                            labelStyle: kLabelTextStyle,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return nameValidator(value);
                          },
                        ),
                        SizedBox(
                          height: kVPadding * 3,
                        ),
                        PrimaryButton(
                          action: () {
                            updateNameFormValidator();
                          },
                          title: 'Update',
                          textColor: Colors.white,
                          buttonColor: kPrimaryColor,
                          buttonBackgroundColor: kPrimaryColor.withOpacity(.3),
                        ),
                        SizedBox(
                          height: kVPadding * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }

  void showUpdateEmail({
    BuildContext ctx,
  }) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 20,
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffbbbbb9),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  height: 3,
                  width: 75,
                  alignment: AlignmentDirectional.center,
                ),
                SizedBox(
                  height: kVPadding,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(kHPadding * 1.5, kVPadding * 2,
                      kHPadding * 1.5, kVPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadius * 2),
                          topRight: Radius.circular(kBorderRadius * 2))),
                  child: Form(
                    key: updateEmailFormKey,
                    autovalidateMode: autoValidate,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FormHeading(title: 'Update Email'),
                        SizedBox(
                          height: kVPadding * 4,
                        ),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(" ")),
                          ],
                          controller: emailController,
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          style: kCircularStdText.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            errorStyle: kErrorTextStyle,
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kRedColor,
                                width: 2,
                              ),
                            ),
                            hintText: 'eg@example.com',
                            hintStyle: kHintTextStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 1.7),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'New Email',
                            labelStyle: kLabelTextStyle,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return emailValidator(value);
                          },
                        ),
                        SizedBox(
                          height: kVPadding * 3,
                        ),
                        TextFormField(
                          controller: currentPasswordController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(" ")),
                          ],
                          validator: (value) {
                            return currentPasswordValidator(value);
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          cursorColor: kPrimaryColor,
                          obscureText: obscureText,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          style: kCircularStdText.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            errorStyle: kErrorTextStyle,
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kRedColor,
                                width: 2,
                              ),
                            ),
                            isDense: true,
                            suffixIcon: IconButton(
                              icon: showPasswordIcon,
                              onPressed: () => toggle(),
                              padding: EdgeInsets.only(right: kHPadding),
                            ),
                            hintText: '• • • • • • • •',
                            hintStyle: kHintTextStyle.copyWith(fontSize: 12),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: kHPadding * 1.5,
                                vertical: kVPadding * 1.7),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Current Password',
                            labelStyle: kLabelTextStyle,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kVPadding * 3,
                        ),
                        PrimaryButton(
                          action: () {
                            updateEmailFormValidator();
                          },
                          title: 'Update',
                          textColor: Colors.white,
                          buttonColor: kPrimaryColor,
                          buttonBackgroundColor: kPrimaryColor.withOpacity(.3),
                        ),
                        SizedBox(
                          height: kVPadding * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
