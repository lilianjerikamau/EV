import 'dart:convert';
import 'package:ev_app/models/vehicle_responsemodel.dart';
import 'package:flutter/cupertino.dart';
import '../models/soecs_responsemodel.dart';
import '../utils/config.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SoecsService{
  BuildContext context;
  SoecsService(this.context);
  Future<SoecsResponseModel> createSoecs(
      String kwh_charged,
      String location,
      int vehicle_id,
      bool at_home,
      int  state_id,
      int country_id,
      // String message,
      // String status,

      ) async {
    var result;

    Map<String, dynamic>  vehicleDatas ={
      "value":kwh_charged,
      "location":location,
      "vehicle_id": vehicle_id!=null? vehicle_id.toString():null,
      "state_id": state_id!=null? state_id.toString():null,
      "at_home":at_home.toString(),
      "country_id": country_id!=null?country_id.toString():null,
      // "status":status

    };
    Map<String, dynamic>  vehicleDatas1 ={
      "value":kwh_charged,
      "location":location,
      "vehicle_id": vehicle_id!=null? vehicle_id.toString():null,

      "at_home":at_home.toString(),

      // "status":status

    };
    Map<String, dynamic>  vehicleDatas2 ={
      "value":kwh_charged,
      "location":location,
      "vehicle_id": vehicle_id!=null? vehicle_id.toString():null,
      "at_home":at_home.toString(),
      "country_id": country_id!=null?country_id.toString():null,
      // "status":status

    };
    var vehicleData= json.encode(vehicleDatas);
    Response response;
    print("started processing with payload $vehicleDatas");
    print("started processing with payload $vehicleDatas2");
    print("started processing with payload $vehicleDatas1");


    if(at_home == true){
response = await post(
        Uri.parse(Endpoints.create_soecs),
        body:vehicleDatas1,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          // 'Authorization': 'Basic $value'
        },
      );
print('vehicleDatas1');
print(vehicleDatas1);
    }else if(state_id !=null){
 response = await post(
        Uri.parse(Endpoints.create_soecs),
        body:vehicleDatas,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          // 'Authorization': 'Basic $value'
        },
      );
 print('vehicleDatas');
 print(vehicleDatas);
    }else{
 response = await post(
        Uri.parse(Endpoints.create_soecs),
        body:vehicleDatas2,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          // 'Authorization': 'Basic $value'
        },
      );
 print('vehicleDatas2');
 print(vehicleDatas2);
    };
    print('response ');
    print(response.body);
    try {
      final  responseData = json.decode(response.body) as Map<String,dynamic> ;
      print(responseData);
      if (response.statusCode == 200) {
        result = SoecsResponseModel.fromJson(responseData);
        print("response login");

      } else {
        result = SoecsResponseModel(
          location: responseData['location'],
          vehicle_id: responseData['vehicle_id'],
          at_home: responseData['at_home'],
          country_id: responseData['country_id'],
          state_id: responseData['state_id'],
          status: responseData['status'],
          value: responseData['value'],
          soec_value:responseData['soec_value'],
          message : "Error",
        );
      }
    } on Exception {
      result = {'status': false, 'message': "soecs error"};
    }
    print(result);
    return result;
  }



}