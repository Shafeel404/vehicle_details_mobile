import 'package:flutter/material.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/page/sign_up_page.dart';
import 'package:vehicle_details/sub_page/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
              const Expanded(flex: 9, child: LoginForm()),
            ],
          ),
        ),
      ),
    );
  }
}
