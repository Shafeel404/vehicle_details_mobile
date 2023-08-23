import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/http/login_api.dart';
import 'package:vehicle_details/page/input_page.dart';
import 'package:vehicle_details/sub_page/dialog_box.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var token = "";
  var error = "";
  void _login() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      Response? loginApiResponse = await LoginApi.getLogin(email, password);
      jsonDecode(loginApiResponse!.body);
      if (loginApiResponse.statusCode != 200) {
        var data = jsonDecode(loginApiResponse.body);
        error = data['message'];
        DialogBox(context).showErrorDialogBox(error);
      } else {
        var data = jsonDecode(loginApiResponse.body);
        token = data['token'];
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return InputPage(token);
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter user email ',
              icon: kMailIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter password ',
              icon: kPasswordIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white, width: 2.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                  ),
                ),
              ),
              onPressed: _login,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
