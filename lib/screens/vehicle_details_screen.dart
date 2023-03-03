import 'package:ev_app/screens/home_screen.dart';
import 'package:ev_app/screens/login_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen_two.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth_service.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  void initState() {
    getCountries();
    getToken();
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    _dateinput.text = formattedDate;
    // TODO: implement initState
    super.initState();
  }

  String? token;
  var items = [
    'LPG propelled',
    'LPG/liquid fuel',
    'electric/liquid fuel(hybrid)',
    'Fuel-petrol',
    'Fuel-disel',
  ];
  TextEditingController platenoController = TextEditingController();
  TextEditingController odometerreadingController = TextEditingController();
  TextEditingController accesstoken = TextEditingController();
  TextEditingController vehicleidentification_number = TextEditingController();
  TextEditingController countryofreg = TextEditingController();
  String? country95percenttime = "";
  var _selectedCountry = null;
  var _selectedCountryOne = null;
  var _selectedCountryTwo = null;
  var _selectedState = null;
  var _selectedStateOne = null;
  TextEditingController _dateinput = TextEditingController();
  var countries = [];
  var countries1 = [];
  var states = [];
  var states1 =[];
  var country_id = null;
  var country_id_one = null;
  var country_id_two = null;
  var states_id = null;
  var reg_state = null;
  bool hasState = false;
  bool hasState1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicle Details',
          style: TextStyle(color: Color(0xFF75A843)),
        ),
        iconTheme: IconThemeData(color: Color(0xFF75A843)),
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF75A843),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
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
            backgroundColor: Color(0xFF75A843).withOpacity(0.3),
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF75A843)),
            value: 0.5,
          ),
        ),
      ),
      body: Padding(
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
                          "Plate number ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                    TextField(
                      controller: platenoController,
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
                          "Vehicle Identification number ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                    TextField(
                      controller: vehicleidentification_number,
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
                          "Country of manufacturer ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                            _selectedCountryTwo = newValue;
                            country_id_two = _selectedCountryOne['id'];

                            print(country_id_one);
                            print(hasState);
                            print(_selectedCountryOne);
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
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Country of registration ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                            _selectedCountryOne = newValue;
                            country_id_one = _selectedCountryOne['id'];
                            hasState1 = _selectedCountryOne['hasStates'];
                            if(hasState1 == true){
                              setState(() {
                                getStates1();
                                hasState1 == true;
                              });

                            }else{
                              setState(() {
                                hasState1 == false;
                              });
                            }
                            print(country_id_one);
                            print(hasState);
                            print(_selectedCountryOne);
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
           hasState1 ==true?Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "State of registration ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                        items: states1.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val['name']),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStateOne = newValue;
                            reg_state = _selectedStateOne['id'];
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
              ):Container(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Date of registration ",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Color(0xFF75A843)),
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
                    TextField(
                      controller:
                          _dateinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          // hintText: 'User Name',
                          suffixIcon: Icon(
                            color: Color(0xFF75A843),
                            Icons.calendar_today,
                          ),
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            _dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
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
                            "Which country does the vehicle spend 95% of the time ?",
                            // overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Color(0xFF75A843)),
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
                        items: countries1.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val['name']),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCountry = newValue;
                            country_id = _selectedCountry['id'];
                            hasState = _selectedCountry['hasStates'];
                            if (hasState == true) {
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
                                "Which state does the vehicle spend 95% of the time?",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
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
                                _selectedState = newValue;
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
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Proceed   >',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehicleDetailsScreenTwo(
                                  access_token: accesstoken,
                                  vehicle_identification_number:
                                      vehicleidentification_number,
                                  country_of_reg: country_id_one,
                                  country_95_percent_time: country_id,
                                  states_id: states_id,
                                  country_id: country_id,
                              state_of_reg:reg_state,

                                )),
                      );
                      print(platenoController.text);
                      print(odometerreadingController.text);
                    },
                  )),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }

  Future<void> getToken() async {
    await AuthenticationServices(context).getUser().then((value) async => {
          setState(() {
            token = value.access_token;
          }),
        });
  }

  void getCountries() {
    AuthenticationServices authenticationServices =
        AuthenticationServices(context);
    authenticationServices.getCounytries().then((value) => {
          print('countriessssss'),
          setState(() {
            countries = value;
            countries1=value;
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
  void getStates1() {
    AuthenticationServices authenticationServices =
    AuthenticationServices(context);
    authenticationServices.getStates(country_id.toString()).then((value) => {
      print('statess'),
      setState(() {

        states1 =value;
      }),
      print(value[0]['id']),
    });
  }
}
