import 'package:ev_app/Services/soecs_service.dart';
import 'package:ev_app/screens/choose_metric_screen.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../Services/auth_service.dart';

class AddKwhChargedScreen extends StatefulWidget {
  final vehicle_id;
  final country_id;
  final state_id;
  final regno;
  final model;

  const AddKwhChargedScreen(
      {Key? key,
      required this.vehicle_id,
      required this.state_id,
      required this.country_id,
      required this.regno,
      required this.model})
      : super(key: key);

  @override
  State<AddKwhChargedScreen> createState() => _AddKwhChargedScreenState();
}

class _AddKwhChargedScreenState extends State<AddKwhChargedScreen> {
  TextEditingController numberofkwhcharged = TextEditingController();
  TextEditingController chargingpoint = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var form;
  String? kwh_charged;
  String? soecs_result;
  var items2 = ['Yes', 'No'];
  var countries = [];
  var states = [];
  var country_id = null;
  var states_id = null;
  bool hasState = false;
  String? _selectedHomeValue = null;
  String? _country = "";
  String? _coutrydisplay = "";
  String? _coutryCode = "";
  String? _selectedInvolvmentValue = null;
  var _selectedCountry = null;
  var _selectedState = null;
  bool selectedHomeValue = true;

  @override
  void initState() {
    // TODO: implement initState
    getCountries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Kwh Charged',
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
                      MaterialPageRoute(
                          builder: (context) => ChooseMetricScreen(
                                vehicle_id: widget.vehicle_id,
                                country_id: widget.country_id,
                                state_id: widget.state_id,
                                reg_no: widget.regno,
                                model: widget.model,
                              )),
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
                        children: [
                          Text(
                            "Number of kwh charged",
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
                      TextField(
                        controller: numberofkwhcharged,
                        decoration: InputDecoration(

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
                            "At home",
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
                          items: items2.map((String category) {
                            return new DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                          
                            _selectedHomeValue = newValue;
                            if (_selectedHomeValue!.contains("Yes")) {
                              setState(() {
                                print(_selectedHomeValue);
                                selectedHomeValue = true;
                                country_id =null;
                                states_id =null;
                              });
                            } else {
                              setState(() {
                                selectedHomeValue = false;
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
            selectedHomeValue !=true ? Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Country",
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
                ):Container(),
                hasState == true && selectedHomeValue !=true
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
                    width: MediaQuery.of(context).size.width / 0.2,
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Calculate SOECS   >',
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
                              color: Colors.green,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                          message: 'Please wait',
                        );
                        kwh_charged = numberofkwhcharged.text.trim();
                        String access_token = chargingpoint.text.trim();
                        if (form.validate()) {
                          dial.show();
                          SoecsService soecsservice = SoecsService(context);
                          soecsservice
                              .createSoecs(
                                kwh_charged!,
                                "33 0, -38 3",
                                widget.vehicle_id,
                            selectedHomeValue,
                               states_id,
                              country_id,
                              )
                              .then((val) => {
                                    form = _formKey.currentState,
                                    if (val.status != "failed")
                                      {
                                        soecs_result = val.soec_value,
                                        dial.hide(),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text("Success!"),
                                          duration: Duration(seconds: 3),
                                        )),
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SoecsResultsScreen(
                                                model: widget.model,
                                                reg_no: widget.regno,
                                                kwh_charged: kwh_charged,
                                                soecs_result: soecs_result,
                                              ),
                                            )),
                                      }
                                    else
                                      {
                                        dial.hide(),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(val.message!),
                                          duration: Duration(seconds: 3),
                                        ))
                                      }
                                  });
                        } else {
                          dial.hide();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Please enter the required fields'),
                            duration: Duration(seconds: 3),
                          ));
                        }

                        print(numberofkwhcharged.text);
                        print(chargingpoint.text);
                      },
                    )),
              ],
            ),
          ),
        ));
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
}
