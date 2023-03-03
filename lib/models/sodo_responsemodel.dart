import 'dart:convert';

class SodoResponseModel {
  String? OBECM;
  String? OBFCM;
  String? vehicle_id;
 var odo_reading;
  String? location;
  String? state;
  String? country;
  String? status;
  String? message;
  String? user_settings;

  var sodo_percent;

  var reg_no;

  var creation_time;

  var soda_percent;

  var pttwe;

  var pusfse;

  var embp;

  var bttwe;

  var busfse;

  var btpei;

  var ltee;

  var pusese;

  var ptpei;

  var lte;

  var lter;

  var vwwei;

  var tdp_percentage;

  var sodo_percentage;

  var gps_location;
  SodoResponseModel(
      {this.OBECM,
      this.OBFCM,
      this.vehicle_id,
      this.odo_reading,
      this.location,
      this.state,
      this.country,
      this.status,
      this.message,
      this.user_settings,
      this.sodo_percent,
      this.reg_no,
      this.creation_time,
      this.soda_percent,
      this.pttwe,
      this.pusfse,
      this.embp,
      this.bttwe,
      this.busfse,
      this.btpei,
      this.ltee,
      this.pusese,
      this.ptpei,
      this.lte,
      this.lter,
      this.vwwei,
      this.tdp_percentage,
      this.sodo_percentage,
      this.gps_location});
  factory SodoResponseModel.fromJson(Map<String, dynamic> responseData) {
    return SodoResponseModel(
        location: responseData['location'],
        vehicle_id: responseData['vehicle_id'].toString(),
        OBECM: responseData['OBECM'],
        OBFCM: responseData['OBFCM'],
        odo_reading: responseData['odo_reading'],
        state: responseData['state'],
        country: responseData['country'],
        status: responseData['status'],
        message: responseData['message'],
        reg_no: responseData['vehicle']['vehicle_identification_number'],
        sodo_percent: responseData['sodo_percentage'],
        soda_percent: responseData['soda_percent'],
        creation_time: responseData['creation_time'],
        pttwe: responseData["pttwe"],
        pusfse: responseData["pusfse"],
        embp: responseData["embp"],
        bttwe: responseData["bttwe"],
        busfse: responseData["busfse"],
        btpei: responseData["btpei"],
        ltee: responseData["ltee"],
        pusese: responseData["pusese"],
        ptpei: responseData["ptpei"],
        lte: responseData["lte"],
        lter: responseData["lter"],
        vwwei: responseData["vwwei"],
        tdp_percentage: responseData["tpd_percent"],
        sodo_percentage: responseData["sodo_percentage"],
        gps_location: responseData["gps_location"],
        user_settings: responseData['user_settings'].toString());
  }
}
