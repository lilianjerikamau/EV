import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:ev_app/screens/forgot_password_screen.dart';
import 'package:ev_app/screens/forgot_password_screen_two.dart';
import 'package:ev_app/screens/login_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen_two.dart';
import 'package:ev_app/screens/welcome_back_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http_parser/http_parser.dart';

import '../Services/auth_service.dart';
import '../models/user_details.dart';
import '../utils/config.dart';
import 'package:geolocator/geolocator.dart';
class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _formKey1 = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  double value = 0;
  late var image;
  var form;
  File? imageFile;
  String? path;
  var items1 = ['Yes','No'
  ];
  var items2 = ['None',
    'Reporting',
    'A6.4',
    'VCS',
    'GS',
    'GCC',
    'ACR',
    'Other'
  ];
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  var countries = [];
  var states = [];
  var country_id = null;
  var states_id = null;
  bool hasState = false;
  String? _selectedSolarValue = null;
  String? _country = "";
  String? _coutrydisplay = "";
  String? _coutryCode = "";
  String? _selectedInvolvmentValue = null;
  var _selectedCountry = null;
  var _selectedState = null;
  bool selectedSolarValue = false;
  bool selectedInvolvmentValue = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getCountries();
    image = null;
    super.initState();
  }
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
        setState(() {
          //refresh the UI
        });
        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
    setState(() {
      //refresh the UI
    });
  }


  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    // setState(() {
    //   //refresh UI
    // });

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

      // setState(() {
      //refresh UI on updat
      // });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Details',
          style: TextStyle(color: Colors.green),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(
              backgroundColor: Colors.green.withOpacity(0.3),
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              value: value),
        ),
      ),
      body: Form(
        key: _formKey1,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "First Name",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          setState(() {
                            value = 0.2;
                          });
                        },
                        validator: (value) =>
                            value!.isEmpty ? "This field is required" : null,
                        controller: nameController,
                        decoration: const InputDecoration(
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Last Name",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "This field is required" : null,
                        controller: lnameController,
                        decoration: const InputDecoration(
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Password",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "This field is required" : null,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Country of Residence",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          items: countries.map((val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(val['name']),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                              setState(() {
                                value = 0.9;
                                _selectedCountry = newValue ;
                                country_id = _selectedCountry['id'];
                                hasState = _selectedCountry['hasStates'];
                                if (hasState == true)
                                {
                                  getStates();
                                }
                                print(country_id);
                                print(hasState);
                                print(_selectedCountry);
                              });
                          },
                          // value: items,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            border: OutlineInputBorder(),
                            // filled: true,
                            // fillColor: Colors.grey[200],
                          )),
                    ],
                  ),
                ),
                hasState == true
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "State",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.green),
                                ),
                                Text(
                                  "*",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.red),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField(
                                items: states.map((val) {
                                  return new DropdownMenuItem(
                                    value: val,
                                    child: Text(val['name']),
                                  );
                                }).toList(),
                                onChanged: (newValue) {

                                  _selectedState =newValue;
                                  states_id = _selectedState['id'];

                                },
                                // value: items,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  border: OutlineInputBorder(),
                                  // filled: true,
                                  // fillColor: Colors.grey[200],
                                )),
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Phone",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "This field is required" : null,
                        onChanged: (text) {
                          setState(() {
                            value = 0.8;
                          });
                        },
                        controller: phoneController,
                        decoration: InputDecoration(
                            hintText: _coutryCode,
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Do you have rooftop solar greater than 3 KW at home?",
                              // overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.green),
                            ),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          items: items1.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            onChanged:
                            (text) {
                              setState(() {
                                value = 0.9;
                              });
                            };
                            _selectedSolarValue = newValue;
                            if (_selectedSolarValue!.contains("Yes")) {
                              setState(() {
                                print(_selectedSolarValue);
                                selectedSolarValue = true;
                              });
                            } else {
                              setState(() {
                                selectedSolarValue = false;
                              });
                            }
                          },
                          // value: items,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            border: OutlineInputBorder(),
                            // filled: true,
                            // fillColor: Colors.grey[200],
                          )),
                    ],
                  ),
                ),
                selectedSolarValue == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.photo_album_outlined,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                onPressed: () async {
                                  image = (await picker.pickImage(
                                      source: ImageSource.gallery))!;
                                  setState(() {
                                    imageFile = File(image.path);
                                    path = File(image.path).toString();
                                  });
                                },
                              ),
                            ),
                            imageFile != null
                                ? Expanded(
                                    child: Text(File(image.path).toString()))
                                : Expanded(child: Text('Attach Evidence'))
                          ])
                    : Container(),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Involvement in carbon accounting/reporting",
                              // overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.green),
                            ),
                          ),
                          Text(
                            "*",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          items: items2.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            onChanged:
                            (text) {
                              setState(() {
                                value = 1.0;
                              });
                            };
                            _selectedInvolvmentValue = newValue;
                          },
                          // value: items,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            border: OutlineInputBorder(),
                            // filled: true,
                            // fillColor: Colors.grey[200],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Proceed   >',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          String phone = phoneController.text.trim();
                          String lastname = lnameController.text.trim();
                          String name = nameController.text.trim();
                          String location = locationController.text.trim();
                          String password = passwordController.text.trim();

                          form = _formKey1.currentState;
                          if (form.validate()) {
                            ProgressDialog dial = new ProgressDialog(context,
                                type: ProgressDialogType.Normal);

                            dial.show();
                            dial.style(
                              progressWidget: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator()),
                              backgroundColor: Colors.white,
                              messageTextStyle: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                              message: 'Please wait',
                            );
                            AuthenticationServices authenticationServices =
                                AuthenticationServices(context);
                            authenticationServices
                                .register(
                                  name,
                                  name,
                                  name,
                                  lastname,
                                  image != null ? image : null,
                                  "idno1",
                                  password,
                                  phone,
                                  lat,
                                  long,
                                  location,
                                  // "1@gmail.com",
                                  country_id,
                                  states_id,
                                  _selectedInvolvmentValue!,
                                  selectedSolarValue,
                                )
                                .then((value) => {
                                      if (selectedSolarValue == true)
                                        {
                                          if (image != null)
                                            {
                                              if (value.statusCode == 200)
                                                {
                                                  dial.hide(),
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        "Account created successfully"),
                                                    duration:
                                                        Duration(seconds: 3),
                                                  )),
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()),
                                                  )
                                                }
                                              else
                                                {
                                                  dial.hide(),
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content: Text(value.body),
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ))
                                                }
                                            }
                                          else
                                            {
                                              dial.hide(),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content:
                                                    Text('Attach evidence'),
                                                duration: Duration(seconds: 3),
                                              ))
                                            }
                                        }
                                      else
                                        {
                                          if (value.statusCode == 200)
                                            {
                                              dial.hide(),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                    "Account created successfully"),
                                                duration: Duration(seconds: 3),
                                              )),
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                              )
                                            }
                                          else
                                            {
                                              dial.hide(),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(value.body),
                                                duration: Duration(seconds: 3),
                                              ))
                                            }
                                        }
                                    });

                            print(nameController.text);
                            print(passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                  "Ensure all mandatory fields are filled"),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        },
                      )),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            )),
      ),
    );
  }

  void getCountries() {
    AuthenticationServices authenticationServices =
        AuthenticationServices(context);
    authenticationServices.getCounytries().then((value) => {
          print('countriessssss'),
          setState(() {
            countries = value;

          }),

        });
  }

  void getStates() {
    AuthenticationServices authenticationServices =
        AuthenticationServices(context);
    authenticationServices.getStates(country_id.toString()).then((value) => {
          print('statess'),
          setState(() {
            states = value;

          }),
          print(value[0]['id']),
        });
  }
  // void showAlertDialog(BuildContext context, String s) {}
}
