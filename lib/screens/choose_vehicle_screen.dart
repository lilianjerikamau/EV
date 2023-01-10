import 'package:ev_app/screens/choose_metric_screen.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:ev_app/screens/vehicle_detail_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/vehiclemodel.dart';
import 'home_screen.dart';

class ChooseVehicleScreen extends StatefulWidget {
  const ChooseVehicleScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVehicleScreen> createState() => _ChooseVehicleScreenState();
}

class _ChooseVehicleScreenState extends State<ChooseVehicleScreen> {
  late List<Vehicle> vehiclelist; //list array variable for peoples
  @override
  void initState() {
    vehiclelist = [
      Vehicle(
          id: 1, regno: "KBB 876G", mileage: "0099777", type: "BEV"),
      Vehicle(
          id: 2, regno: "KCH 789Q", mileage: "88577", type: "BEV"),
      Vehicle(id: 3, regno: "KAD 675B", mileage: "88585", type: "PHEV"),
      Vehicle(id: 4, regno: "KHC 890H", mileage: "7778993", type: "PHEV"),
      Vehicle(
          id: 5, regno: "KJG 765G", mileage: "566738", type: "BEV"),
      Vehicle(id: 6, regno: "KDR 768P", mileage: "7749950", type: "PHEV"),
    ]; //list of peoples using Vehicle model class, you can convert from JSON too

    //OR to convert from JSON

    /*
    vehiclelist = List<Vehicle>.from(
      jsonstring.map((dataone){
          return Vehicle.fromJSON(dataone);
          //return of factory of Vehicle
      })
    );
   */

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => SoecsResultsScreen()
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
          //use GridView.count for independent to silver layout
          crossAxisCount: 2, //
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,

          //scrollDirection: Axis.horizontal, //set this for horizontal scroll direction
          shrinkWrap: true,
          children: vehiclelist.map((vehicles) {
            //user vehiclelist.map to loop over the list
            return InkWell(
              onTap: (){
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //     builder: (context) => VehicleDetailOne(type: vehicles.type!,mileage: vehicles.mileage!,regno: vehicles.regno!,)
                // )
                // );
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => ChooseMetricScreen()
                ));
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
                                  vehicles.regno!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
}