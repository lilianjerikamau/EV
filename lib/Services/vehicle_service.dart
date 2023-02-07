import 'dart:convert';

import 'package:ev_app/models/vehicle_responsemodel.dart';
import 'package:flutter/cupertino.dart';

import '../utils/config.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
class VehicleService{
  BuildContext context;
  VehicleService(this.context);
  Future<VehicleResponseModel> createVehicle(
      String access_token,
      String vehicle_identification_number,
  String fuel_type,
      String vehicle_type,
  String  vehicle_usage,
      String odo_reading_at_reg,
  int  country_of_reg,
      int country_95_percent_time,
  int  vehicle_technology,
      int state_95_percent_time,
  int user_id,
  int veh_model,
      int state_of_reg,
  ) async {
    var result;

    final vehicleData = <String, dynamic> {
    "access_token":access_token,
    "vehicle_identification_number":vehicle_identification_number,
    "vehicle_type":vehicle_type,
    "vehicle_usage":vehicle_usage,
    "odo_reading_at_reg":odo_reading_at_reg,
    "country_of_reg":country_of_reg.toString(),
    "country_95_percent_time":country_95_percent_time.toString(),
    "vehicle_technology":vehicle_technology.toString(),
    "state_95_percent_time":state_95_percent_time.toString(),
"user_id":user_id.toString(),
      "vehicle_model":veh_model.toString(),
      "state_of_reg":state_of_reg.toString()
    };
    final vehicleData1 = <String, dynamic> {
      "access_token":access_token,
      "vehicle_identification_number":vehicle_identification_number,
      "fuel_type":fuel_type,
      "vehicle_type":vehicle_type,
      "vehicle_usage":vehicle_usage,
      "odo_reading_at_reg":odo_reading_at_reg,
      "country_of_reg":country_of_reg.toString(),
      "country_95_percent_time":country_95_percent_time.toString(),
      "vehicle_technology":vehicle_technology.toString(),
      "state_95_percent_time":state_95_percent_time.toString(),
      "user_id":user_id.toString(),
      "vehicle_model":veh_model.toString(),
      "state_of_reg":state_of_reg.toString()
    };
    print("started processing with payload $vehicleData");

    Response response = await post(
      Uri.parse(Endpoints.create_vehicle),
      body: fuel_type!="" || fuel_type!=null?vehicleData1:vehicleData,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic $access_token'
      },
    );
    print(response.body.toString());
    try {
      final  responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = VehicleResponseModel.fromJson(responseData);
        print("response login");
        print(responseData);
      } else {
        result = VehicleResponseModel(
          user_id:  responseData['user_id'],
            vehicle_identification_number: responseData['vehicle_identification_number'],
            fuel_type: responseData['fuel_type'],
          vehicle_usage: responseData['vehicle_usage'],
          odo_reading_at_reg: responseData['odo_reading_at_reg'],
          country_of_reg: responseData['country_of_reg'],
          country_95_percent_time: responseData['country_95_percent_time'],
          vehicle_technology : responseData["vehicle_technology"],
          vehicle_type: responseData['vehicle_type'],
          status: responseData['status'],
          message : "Error",
          state_95_percent_time: responseData['state_95_percent_time'],
          vehicle_model:responseData['vehicle_model'],
          state_of_reg:responseData['state_of_ref'],

        );
      }
    } on Exception {
      result = {'status': false, 'message': "error"};
    }
    print(result);
    return result;
  }
  Future getTechnologies() async {
    List<dynamic> result= [];
    String url = Endpoints.technologies;
    print(url);
    http.Response response = await await http.get(Uri.parse(url));
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // print('countriesssss');
        // print(responseData['results']);
        result = responseData['results'];

      } else {
        // result = Countries(
        //     // country_results: [Countries]
        // );
      }
    } on Exception {
      // result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future getVehicleBrand() async {
    List<dynamic> result= [];
    String url = Endpoints.vehiclebrands;
    print(url);
    http.Response response = await await http.get(Uri.parse(url));
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // print('countriesssss');
        // print(responseData['results']);
        result = responseData['results'];

      } else {
        // result = Countries(
        //     // country_results: [Countries]
        // );
      }
    } on Exception {
      // result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future getVehicleModel(int vehicle_brand_id) async {
    List<dynamic> result= [];
    String url = Endpoints.vehiclemodels+vehicle_brand_id.toString();
    print(url);
    http.Response response = await await http.get(Uri.parse(url));
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // print('countriesssss');
        // print(responseData['results']);
        result = responseData['results'];

      } else {
        // result = Countries(
        //     // country_results: [Countries]
        // );
      }
    } on Exception {
      // result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  getVehicles(int user_id) async {
    List<dynamic> result= [];
    String url = Endpoints.get_vehicles+user_id.toString();
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // print('countriesssss');
        // print(responseData['results']);
        result = responseData['results'];

      } else {
        // result = Countries(
        //     // country_results: [Countries]
        // );
      }
    } on Exception {
      // result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
}