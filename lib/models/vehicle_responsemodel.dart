
import 'dart:convert';

class VehicleResponseModel{
  String vehicle_identification_number="",
      status="",
      message="Error",
      fuel_type="",
      vehicle_type="",
      vehicle_model="",
      vehicle_usage="",
      odo_reading_at_reg="",
      country_of_reg="",
      country_95_percent_time="",
      vehicle_technology="",
  state_of_reg="",
      state_95_percent_time="";

  int user_id=0;
  VehicleResponseModel({
  required this.vehicle_identification_number,
  required this.fuel_type,
  required this.vehicle_type,
  required this.vehicle_usage,
  required this.odo_reading_at_reg,
  required this.country_of_reg,
  required this.country_95_percent_time,
  required this.vehicle_technology,
  required  this.user_id,
    required this.status,
    required this.message,
  required this.state_95_percent_time,
    required this.vehicle_model,
    required this.state_of_reg
  });

  factory VehicleResponseModel.fromJson(Map<dynamic, dynamic> responseData) {
    return VehicleResponseModel(
        vehicle_identification_number: responseData['vehicle_identification_number'],
        fuel_type: responseData['fuel_type'],
        vehicle_type: responseData['vehicle_type'],
        vehicle_usage: responseData['vehicle_usage'],
        odo_reading_at_reg: responseData['odo_reading_at_reg'],
        country_of_reg: responseData['country_of_reg']['id'].toString(),
        country_95_percent_time: responseData['country_95_percent_time']['id'].toString(),
        vehicle_technology : responseData["vehicle_technology"]['id'].toString(),
        user_id:  responseData['user_id'],
        state_95_percent_time:responseData['state_95_percent_time']['id'].toString(),
      status: responseData['status'],
      message : responseData["message"],
      vehicle_model:responseData['vehicle_type'],
        state_of_reg: responseData['state_of_reg'].toString()
    );
  }
}