import 'package:flutter/material.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/converter/uppercase.dart';
import 'package:vehicle_details/page/result_page.dart';

import 'new.dart';

class InputPage extends StatefulWidget {
  InputPage(this.token);
  String token;
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  String? vehicleNumber;
  bool isButtonEnabled = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: kInputPageDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(0.0, -0.5),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24, // Adjust the font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust the font weight as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      maxLength: 12,
                      decoration: InputDecoration(
                        hintText: 'Enter vehicle Number ',
                        icon: kCarIcon,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          vehicleNumber = value;
                          isButtonEnabled = value.isNotEmpty;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: isButtonEnabled
                            ? () {
                                if (FocusScope.of(context).hasFocus) {
                                  FocusScope.of(context).unfocus();
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NewPage(vehicleNumber);
                                    },
                                  ),
                                );
                              }
                            : null,
                        child: const Text(
                          'Go',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
