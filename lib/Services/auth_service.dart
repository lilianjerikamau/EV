import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/welcome_back_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/countries_model.dart';
import '../models/login_responsemodel.dart';
import '../models/reset_passwordmodel.dart';
import '../models/user_details.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

import '../utils/config.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthenticationServices {
  String? otp;
  BuildContext context;
  getOtp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
   otp = prefs.getString('otp');
    return otp;
  }
  AuthenticationServices(this.context);
  Future<http.Response> register(
      String name,
      String fname,
      String mname,
      String lname,
      XFile imgs,
      String idNo,
      String password,
      String phone,
      String lat,
      String long,
  String location,
  int countryId ,
  int stateId,
  // String email,

      String selectedInvolvmentValue,
      bool selectedSolarValue) async {
    List<http.MultipartFile> formData = [];

    var request = http.MultipartRequest('POST', Uri.parse(Endpoints.register));

    final data = <String, dynamic>{
      "email": name,
      "phone": phone,
      "password": password,
      "username": name,
      "firstName": fname,
      "lastName": lname,
      "middleName": mname,
      "identificationNumber": idNo,
      "identificationType": "HUDUMA_NO",
      "homeLocation": {"lat": lat, "lon": long, "name": location},
      "involvementInCarbonReporting": selectedInvolvmentValue,
      "homeRoofTopSolarGreaterThan3kw": selectedSolarValue,
      "userSettings": {
            "fuelUnits": "Litres",
        "distanceUnits": "km",
        "notificationPeriod": "MONTHLY"
      },
      "countryId" : countryId,
      "stateId" : stateId,
    };
    print("the request us $data");
    request.files.add(http.MultipartFile.fromBytes(
        "user_data", utf8.encode(jsonEncode(data)),
        contentType: MediaType("application", "json")));
if(imgs!=null) {
  var photo =
  await http.MultipartFile.fromPath("files_solar_3kw", imgs.path);
  if (!photo.isFinalized) {
    request.files.add(photo);
  }
}
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });
    final response = await request.send();
    var responced = await http.Response.fromStream(response);
    print("he responce is ${responced.body}");

    return responced;
  }
  Future<LoginResponseModel> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      "username": email,
      "password": password,
      "grant_type": "password"
    };

    // if (kDebugMode) {
      print("started processing with payload $loginData");
    // }
    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);
    Response response = await post(
      Uri.parse(Endpoints.login),
      body: loginData,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic $base64Credentials'
      },
    );
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = LoginResponseModel.fromJson(responseData);
        print("response login");
        // print(responseData[]);
      } else {
        result = LoginResponseModel(
            access_token: responseData['access_token'],
            token_type: responseData['token_type'],
            refresh_token: responseData['refresh_token'],
            scope: responseData['scope'],
            user_name: responseData['user_name'],
            authorities:responseData['authorities'],
            jti: responseData['jti'],
            error: responseData['error'],
            error_description: responseData["error_description"],
            expires_in: 0,
            iat: 0,
            data: '',
            user_id: 0, distance_units: responseData["distance_units"], fuel_units: responseData["fuel_units"], notification_period:responseData['notification_period']);
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }

  Future<void> saveUser(LoginResponseModel responseModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("access_token", responseModel.access_token);
    prefs.setString("authorities", responseModel.authorities);
    prefs.setString("user_name", responseModel.user_name);
    prefs.setString("scope", responseModel.scope);
    prefs.setString("token_type", responseModel.token_type);
    prefs.setInt("user_id", responseModel.user_id);
    prefs.setString("refresh_token", responseModel.refresh_token);
    prefs.setString("jti", responseModel.jti);
    prefs.setString("data", responseModel.data);
    print("data");
    print(responseModel.user_name);
    // prefs.setString('fuel_units', responseModel.fuel_units);
    // prefs.setString('distance_units', responseModel.distance_units);
    // prefs.setString('notification_period', responseModel.notification_period);
    prefs.commit();
  }
  Future<bool> userExists() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('access_token');
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("access_token");
    prefs.remove("authorities");
    prefs.remove("user_name");
    prefs.remove("scope");
    prefs.remove("token_type");
    prefs.remove("user_id");
    prefs.remove("refresh_token");
    prefs.remove("jti");
    prefs.remove("data");


    prefs.commit();
  }
  Future<LoginResponseModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? access_token = prefs.getString("access_token");
    String? authorities = prefs.getString("authorities");
    String? user_name = prefs.getString("user_name");
    String? scope = prefs.getString("scope");
    String? token_type = prefs.getString("token_type");
    String? distance_units = prefs.getString("distance_units");
    String? fuel_units = prefs.getString("fuel_units");
    String? notification_period = prefs.getString("notification_period");
    int? user_id = prefs.getInt("user_id");
    String? refresh_token = prefs.getString("refresh_token");
    String? jti = prefs.getString("jti");
    String? data = prefs.getString("data");
    if(data==null)
    {
      removeUser();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
            const StartScreen(),
          ),(route) => false
      );
    }
    return LoginResponseModel(
        access_token: access_token!,
        token_type: token_type!,
        refresh_token: refresh_token!,
        scope: scope!,
        user_name: user_name!,
        authorities: authorities!,
        jti: jti!,
        error: '',
        error_description: '',
        expires_in: 0,
        iat: 0,
        data: data!,
        user_id: user_id!, distance_units: '', fuel_units:'', notification_period: '');
  }
  Future<UserDetails> getUserDetails() async {
    var result;

    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);
    LoginResponseModel loginResponseModel = await getUser();
    Response response = await get(
      Uri.parse(Endpoints.me),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.access_token}'
      },
    );
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = UserDetails.fromJson(responseData);
        print(result);
      } else {
        result = UserDetails(
            firstName: 'firstName',
            middleName: 'middleName',
            lastName: 'lastName',
            username: 'username',
            phone: 'phone',
            email: 'email',
            userType: 'userType',
            identificationType: 'identificationType',
            identificationNumber: 'identificationNumber',
            id: 0,
            enabled: false,
            accountNonExpired: false,
            accountNonLocked: false,
            credentialsNonExpired: false,
            fuelUnits:'fuelUnits',
            distanceUnits:'distanceUnits',
            notificationPeriod:'notificationPeriod',
            user_settings: {
              "fuelUnits": ["fuelUnits"],
              "distanceUnits": ['distanceUnits'],
              "notificationPeriod": ["notificationPeriod"]
            }
            // identificationMedias: [],
            // roles: []
        );
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future<ResetPassModel> sendEmail(String email) async {
    var result;
    final data = <String, dynamic>{
      "email": email,
      "type": "MOBILE",
    };
    Uri url = Uri.parse(Endpoints.send_email);
    print(url);
    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);
    final response = await http.post(url,

      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic $base64Credentials'
      },
    );
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = ResetPassModel.fromJson(responseData);
      } else {
        result = ResetPassModel(
            message: responseData['message'],
            status: responseData['status'],
            );
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future<ResetPassModel> resetPassword(String email,String otp,String newPassword) async {
    var result;
    final data = <String, dynamic>{
      "email": email,
      "type": "MOBILE",
      "password":newPassword
    };
    getOtp();
    print("otp is"+otp!);
    Uri url = Uri.parse(Endpoints.reset_password+otp);
    print(url);
    final response = await http.post(url,

      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        // 'Authorization': 'Basic $base64Credentials'
      },
    );
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = ResetPassModel.fromJson(responseData);
      } else {
        result = ResetPassModel(
          message: responseData['message'],
          status: responseData['status'],
        );
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future<ResetPassModel> validateOTP(String email, String otp) async {
    var result;


    String url = Endpoints.validate_otp+otp+"?"+"email="+email+"&type=MOBILE";
    print(url);
    http.Response response = await await http.get(Uri.parse(url));
    print(response.body.toString());

    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        result = ResetPassModel.fromJson(responseData);
      } else {
        result = ResetPassModel(
          message: responseData['message'],
          status: responseData['status'],
        );
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
  Future getCounytries() async {
    List<dynamic> result= [];
    String url = Endpoints.countries;
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
  Future getStates(String? country_id) async {
    List<dynamic> result= [];
    String url = Endpoints.states+country_id!;
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
}
