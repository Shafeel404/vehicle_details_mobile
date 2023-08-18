import 'dart:convert';

import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:http/http.dart' as http;

import 'network_helper.dart';

const api = 'https://dev-b246hpeah0ro45c.api.raw-labs.com/vehicle-api';

class CatApi {
  static Future<CatApiResponse?> getVehicleDetail(String vehicleNumber) async {
    http.Response response = await http.get(
      Uri.parse(api),
    );
    bool networkStatus = NetworkHelper(response).getData();
    if (networkStatus == true) {
      final data = jsonDecode(response.body);
      CatApiResponse vehResponse = CatApiResponse(
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
