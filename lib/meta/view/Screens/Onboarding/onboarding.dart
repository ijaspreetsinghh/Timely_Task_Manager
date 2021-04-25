import 'package:flutter/material.dart';
import 'package:timely/meta/view/Screens/SignUp/signup.dart';

class Onboarding extends StatelessWidget {
  static const route = 'Onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Go'),
          onPressed: () => Navigator.pushNamed(context, SignUp.route),
        ),
      ),
    );
  }
}
