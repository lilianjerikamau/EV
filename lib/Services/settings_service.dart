import 'dart:convert';

import 'package:ev_app/models/reset_passwordmodel.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_settingsmodel.dart';
import '../utils/config.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SettingsService {
  BuildContext context;
  SettingsService(this.context);
  Future<UserSettingsModel> createSettings(String fuelUnits,
      String distanceUnits, String notificationPeriod, int id,String token) async {
    var result;

    Map<String, dynamic> settingsData = {
      "id":id,
      "fuelUnits": fuelUnits,
      "distanceUnits": distanceUnits,
      "notificationPeriod": notificationPeriod,

    };

    // if (kDebugMode) {
    print("started processing with payload $settingsData");
    // }
    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);
    Response response = await patch(
      Uri.parse(Endpoints.create_metrics),
      body: json.encode(settingsData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.body.toString());

    try {
      final  responseData = json.decode(response.body) as Map<String,dynamic>;
      if (response.statusCode == 200) {
        result = UserSettingsModel.fromJson(responseData);
        print(result);
      } else {
        result = UserSettingsModel(
          error_description: responseData['error_description'],
          error:responseData['error'],
        );
      }
    } on Exception {
      result = {'error': false, 'error_description': "Login error"};
    }
    return result;
  }
  Future<ResetPassModel> deleteUser(int id,String token) async {
    var result;

    Map<String, dynamic> settingsData = {

      "user": {"id": id
      }
    };

    // if (kDebugMode) {
    print("started processing with payload $settingsData");
    // }
    String clientCredentials =
        "${UserConstants.clientId}:${UserConstants.clientSecret}";
    List<int> bytes = utf8.encode(clientCredentials);
    final base64Credentials = base64Encode(bytes);
    Response response = await delete(
      Uri.parse(Endpoints.delete_user+id.toString()),
      body: json.encode(settingsData),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.body.toString());

    try {
      final  responseData = json.decode(response.body) as Map<String,dynamic>;
      if (response.statusCode == 200) {
        result = ResetPassModel.fromJson(responseData);
      } else {
        result = ResetPassModel(
          message: responseData['error_description'],
          status: 'success',
        );
      }
    } on Exception {
      result = {'status': false, 'message': "Login error"};
    }
    return result;
  }
}
