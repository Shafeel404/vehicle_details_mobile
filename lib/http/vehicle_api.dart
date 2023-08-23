import 'package:http/http.dart' as http;
import 'package:vehicle_details/http/network_helper.dart';
import 'dart:convert';

import 'package:vehicle_details/responses/vehicle_details_response.dart';

const api =
    'https://vehicle-rc-verification-advanced.p.rapidapi.com/v3/tasks/sync/verify_with_source/ind_rc_plus';

class VehicleApi {
  static Future<VehicleDetailsResponse?> getVehicleDetail(
      String vehicleNumber) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': '0838c2c7f1mshe07953868a5f11dp1b5845jsn4c24079ed00e',
      'X-RapidAPI-Host': 'vehicle-rc-verification-advanced.p.rapidapi.com',
    };

    final Map<String, dynamic> requestBody = {
      'task_id': '74f4c926-250c-43ca-9c53-453e87ceacd1',
      'group_id': '8e16424a-58fc-4ba4-ab20-5bc8e7c3c41e',
      'data': {'rc_number': vehicleNumber},
    };
    http.Response response = await http.post(Uri.parse(api),
        headers: headers, body: jsonEncode(requestBody));
    bool networkStatus = NetworkHelper(response).getData();
    if (networkStatus == true) {
      final data = jsonDecode(response.body);
      VehicleDetailsResponse vehResponse = VehicleDetailsResponse(
          address: data['result']['extraction_output']['permanent_address'],
          ownerName: data['result']['extraction_output']['owner_name'],
          fatherName: data['result']['extraction_output']['father_name'],
          engineNumber: data['result']['extraction_output']['engine_number'],
          chassisNumber: data['result']['extraction_output']['chassis_number'],
          registrationNumber: data['result']['extraction_output']
              ['registration_number'],
          colour: data['result']['extraction_output']['colour'],
          financier: data['result']['extraction_output']['financer'],
          fitnessUpTo: data['result']['extraction_output']['fitness_upto'],
          fuelType: data['result']['extraction_output']['fuel_type'],
          insuranceName: data['result']['extraction_output']['insurance_name'],
          insurancePolicyNo: data['result']['extraction_output']
              ['insurance_policy_no'],
          insuranceValidity: data['result']['extraction_output']
              ['insurance_validity'],
          isFinanced: data['result']['extraction_output']['is_financed'],
          manufacturer: data['result']['extraction_output']['manufacturer'],
          manufacturerModel: data['result']['extraction_output']
              ['manufacturer_model'],
          registeredPlace: data['result']['extraction_output']
              ['registered_place'],
          registrationDate: data['result']['extraction_output']
              ['registration_date'],
          seatingCapacity: data['result']['extraction_output']
              ['seating_capacity']);

      return vehResponse;
    } else {
      return null;
    }
  }
}
