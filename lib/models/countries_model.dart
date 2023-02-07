import 'dart:convert';

class Countries{
String? name;
int? id;
bool? hasStates;


  Countries({ required this.name,required this.id,required this.hasStates
  }
      );

  factory Countries.fromJson(Map<String, dynamic> responseData) {
    return Countries(
      id: responseData['id'],
      name:  responseData['name'],
      hasStates: responseData['hasStates']
    );
  }

}