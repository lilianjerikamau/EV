import 'package:ev_app/Services/settings_service.dart';
import 'package:ev_app/screens/profile_menu_screen.dart';
import 'package:ev_app/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../Services/auth_service.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({Key? key}) : super(key: key);

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  double value = 0;
  var items2 = ['Litres', 'Gallons'];
  var items = ['Km', 'ml'];
  int id = 0;
  String token = '',
      fuel_units = '',
      distance_units = '',
      notification_period = '';
  String _selectedSolarValue = "";
  String _selectedInvolvmentValue = "";
  bool selectedSolarValue = false;
  bool selectedInvolvmentValue = false;
  String notification = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
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
              value: value),
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
                        Expanded(
                          child: Text(
                            "Fuel Metrics",
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
                        hint: fuel_units != null
                            ? Text(fuel_units)
                            : Text('Litres'),
                        items: items2.map((String category) {
                          return new DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          _selectedSolarValue = newValue!;
                          if (_selectedSolarValue.contains("true")) {
                            setState(() {
                              print(_selectedSolarValue);
                              selectedSolarValue = true;
                              updateSettings();
                            });
                          } else {
                            setState(() {
                              selectedSolarValue = false;
                              updateSettings();
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
                            "Distance Metrics Unit",
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
                        hint: distance_units != null
                            ? Text(distance_units)
                            : Text('km'),
                        items: items.map((String category) {
                          return new DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          _selectedInvolvmentValue = newValue!;
                          if (_selectedInvolvmentValue.contains("true")) {
                            setState(() {
                              print(_selectedSolarValue);
                              selectedInvolvmentValue = true;
                              updateSettings();
                            });
                          } else {
                            setState(() {
                              selectedInvolvmentValue = false;
                              updateSettings();
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
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(),
                    RadioListTile(
                      title: Text("Never"),
                      value: "NEVER",
                      groupValue: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                          updateSettings();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Daily"),
                      value: "DAILY",
                      groupValue: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                          updateSettings();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Weekly"),
                      value: "WEEKLY",
                      groupValue: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                          updateSettings();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Monthly"),
                      value: "MONTHLY",
                      groupValue: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                          updateSettings();
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          )),
    );
  }
updateSettings(){
  ProgressDialog dial = new ProgressDialog(context,
      type: ProgressDialogType.Normal);

  dial.show();
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
  SettingsService(context)
      .createSettings(
      fuel_units,
      distance_units,
      notification,
      id,
      token)
      .then((value) async => {
    if (value.error != null)
      {
        dial.hide(),
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(value.error_description),
          duration: Duration(seconds: 3),
        ))
      }
    else
      {
        print('Okay'),
        dial.hide(),
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Successful"),
          duration: Duration(seconds: 3),
        )),
        // await AuthenticationServices(context)

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           ProfileScreen(),
        //     ))
      }
  });
}
  Future<void> getUserDetails() async {
    await AuthenticationServices(context)
        .getUserDetails()
        .then((value) async => {
              setState(() {
                id = value.id;
                fuel_units = value.user_settings['fuelUnits'];
                distance_units = value.user_settings['distanceUnits'];
                notification = value.user_settings['notificationPeriod'];
                print('user details');
                print(id);
                print(notification);
                print(distance_units);
                print(value.user_settings['fuelUnits']);
              }),
            });

    await AuthenticationServices(context).getUser().then((value) async => {
          setState(() {
            token = value.access_token;
          }),
        });
  }
}
