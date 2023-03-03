import 'package:ev_app/screens/home_screen.dart';
import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/personal_details_screen.dart';
import 'package:ev_app/screens/process_image.dart';
import 'package:ev_app/screens/process_image_two.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/technology_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
List<CameraDescription> cameras = [];
String long = "", country="",state="", lat = "",location ="";

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('CameraError: ${e.description}');
  }
  runApp(MyApp());
}
bool servicestatus = false;
bool haspermission = false;
late LocationPermission permission;
late Position position;

late StreamSubscription<Position> positionStream;
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }
      if (haspermission) {

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        GetAddressFromLatLong();
      });
    });
  }
  Future<void> GetAddressFromLatLong()async {
    List<Placemark> placemarks = await placemarkFromCoordinates(double.parse(lat), double.parse(long));
    print('placemarks');
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      country =place.country!;
      state = place.locality!;
      location =place.street!;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    checkGps();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme:  ColorScheme.fromSwatch().copyWith(
          primary:const Color(0xFF75A843)
      ),
      ),
        home: StartScreen(),
    );
  }
}
