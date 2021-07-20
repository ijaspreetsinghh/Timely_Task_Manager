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
          return Container(
            color: kOffWhite,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            // color: Colors.green,
                            image:
                                AssetImage('assets/images/forgetPassword.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        BackButtonWithoutAppBar(),
                      ],
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -20, 0),
                      padding: EdgeInsets.only(top: 0),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FormHeading(
                                  title: 'Reset Password',
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
                                    controller: model.emailController,
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
                                      focusedErrorBorder: OutlineInputBorder(
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
