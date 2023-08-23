import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:vehicle_details/responses/vehicle_details_response.dart';

class ReuseFlexibleSpaceBar extends StatelessWidget {
  ReuseFlexibleSpaceBar({required this.res});

  CatApiResponse res;
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        background: Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        margin: EdgeInsets.fromLTRB(30, 90, 30, 60),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              res.ownerName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                res.registrationNumber,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
