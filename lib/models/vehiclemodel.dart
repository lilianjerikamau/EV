// import 'package:json_annotation/json_annotation.dart';



// @JsonSerializable()
class Vehicle {
  Vehicle({
    this.id,
    this.regno,
    this.type,
    this.mileage,

  });

  int? id;
  String? regno;

  String? type;
  String? mileage;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
      id: json["id"],
      regno: json["regno"],

      type: json["type"],
      mileage: json["mileage"],

   );

  Map<String, dynamic> toJson() => {
    "id": id,
    "regno": regno,
    "type": type,

    "mileage": mileage,


  };
}



