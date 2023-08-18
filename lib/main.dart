import 'package:flutter/material.dart';
import 'package:vehicle_details/page/input_page.dart';
import 'package:vehicle_details/page/login_page.dart';
import '';

void main() {
  runApp(const vehicleInfo());
}

class vehicleInfo extends StatefulWidget {
  const vehicleInfo({super.key});

  @override
  State<vehicleInfo> createState() => _vehicleInfoState();
}

class _vehicleInfoState extends State<vehicleInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
