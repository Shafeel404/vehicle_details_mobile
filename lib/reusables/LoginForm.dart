import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vehicle_details/http/login_api.dart';
import 'package:vehicle_details/page/input_page.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var token = "";
  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Response? loginApiResponse = await LoginApi.getLogin(email, password);
    if (loginApiResponse == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.red,
          title: Text(
            'Login Failed',
          ),
          content: Text('UserName or password is incorrect'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      var data = jsonDecode(loginApiResponse!.body);
      token = data['token'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return InputPage(token);
          },
        ),
      );
    }
    print('Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
