import 'package:ev_app/Services/vehicle_service.dart';
import 'package:ev_app/screens/vehicle_details_screen.dart';
import 'package:ev_app/screens/vehicle_list_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../Services/auth_service.dart';

class VehicleDetailsScreenTwo extends StatefulWidget {
  final country_id;
  final states_id;
  final access_token;
  final vehicle_identification_number;
  final country_of_reg;
  final country_95_percent_time;
  final state_of_reg;
  VehicleDetailsScreenTwo(
      {Key? key,
      required this.states_id,
      required this.country_id,
      required this.access_token,
      required this.vehicle_identification_number,
      required this.country_of_reg,
      required this.country_95_percent_time,
        required this.state_of_reg
      })
      : super(key: key);

  @override
  State<VehicleDetailsScreenTwo> createState() =>
      _VehicleDetailsScreenTwoState();
}

class _VehicleDetailsScreenTwoState extends State<VehicleDetailsScreenTwo> {
  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    _dateinput.text = formattedDate;
    // TODO: implement initState
    getUserDetails();
    getTechnology();
    getVehicleBrand();

    super.initState();
  }

  var vehicle_brand_id = null;
  var vehicle_model_id = null;
  int? id = null;
  var items = [
    'LPG propelled',
    'LPG/liquid fuel',
    'electric/liquid fuel(hybrid)',
    'Fuel-petrol',
    'Fuel-disel',
  ];
  var fuel_types = [
    'diesel',
    'gasoline',
  ];
  var vehicle_types = [
    'sedan',
    'coup',
    'standard SUV',
    'large SUV',
    'passenger Van',
    'delivery Van',
    'shuttle Van',
    'pickup truck',
    'tow truck',
    'utility truck',
    'school bus',
    'city bus',
    'sub-urban bus',
    'semi, dump truck',
    'golf cart',
    'hotel luggage cart',
    'airport luggage cart',
    'three wheeler',
    'quadricycle',
  ];
  var vehicle_usage = [
    'commercial/sharing',
    'corporate',
    'private only',

  ];
  var countries = [];
  var states = [];
  var technologies = [];
  var veh_brand = [];
  var veh_model = [];
  var form;
  var country_id = null;
  var states_id = null;
  var technology_id = null;
  var _selectedTechnology = null;
  var _selectedBrand = null;
  var _selectedModel = null;
  bool hasState = false;

  String? fueltype = "";
  var model = null;
  var brand = null;
  String? vehicletype = "";
  String? vehicleusage = "";
  String? technology = "";
  bool _autovalidate = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateinput = TextEditingController();

  TextEditingController odometerreadingController = TextEditingController();

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
                    MaterialPageRoute(
                        builder: (context) => VehicleDetailsScreen()),
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
      body: Form(
        key: _formKey,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'EV Technology ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '*',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                        hint: Text('Select'),
                        items: technologies.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val['name']),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTechnology = newValue;
                            technology_id = _selectedTechnology['id'];
                            print(_selectedTechnology);

                          });
                        },
                        // value: items,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          border: OutlineInputBorder(),
                          // filled: true,
                          // fillColor: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
                _selectedTechnology!=null && _selectedTechnology['name'] =='PHEV' ?Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Fuel Type (For PHEVS ONLY) ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                          hint: Text('Select'),
                          items: fuel_types.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {

                              fueltype = newValue;
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Vehicle Brand ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '*',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                          hint: Text('Select'),
                          items: veh_brand.map((val) {
                            return new DropdownMenuItem(
                              value: val,
                              child: Text(val['vehicle_brand_name']),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              validator: (value) => value == null ? 'field required' : null;
                              _selectedBrand = newValue;
                              vehicle_brand_id = _selectedBrand['id'];
                              getVehModel();
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Vehicle model & year ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '*',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                          hint: Text('Select'),
                          items: veh_model.map((val) {
                            return new DropdownMenuItem(
                              value: val,
                              child: Text(val['name']),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              validator: (value) => value == null ? 'field required' : null;
                              _selectedModel = newValue;
                              vehicle_model_id = _selectedModel['id'];
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: ''
                                    'Vehicle Type  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '*',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                          hint: Text('Select'),
                          items: vehicle_types.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            validator: (value) => value == null ? 'field required' : null;
                            vehicletype = newValue;
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Vehicle Usage  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Color(0xFF75A843)),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '*',

                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          validator: (value) => value == null ? 'field required' : null,
                          hint: Text('Select'),
                          items: vehicle_usage.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              vehicleusage = newValue;

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
                            "Odometer reading ",
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
                      TextFormField(
                        validator: (value) => value == null ? 'field required' : null,
                        keyboardType: TextInputType.number,
                        controller: odometerreadingController,
                        decoration: const InputDecoration(
                            // hintText: 'User Name',
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Add vehicle   >',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      form = _formKey.currentState;
                      ProgressDialog dial = new ProgressDialog(context,
                          type: ProgressDialogType.Normal);
                      dial.style(
                        progressWidget: Container(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator()),
                        backgroundColor: Colors.white,
                        messageTextStyle: TextStyle(
                            color: Color(0xFF75A843),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                        message: 'Please wait',
                      );

                      String odometer = odometerreadingController.text.trim();
                      String access_token = widget.access_token.text.trim();
                      String vehicle_identification_number =
                          widget.vehicle_identification_number.text.trim();
                      if(form.validate()) {
                        dial.show();

                        VehicleService vehicleservice = VehicleService(context);
                        vehicleservice
                            .createVehicle(
                          access_token,
                          vehicle_identification_number,
                          fueltype!,
                          vehicletype!,
                          vehicleusage!,
                          odometer,
                          widget.country_of_reg,
                          widget.country_95_percent_time,
                          technology_id,
                          widget.states_id,
                          id!,
                          vehicle_model_id!,
                          widget.state_of_reg,
                        )
                            .then((value) =>
                        {
                          print('statusssssss'),
                          print(value.user_id),
                          form = _formKey.currentState,
                          if (value.status != "failed")
                            {
                              dial.hide(),
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content:
                                Text("Account created successfully"),
                                duration: Duration(seconds: 3),
                              )),
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VehicleListScreen()),
                              ),
                            }
                          else
                            {
                              dial.hide(),
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(value.message),
                                duration: Duration(seconds: 3),
                              ))
                            }
                        });
                      }else{
                        dial.hide();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Please enter the required fields'),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            )),
      ),
    );
  }

  Future<void> getUserDetails() async {
    await AuthenticationServices(context)
        .getUserDetails()
        .then((value) async => {
              setState(() {
                id = value.id;
              }),
            });
  }

  void getTechnology() {
    VehicleService vehicleService = VehicleService(context);
    vehicleService.getTechnologies().then((value) => {
          print('statess'),
          setState(() {
            technologies = value;
          }),
          print(value[0]['id']),
        });
  }

  void getVehicleBrand() {
    VehicleService vehicleService = VehicleService(context);
    vehicleService.getVehicleBrand().then((value) => {
          print('statess'),
          setState(() {
            veh_brand = value;

            if (vehicle_brand_id != null) {
              getVehModel();
            }
          }),
          print(value[0]['id']),
        });
  }

  void getVehModel() {
    VehicleService vehicleService = VehicleService(context);
    vehicleService.getVehicleModel(vehicle_brand_id!).then((value) => {
          print('statess'),
          setState(() {
            veh_model = value;
          }),
          print(value[0]['id']),
        });
  }
}
