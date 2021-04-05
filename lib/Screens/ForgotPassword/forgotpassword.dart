import 'package:flutter/material.dart';
import 'package:timely/Screens/ForgotPassword/gotoemail.dart';
import '../../constants.dart';
import '../../components.dart';

class ForgotPassword extends StatefulWidget {
  static const route = 'ForgotPassword';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey();

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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormHeading(
                            title: 'Forgot Password?',
                          ),
                          SizedBox(
                            height: kVPadding,
                          ),
                          Text(
                            'Enter the email associated with your account and we\'ll send and email with instructions to reset your password.',
                            style: TextStyle(
                                color: kGrayTextColor,
                                fontSize: 14,
                                fontFamily: kCircularStdFont,
                                fontWeight: FontWeight.w400,
                                height: 1.2),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: kHPadding * 2),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kVPadding * 4),
                      padding: EdgeInsets.symmetric(
                        horizontal: kHPadding * 2,
                      ),
                      child: Form(
                        key: _forgotPasswordFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: kPrimaryColor,
                              textInputAction: TextInputAction.done,
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
                            PrimaryButton(
                              action: () =>
                                  Navigator.pushNamed(context, GoToEmail.route),
                              title: 'Reset Password',
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
