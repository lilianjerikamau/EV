import 'dart:convert';

class SoecsResponseModel{
  String? value;
      String? location="",
vehicle_id,
at_home,
state_id,
country_id,
message,
status,
 soec_value;


  SoecsResponseModel({  this.value, this.location, this.vehicle_id, this.at_home,  this.state_id, this.country_id, this.status, this.message, this.soec_value
  }
      );

  factory SoecsResponseModel.fromJson(Map<String, dynamic> responseData) {
    return SoecsResponseModel(
        value: responseData['value'],
        location:  responseData['location'],
        vehicle_id: responseData['vehicle_id'].toString(),
      at_home:  responseData['at_home'].toString(),
      state_id:  responseData['state_id'].toString(),
        country_id:responseData['country_id'].toString(),
      soec_value:responseData['soec_value'].toString(),
      status: responseData['status'],
      message: responseData['message'],

    );
  }

}