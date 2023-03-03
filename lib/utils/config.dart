
import 'package:ev_app/screens/forgot_password_screen_two.dart';

class Endpoints {
  static const base="http://ev.glitexsolutions.co.ke/";
  static const baseURL="https://ev.glitexsolutions.co.ke/";
  static const register = "${baseURL}auth/driver";
  static const login = "${baseURL}auth/oauth/token";
  static const send_email = "${baseURL}auth/resetpass/email";
  static const reset_password = "${baseURL}auth/resetpass/reset/";
  static const validate_otp = "${base}auth/resetpass/resetmail/";
  static const me = "${baseURL}auth/user/me/";
  static const create_metrics = "${baseURL}/auth/usersettings";
  static const delete_user = "${baseURL}/auth/usersettings/";
  static const countries = "${baseURL}main/api/v1/countries/";
  static const states = "${baseURL}main/api/v1/states/?country__id=";
  static const create_vehicle = "${baseURL}main/api/v1/vehicles/";
  static const technologies = "${baseURL}main/api/v1/vehicle/technologies/";
  static const vehiclebrands = "${baseURL}main/api/v1/vehicle/brands/";
  static const vehiclemodels = "${baseURL}main/api/v1/vehicle/models/?vehicle_brand__id=";
  static const create_soecs = "${baseURL}main/api/v1/soecs/";
  static const create_sodo = "${baseURL}main/api/v1/sodo/";
  static const create_soda = "${baseURL}main/api/v1/soda/";
  static const get_vehicles = "${baseURL}main/api/v1/vehicles/?user_id=";
}

class UserConstants {
  static const mapsAPIKey = "AIzaSyBNoIHCJSsfOjP__oz2uIBit36xbCFyCL0";
  static const clientId = "mobile";
  static const clientSecret = r"qwertydybn$";
}