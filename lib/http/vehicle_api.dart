import 'package:http/http.dart' as http;
import 'package:vehicle_details/http/network_helper.dart';
import 'dart:convert';

import 'package:vehicle_details/responses/vehicle_details_response.dart';

import '../responses/new_vehicle_response.dart';

const api = 'https://rto-vehicle-details.p.rapidapi.com/';

class VehicleApi {
  static Future<NewVehicleDetailsResponse?> getVehicleDetail(
      String vehicleNumber) async {
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Content-Type": "application/json",
      "X-RapidAPI-Key": "417e5023a5msh610bb41036b9699p18606djsnfae6be1d4a76",
      "X-RapidAPI-Host": "rto-vehicle-details.p.rapidapi.com"
    };

    final Map<String, dynamic> requestBody = {"vehicleId": vehicleNumber};
    http.Response response = await http.post(Uri.parse(api),
        headers: headers, body: jsonEncode(requestBody));
    bool networkStatus = NetworkHelper(response).getData();
    if (networkStatus == true) {
      final data = jsonDecode(response.body);
      NewVehicleDetailsResponse vehResponse = NewVehicleDetailsResponse(
        vehicleId: data['vehicleId'] ?? " ",
        address: data['present_address'] ?? " ",
        ownerName: data['owner_name'] ?? " ",
        fatherName: data['father_name'] ?? " ",
        engineNumber: data['engine_number'] ?? " ",
        chassisNumber: data['chassis_number'] ?? " ",
        licensePlate: data['license_plate'] ?? " ",
        colour: data['color'] ?? " ",
        financier: data['financer'] ?? " ",
        fuelType: data['fuel_type'] ?? " ",
        insuranceName: data['insurance_company'] ?? " ",
        insurancePolicyNo: data['insurance_policy'] ?? " ",
        insuranceValidity: data['insurance_expiry'] ?? " ",
        isFinanced: data['is_financed'] ?? false,
        manufacturer: data['brand_name'] ?? " ",
        manufacturerModel: data['brand_model'] ?? " ",
        seatingCapacity: data['seating_capacity'] ?? " ",
      );

      return vehResponse;
    } else {
      return null;
    }
  }
}
