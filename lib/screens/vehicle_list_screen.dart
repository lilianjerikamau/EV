import 'package:ev_app/models/vehiclemodel.dart';
import 'package:ev_app/screens/choose_metric_screen.dart';
import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/google_map_screen.dart';
import 'package:ev_app/screens/home_screen.dart';
import 'package:ev_app/screens/sodo_results.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:ev_app/screens/vehicle_detail_one.dart';
import 'package:ev_app/screens/vehicle_details_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth_service.dart';
import '../Services/vehicle_service.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({Key? key}) : super(key: key);

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  late List<Vehicle> vehiclelist; //list array variable for peoples
  var user_id =null;
  var veh_list = [];
  @override
  void initState() {
    // vehiclelist = [
    //   Vehicle(
    //       id: 1, regno: "KBB 876G", mileage: "0099777", type: "BEV"),
    //   Vehicle(
    //       id: 2, regno: "KCH 789Q", mileage: "88577", type: "BEV"),
    //   Vehicle(id: 3, regno: "KAD 675B", mileage: "88585", type: "PHEV"),
    //   Vehicle(id: 4, regno: "KHC 890H", mileage: "7778993", type: "PHEV"),
    //   Vehicle(
    //       id: 5, regno: "KJG 765G", mileage: "566738", type: "BEV"),
    //   Vehicle(id: 6, regno: "KDR 768P", mileage: "7749950", type: "PHEV"),
    // ]; //list of peoples using Vehicle model class, you can convert from JSON too

    //OR to convert from JSON

    /*
    vehiclelist = List<Vehicle>.from(
      jsonstring.map((dataone){
          return Vehicle.fromJSON(dataone);
          //return of factory of Vehicle
      })
    );
   */

getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => VehicleDetailsScreen()
            )
            );
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add,color: Colors.green,size: 40,), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          title: Text(
            'My Vehicles',
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
        ),
        body: GridView.count(
          crossAxisCount: 2, //
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          children: veh_list.map((vehicles) {
            return InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => VehicleDetailOne(type: vehicles['vehicle_type'],mileage: vehicles['fuel_type'],regno: vehicles['vehicle_identification_number'])
                )
                );
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 0.08, //<-- SEE HERE
                    ),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //main axix alignemnt to center
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/car.png',
                              height: 120,
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicles['vehicle_identification_number']!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('EV Type :'+
                                  vehicles['vehicle_technology']['name'],
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                                Text('Mileage :'+
                                  '00065555',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
            );
          }).toList(), //don't forget to to add .toList() at last of map
        ));
  }
  getVehicleList(){
    VehicleService vehicleService = VehicleService(context);
    vehicleService.getVehicles(user_id!).then((value) => {
      print('statess'),
      setState(() {
        veh_list = value;
      }),
      print(value[0]['id']),
    });
  }
  Future<void> getUserDetails() async {
    await AuthenticationServices(context).getUser().then((value) async => {
      setState(() {
        user_id = value.user_id;
        getVehicleList();
      }),
    });
  }
}
