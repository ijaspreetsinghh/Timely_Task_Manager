import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/viewmodel/signinviewmodel.dart';
import '../../Screens/ForgotPassword/forgotpassword.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/components.dart';

class SignIn extends StatelessWidget {
  static const route = 'signin';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
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

                            image: AssetImage(
                              'assets/images/signIn.png',
                            ),
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
                              child: Text(
                                'Welcome Back ',
                                style: kCircularStdText.copyWith(
                                    color: kBlackTextColor,
                                    fontFamily: kMuliFont,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          FormHeading(
                            title: 'Sign In',
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kVPadding * 3),
                            padding: EdgeInsets.symmetric(
                              horizontal: kHPadding * 2,
                            ),
                            child: AutofillGroup(
                              child: Form(
                                key: model.signInFormKey,
                                autovalidateMode: model.autoValidate,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(" ")),
                                      ],
                                      controller: model.emailController,
                                      autofocus: false,
                                      validator: (value) {
                                        return model.emailValidator(value);
                                      },
                                      autofillHints: [AutofillHints.email],
                                      cursorColor: kPrimaryColor,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      textCapitalization:
                                          TextCapitalization.none,
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
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              kBorderRadius),
                                          borderSide: BorderSide(
                                            color: kRedColor,
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
                                      controller: model.passwordController,
                                      autofocus: false,
                                      validator: (value) {
                                        return model.passwordValidator(value);
                                      },
                                      autofillHints: [AutofillHints.password],
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
                                        hintStyle: kHintTextStyle.copyWith(
                                            fontSize: 12),
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
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              kBorderRadius),
                                          borderSide: BorderSide(
                                            color: kRedColor,
                                            width: 2,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      ForgotPassword.route),
                                              child: Text(
                                                'Forgot password?',
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
                                    PrimaryButton(
                                      action: () => model.formValidator(),
                                      title: 'Sign In',
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
        viewModelBuilder: () => SignInViewModel());
  }
}
