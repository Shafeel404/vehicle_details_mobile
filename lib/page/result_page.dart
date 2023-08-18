import 'package:flutter/material.dart';
import 'package:vehicle_details/http/cat_api.dart';
import 'package:vehicle_details/http/vehicle_api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:vehicle_details/responses/vehicle_details_response.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultPage extends StatefulWidget {
  ResultPage(this.vehicleNumber);
  final vehicleNumber;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String vehicleData = '';
  String ownerName = '';
  String registrationNumber = '';
  bool isLoading = true;

  void _getVehicleDetail(String vehicleNumber) async {
    setState(() {
      isLoading = true;
    });
    CatApiResponse? apiResponse = await CatApi.getVehicleDetail(vehicleNumber);
    setState(() {
      vehicleData = apiResponse!.address;
      ownerName = apiResponse!.ownerName;
      registrationNumber = apiResponse!.registrationNumber;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _getVehicleDetail(widget.vehicleNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                            ownerName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              registrationNumber,
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
                    child: isLoading
                        ? SpinKitChasingDots(
                            color: Colors.black,
                            size: 104.0,
                          )
                        : Text(
                            vehicleData,
                            style: const TextStyle(color: Colors.black),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
