import 'dart:convert';
import 'package:ev_app/models/vehicle_responsemodel.dart';
import 'package:flutter/cupertino.dart';
import '../models/sodo_responsemodel.dart';
import '../models/soecs_responsemodel.dart';
import '../utils/config.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SodoService{
  BuildContext context;
  SodoService(this.context);
  Future<SodoResponseModel> createSodo(

 double OBECM ,
 double OBFCM,
 int vehicle_id,
 double odo_reading,
  String location,
  String state,
  String country, String fuel_units, String distance_units,


      ) async {
    var result;
final user_settings = {
  "fuelUnits":fuel_units,
  "distanceUnits":distance_units
};
    var vehicleDatas =  <String, dynamic>{
      "OBECM": "0.00",
      "OBFCM": "0.00",
      "vehicle_id": vehicle_id.toString(),
      "odo_reading": odo_reading.toString(),
      "location": "Back Shire",
      "state": "Washington",
      "country": "United States",
      "user_settings": user_settings
    };

    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);

    print("started processing with payload $vehicleDatas");

print(Endpoints.create_sodo);
    Response response = await post(
        Uri.parse(Endpoints.create_sodo),
        body:jsonEncode(vehicleDatas),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token'
      },
      );
    print(jsonEncode(vehicleDatas));
print("body");
    print(response.body.toString());
    print(response.statusCode);
    try {
      print('boddy');
      print(response.body);
      final  responseData = jsonDecode(response.body) as Map<String,dynamic>;
      print("responsedata");
      print(responseData);
      if (response.statusCode == 200) {
        print('200');
        result = SodoResponseModel.fromJson(responseData);
        print("response login");

      } else {
        print('not 200');
        result = SodoResponseModel(
          location:  responseData['location'],
          vehicle_id: responseData['vehicle_id'],
          OBECM:responseData['OBECM'],
          OBFCM:responseData['OBFCM'],
          odo_reading:responseData['odo_reading'],
          state:responseData['state'],
          country:responseData['country'],
          status:responseData['status'],
          message: responseData['message'].toString(),
          reg_no:responseData['vehicle']['vehicle_identification_number'],
          creation_time:responseData['creation_time'],
          sodo_percent:responseData['sodo_percentage'],

        );
      }

    } on Exception catch(e)  {
      print('exception issss$e');
      // result = {'status': "failed"};
    }
print(result);
    return result;

  }
  Future<SodoResponseModel> createSoda(

      double OBECM ,
      double OBFCM,
      int vehicle_id,
      double odo_reading,
      String location,
      String state,
      String country, String fuel_units, String distance_units,


      ) async {
    var result;
    final user_settings = {
      "fuelUnits":fuel_units,
      "distanceUnits":distance_units
    };
    var vehicleDatas =  <String, dynamic>{
      "OBECM": OBECM.toString(),
      "OBFCM": OBFCM.toString(),
      "vehicle_id": vehicle_id.toString(),
      "odo_reading": odo_reading.toString(),
      "location": "Back Shire",
      "state": "Washington",
      "country": "United States",
      "user_settings": user_settings
    };

    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);

    print("started processing with payload $vehicleDatas");

    print(Endpoints.create_sodo);
    Response response = await post(
      Uri.parse(Endpoints.create_soda),
      body:jsonEncode(vehicleDatas),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token'
      },
    );
    print(jsonEncode(vehicleDatas));
    print("body");
    print(response.body.toString());
    print(response.statusCode);
    try {
      print('boddy');
      print(response.body);
      final  responseData = jsonDecode(response.body) as Map<String,dynamic>;
      print("responsedata");
      print(responseData);
      if (response.statusCode == 200) {
        print('200');
        result = SodoResponseModel.fromJson(responseData);
        print("response login");

      } else {
        print('not 200');
        result = SodoResponseModel(
          location:  responseData['location'],
          vehicle_id: responseData['vehicle_id'],
          OBECM:responseData['OBECM'],
          OBFCM:responseData['OBFCM'],
          odo_reading:responseData['odo_reading'],
          embp: responseData["embp"],
          state:responseData['state'],
          country:responseData['country'],
          status:responseData['status'],
          message: responseData['message'].toString(),
          // reg_no:responseData['vehicle']['vehicle_identification_number'],
          creation_time:responseData['creation_time'],
          soda_percent:responseData['soda_percent'],
          pttwe: responseData["pttwe"],
          pusfse: responseData["pusfse"],
          tdp_percentage: responseData["tpd_percent"],
          bttwe: responseData["bttwe"],
          busfse: responseData["busfse"],
          btpei: responseData["btpei"],
          ltee: responseData["ltee"],
          pusese: responseData["pusese"],
          ptpei: responseData["ptpei"],
          lte: responseData["lte"],
          lter: responseData["lter"],
          vwwei: responseData["vwwei"],
          gps_location: responseData["gps_location"],
        );
      }

    } on Exception catch(e)  {
      print('exception issss$e');
      // result = {'status': "failed"};
    }
    print(result);
    return result;

  }
}