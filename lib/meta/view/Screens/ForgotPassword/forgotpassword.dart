import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/forgotpasswordviewmodel.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/components.dart';

class ForgotPassword extends StatelessWidget {
  static const route = 'forgotpassword';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        builder: (context, model, child) {
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
                          borderRadius:
                              BorderRadius.circular(kBorderRadius * 3),
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
                            padding:
                                EdgeInsets.symmetric(horizontal: kHPadding * 2),
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kVPadding * 4),
                            padding: EdgeInsets.symmetric(
                              horizontal: kHPadding * 2,
                            ),
                            child: Form(
                              autovalidateMode: model.autoValidate,
                              key: model.forgotPasswordFormKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(" ")),
                                    ],
                                    autofocus: false,
                                    validator: (value) {
                                      return model.emailValidator(value);
                                    },
                                    cursorColor: kPrimaryColor,
                                    textInputAction: TextInputAction.done,
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
                                  PrimaryButton(
                                    action: () => model.formValidator(),
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
        },
        viewModelBuilder: () => ForgotPasswordViewModel());
  }
}
