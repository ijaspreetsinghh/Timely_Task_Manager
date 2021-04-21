import 'package:flutter/material.dart';
import 'package:timely/Screens/ForgotPassword/forgotpassword.dart';
import 'package:timely/Screens/MainAppPages/timelypagesdecider.dart';
import 'package:timely/constants.dart';
import 'package:timely/components.dart';

class SignIn extends StatefulWidget {
  static const route = 'SignIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _signInFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    Icons.lock_outline_rounded,
    size: 18,
  );
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _obscureText == true
          ? showPasswordIcon = Icon(
              Icons.lock_outline_rounded,
              size: 18,
            )
          : showPasswordIcon = Icon(
              Icons.lock_open_rounded,
              size: 18,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.only(top: kVPadding * 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius * 3),
                    color: Colors.white),
                child: Column(
                  children: [
                    FormHeading(
                      title: 'Sign In',
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kVPadding * 3),
                      padding: EdgeInsets.symmetric(
                        horizontal: kHPadding * 2,
                      ),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: kPrimaryColor,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                              style: kCircularStdText.copyWith(fontSize: 16),
                              decoration: InputDecoration(
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
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              cursorColor: kPrimaryColor,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              style: kCircularStdText.copyWith(fontSize: 16),
                              decoration: InputDecoration(
                                isDense: true,
                                suffixIcon: IconButton(
                                  icon: showPasswordIcon,
                                  onPressed: () => _toggle(),
                                  padding: EdgeInsets.only(right: kHPadding),
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
                            Container(
                              // padding: EdgeInsets.symmetric(vertical: kVPadding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, ForgotPassword.route),
                                      child: Text(
                                        'Forgot password?',
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
                              action: () => Navigator.pushNamed(
                                  context, PagesDecider.route),
                              title: 'Sign In',
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
  }
}
