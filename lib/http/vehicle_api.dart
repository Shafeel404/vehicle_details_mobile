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
      VehicleDetailsResponse vehResponse = VehicleDetailsResponse();
      vehResponse.address =
          data['result']['extraction_output']['permanent_address'];
      vehResponse.ownerName = data['result']['extraction_output']['owner_name'];
      return vehResponse;
    } else {
      return null;
    }
  }
}
