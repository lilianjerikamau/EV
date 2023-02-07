import 'dart:convert';

class ResetPassModel{
  String status="",
      message="";

  ResetPassModel({ required this.message,
    required this.status,
  }
      );

  factory ResetPassModel.fromJson(Map<String, dynamic> responseData) {
    return ResetPassModel(
        message: responseData['message'],
        status: responseData['status'],
      );
  }

}