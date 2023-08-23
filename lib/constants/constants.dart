import 'package:flutter/material.dart';

const kInputPageDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/wallpaperCar.jpg'),
    fit: BoxFit.cover,
  ),
);

const kTextStyle =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);

const kCarIcon = Padding(
  padding: EdgeInsets.only(left: 10),
  child: Icon(
    Icons.directions_car,
    color: Colors.white,
  ),
);

const kMailIcon = Padding(
  padding: EdgeInsets.only(left: 10),
  child: Icon(
    Icons.mail,
    color: Colors.white,
  ),
);

const kNameIcon = Padding(
  padding: EdgeInsets.only(left: 10),
  child: Icon(
    Icons.person,
    color: Colors.white,
  ),
);

const kPasswordIcon = Padding(
  padding: EdgeInsets.only(left: 10),
  child: Icon(
    Icons.lock,
    color: Colors.white,
  ),
);

const kDivider = Divider(color: Color(0xFFd6d6d6), thickness: 2);

var kAlertBoxContainer = BoxDecoration(
  border: Border.all(color: Colors.black, width: 2.0), // Add border
  borderRadius: BorderRadius.circular(10.0), // Add border radius
  color: Colors.white.withOpacity(0.8), // Add opacity
);
