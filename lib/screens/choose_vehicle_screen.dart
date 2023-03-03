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
import 'package:progress_dialog/progress_dialog.dart';
import '../Services/auth_service.dart';
import '../Services/vehicle_service.dart';

class ChooseVehicleScreen extends StatefulWidget {

  const ChooseVehicleScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVehicleScreen> createState() => _ChooseVehicleScreenState();
}

class _ChooseVehicleScreenState extends State<ChooseVehicleScreen> {
  late List<Vehicle> vehiclelist; //list array variable for peoples
  var user_id =null;
  var veh_list = [];
  var veh_id =null;
  var country_id= null;
  var state_id =null;
  var reg_no =null;
  var ev_technology =null;
  var model_no =null;
  ProgressDialog? dial;
  @override
  void initState() {
    // vehiclelist = [
    dial = new ProgressDialog(context,
        type: ProgressDialogType.Normal);


    dial?.style(
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
          child: Icon(Icons.add,color: Color(0xFF75A843),size: 40,), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          title: Text(
            'My Vehicles',
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
          children: veh_list.map((vehicles) {
            //user vehiclelist.map to loop over the list
            return InkWell(
              onTap: (){
                setState(() {
                 veh_id =vehicles['id'];
               country_id= vehicles['country_95_percent_time']['id'];
                 model_no =  vehicles['vehicle_model']['name'];
               // state_id =vehicles['state_95_percent_time']['id'];
            reg_no =vehicles['vehicle_identification_number'];
                 ev_technology=vehicles['ev_technology'];

              print('resullllllllllltsssssssss');
              print(veh_id);
              print(country_id);
              print(state_id);
              print(reg_no);
              print(model_no);

                });
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) =>ChooseMetricScreen(vehicle_id: veh_id, country_id: country_id, state_id:state_id, reg_no:reg_no, model:model_no ,ev_technology:ev_technology)
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
                                // Text('EV Type :'+
                                //     vehicles['vehicle_technology']['name'],
                                //   style: TextStyle(
                                //       color: Color(0xFF75A843),
                                //       fontWeight: FontWeight.normal,
                                //       fontSize: 15),
                                // ),
                                // Text('Mileage :'+
                                //     '00065555',
                                //   style: TextStyle(
                                //       color: Color(0xFF75A843),
                                //       fontWeight: FontWeight.normal,
                                //       fontSize: 15),
                                // ),
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
    dial?.show();
    VehicleService vehicleService = VehicleService(context);
    vehicleService.getVehicles(user_id!).then((value) => {
      print('statess'),
      setState(() {
        veh_list = value;
        dial?.hide();
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
