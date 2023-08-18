import 'package:flutter/material.dart';

class TextValue extends StatelessWidget {
  TextValue({
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

class TextHeading extends StatelessWidget {
  TextHeading({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }
}
