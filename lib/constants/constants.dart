import 'package:flutter/material.dart';

const kInputPageDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/wallpaperCar.jpg'),
    fit: BoxFit.cover,
  ),
);

const kTextStyle =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);

const kIcon = Padding(
  padding: EdgeInsets.only(left: 10),
  child: Icon(
    Icons.directions_car,
    color: Colors.white,
  ),
);

const kDivider = Divider(color: Color(0xFFd6d6d6), thickness: 2);
