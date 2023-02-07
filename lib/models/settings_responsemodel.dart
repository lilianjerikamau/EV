import 'dart:convert';

class SettingsResponseModel{
  String status="",
      message="";

  SettingsResponseModel({ required this.message,
    required this.status,
  }
      );

  factory SettingsResponseModel.fromJson(Map<String, dynamic> responseData) {
    return SettingsResponseModel(
      message: responseData['error_description'],
      status: responseData['status'],
    );
  }

}