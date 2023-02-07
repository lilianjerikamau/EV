import 'dart:convert';

class LoginResponseModel{
  String access_token="",
      token_type="",
      refresh_token="",
      scope="",
      user_name="",
      authorities="",
      jti="",
      error="",
      error_description="Error,check your credentials",
      data="",
  fuel_units ='',
distance_units ='',
notification_period = '';
  int expires_in=0,
      iat=0,
      user_id=0;




  LoginResponseModel({ required this.access_token,
    required this.distance_units,
    required this.fuel_units,
    required this.notification_period,
    required this.token_type,
    required this.refresh_token,
    required this.scope,
    required this.user_name,
    required this.authorities,
    required this.jti,
    required this.error,
    required this.error_description,
    required  this.expires_in,
    required this.iat,
    required this.user_id,
    required this.data
  }
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> responseData) {
    return LoginResponseModel(
      notification_period:responseData['notification_period'] ,
        fuel_units: responseData['fuel_units'],
        distance_units: responseData['distance_units'],
        access_token: responseData['access_token'],
        token_type: responseData['token_type'],
        refresh_token: responseData['refresh_token'],
        scope: responseData['scope'],
        user_name: responseData['user_name'],
        authorities: responseData['authorities'],
        jti: responseData['jti'],
        error: responseData['error'],
        error_description : responseData["error_description"],
        expires_in:  responseData['expires_in'],
        iat:  responseData['iat'],
        data:json.encode( responseData['data']),
        user_id: responseData['user_id']);
  }
}