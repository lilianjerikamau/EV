import 'package:ev_app/screens/home_screen.dart';
import 'package:ev_app/screens/login_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/start_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen_two.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    _dateinput.text = formattedDate;
    // TODO: implement initState
    super.initState();
  }

  var items = [
    'LPG propelled',
    'LPG/liquid fuel',
    'electric/liquid fuel(hybrid)',
    'Fuel-petrol',
    'Fuel-disel',
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController _dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicle Details',
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
            backgroundColor: Colors.green.withOpacity(0.3),
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
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
                          "Vehicle Identification number ",
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
                          "Country of registration ",
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
                          "Date of registration ",
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
                      controller:
                          _dateinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          // hintText: 'User Name',
                          suffixIcon: Icon(
                            color: Colors.green,
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
                        items: items.map((String category) {
                          return new DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // do other stuff with _category
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
                        MaterialPageRoute(builder: (context) => VehicleDetailsScreenTwo()),
                      );
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}
