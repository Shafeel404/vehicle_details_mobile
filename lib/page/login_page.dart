import 'package:flutter/material.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/reusables/LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: kInputPageDecoration,
        child: Center(
          child: LoginForm(),
        ),
      )),
    );
  }
}
