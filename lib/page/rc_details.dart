import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vehicle_details/responses/cat_api_response.dart';

class rcDetails extends StatefulWidget {
  rcDetails(this.response);
  CatApiResponse response;
  @override
  State<rcDetails> createState() => _rcDetailsState();
}

class _rcDetailsState extends State<rcDetails> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.grey.shade900,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  margin: const EdgeInsets.all(30),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.response.ownerName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            widget.response.registrationNumber,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    widget.response.address,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
