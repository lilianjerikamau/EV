class UserSettingsModel{

 String error ='',
  error_description ='';
  UserSettingsModel({    required this.error_description,  required this.error
  });

  factory UserSettingsModel.fromJson(Map<String, dynamic> responseData) {
    return UserSettingsModel(
      error: responseData['error'],
      error_description: responseData['error_description'],

    );
  }
}