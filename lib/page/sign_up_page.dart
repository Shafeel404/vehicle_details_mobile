import 'package:flutter/material.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/page/login_page.dart';
import 'package:vehicle_details/sub_page/sign_up_form.dart';

import '../sub_page/login_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kInputPageDecoration,
          child: Column(
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.white, width: 2.0)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
              const Expanded(flex: 9, child: SignUpForm()),
            ],
          ),
        ),
      ),
    );
  }
}
