import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/http/register_api.dart';
import 'package:vehicle_details/page/login_page.dart';

import 'dialog_box.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  var response = "";
  var error = "";
  void _register() async {
    DialogBox(context).showTempDialogBox();
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      String name = _nameController.text;

      Response? registerApiResponse =
          await RegisterApi.getSignUp(email, password, name);
      jsonDecode(registerApiResponse!.body);
      Navigator.pop(context);
      if (registerApiResponse.statusCode != 200) {
        var data = jsonDecode(registerApiResponse.body);
        error = data['message'];

        DialogBox(context).showErrorDialogBox(error);
      } else {
        var data = jsonDecode(registerApiResponse.body);
        response = data['response'];
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }

        DialogBox(context).showSuccessDialogBox(response);
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
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill this';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter name ',
              icon: kNameIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
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
              onPressed: _register,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Register',
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
