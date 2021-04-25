import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/signupviewmodel.dart';
import '../../Screens/SignIn/signin.dart';
import '../../../widgets/components.dart';
import '../../../widgets/constants.dart';

class SignUp extends StatelessWidget {
  static const route = 'signup';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: kOffWhite,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      // width: MediaQuery.of(context).size.width,
                      child: Image(
                        // color: Colors.green,
                        image: AssetImage('assets/images/man.png'),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          FormHeading(
                            title: 'Sign Up',
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kVPadding * 3),
                            padding: EdgeInsets.symmetric(
                              horizontal: kHPadding * 2,
                            ),
                            child: Form(
                              key: model.signUpFormKey,
                              autovalidateMode: model.autoValidate,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      return model.nameValidator(value);
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(kNameRegEx))
                                    ],
                                    autofocus: false,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: kPrimaryColor,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style:
                                        kCircularStdText.copyWith(fontSize: 16),
                                    decoration: InputDecoration(
                                      errorStyle: kErrorTextStyle,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
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
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: 'Full Name',
                                      labelStyle: kLabelTextStyle,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kPrimaryColor,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
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
                                  TextFormField(
                                    validator: (value) {
                                      return model.emailValidator(value);
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(" ")),
                                    ],
                                    autofocus: false,
                                    cursorColor: kPrimaryColor,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    style:
                                        kCircularStdText.copyWith(fontSize: 16),
                                    decoration: InputDecoration(
                                      errorStyle: kErrorTextStyle,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kRedColor,
                                          width: 2,
                                        ),
                                      ),
                                      hintText: 'example@email.com',
                                      hintStyle: kHintTextStyle,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: kHPadding * 1.5,
                                          vertical: kVPadding * 1.7),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: 'Email',
                                      labelStyle: kLabelTextStyle,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kPrimaryColor,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
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
                                  TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(" ")),
                                    ],
                                    validator: (value) {
                                      return model.passwordValidator(value);
                                    },
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    cursorColor: kPrimaryColor,
                                    obscureText: model.obscureText,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style:
                                        kCircularStdText.copyWith(fontSize: 16),
                                    decoration: InputDecoration(
                                      errorStyle: kErrorTextStyle,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kRedColor,
                                          width: 2,
                                        ),
                                      ),
                                      isDense: true,
                                      suffixIcon: IconButton(
                                        icon: model.showPasswordIcon,
                                        onPressed: () => model.toggle(),
                                        padding:
                                            EdgeInsets.only(right: kHPadding),
                                      ),
                                      hintText: '• • • • • • • •',
                                      hintStyle:
                                          kHintTextStyle.copyWith(fontSize: 12),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: kHPadding * 1.5,
                                          vertical: kVPadding * 1.7),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: 'Password',
                                      labelStyle: kLabelTextStyle,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kPrimaryColor,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        borderSide: BorderSide(
                                          color: kPrimaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.symmetric(vertical: kVPadding),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pushNamed(
                                                    context, SignIn.route),
                                            child: Text(
                                              'Already have an account?',
                                              style: kCircularStdText.copyWith(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: kVPadding * 2,
                                  ),
                                  PrimaryButton(
                                    action: () => model.formValidator(),
                                    title: 'Sign Up',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => SignUpViewModel());
  }
}
