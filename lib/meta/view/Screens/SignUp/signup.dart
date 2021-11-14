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
          return Container(
            color: kOffWhite,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: true,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            // color: Colors.green,
                            image: AssetImage('assets/images/signUp.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BackButtonWithoutAppBar(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: kHPadding * 1.5),
                              child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Friend,',
                                          style: kCircularStdText.copyWith(
                                              fontWeight: FontWeight.w700)),
                                    ],
                                    text: 'Hello ',
                                    style: kCircularStdText.copyWith(
                                      color: kBlackTextColor,
                                      fontFamily: kMuliFont,
                                      fontSize: 28,
                                    )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: kHPadding * 1.5),
                              child: Text(
                                'Enter your information',
                                style: kCircularStdText.copyWith(
                                  color: kBlackTextColor,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          FormHeading(
                            title: 'Create Account',
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kVPadding * 2),
                            padding: EdgeInsets.symmetric(
                              horizontal: kHPadding * 2,
                            ),
                            child: Form(
                              key: model.signUpFormKey,
                              autovalidateMode: model.autoValidate,
                              child: AutofillGroup(
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
                                      autofillHints: [AutofillHints.name],
                                      controller: model.nameController,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: kPrimaryColor,
                                      keyboardType: TextInputType.text,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      style: kCircularStdText.copyWith(
                                          fontSize: 16),
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
                                    Hero(
                                      tag: 'EmailField',
                                      child: Material(
                                        child: TextFormField(
                                          validator: (value) {
                                            return model.emailValidator(value);
                                          },
                                          controller: model.emailController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(" ")),
                                          ],
                                          autofillHints: [AutofillHints.email],
                                          autofocus: false,
                                          cursorColor: kPrimaryColor,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          style: kCircularStdText.copyWith(
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            errorStyle: kErrorTextStyle,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kRedColor,
                                                width: 2,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kRedColor,
                                                width: 2,
                                              ),
                                            ),
                                            hintText: 'example@email.com',
                                            hintStyle: kHintTextStyle,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: kHPadding * 1.5,
                                                    vertical: kVPadding * 1.7),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'Email',
                                            labelStyle: kLabelTextStyle,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kPrimaryColor,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kPrimaryColor,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: kVPadding * 3,
                                    ),
                                    Hero(
                                      tag: 'PasswordField',
                                      child: Material(
                                        child: TextFormField(
                                          controller: model.passwordController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(" ")),
                                          ],
                                          validator: (value) {
                                            return model
                                                .passwordValidator(value);
                                          },
                                          autofillHints: [
                                            AutofillHints.newPassword,
                                            AutofillHints.password,
                                          ],
                                          autofocus: false,
                                          textInputAction: TextInputAction.done,
                                          cursorColor: kPrimaryColor,
                                          obscureText: model.obscureText,
                                          keyboardType: TextInputType.text,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          style: kCircularStdText.copyWith(
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            errorStyle: kErrorTextStyle,
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kRedColor,
                                                width: 2,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              padding: EdgeInsets.only(
                                                  right: kHPadding),
                                            ),
                                            hintText: '• • • • • • • •',
                                            hintStyle: kHintTextStyle.copyWith(
                                                fontSize: 12),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: kHPadding * 1.5,
                                                    vertical: kVPadding * 1.7),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'Password',
                                            labelStyle: kLabelTextStyle,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kPrimaryColor,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kBorderRadius),
                                              borderSide: BorderSide(
                                                color: kPrimaryColor,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.symmetric(vertical: kVPadding),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                      context, SignIn.route),
                                              child: Text(
                                                'Already have an account?',
                                                style:
                                                    kCircularStdText.copyWith(
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
                                    Hero(
                                      tag: 'SignUpButton',
                                      child: PrimaryButton(
                                        action: () => model.formValidator(),
                                        title: 'Create Account',
                                      ),
                                    )
                                  ],
                                ),
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
