import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timely/Screens/ForgotPassword/forgotpassword.dart';
import 'package:timely/Screens/SignIn/signin.dart';
import '../../components.dart';
import '../../constants.dart';

class SignUp extends StatefulWidget {
  static const route = 'SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _signUpFormKey = GlobalKey();
  var showPasswordIcon = Icon(
    FontAwesomeIcons.eyeSlash,
    size: 18,
  );
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _obscureText == true
          ? showPasswordIcon = Icon(
              FontAwesomeIcons.eyeSlash,
              size: 18,
            )
          : showPasswordIcon = Icon(
              FontAwesomeIcons.eye,
              size: 18,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.symmetric(vertical: kVPadding * 3),
                      padding: EdgeInsets.symmetric(
                        horizontal: kHPadding * 2,
                      ),
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              style: kCircularStdText.copyWith(fontSize: 16),
                              decoration: InputDecoration(
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
                              action: () => print('signup'),
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
  }
}
