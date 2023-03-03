import 'package:ev_app/screens/add_kwh_charged_screen.dart';
import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/process_image_two.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class ChooseMetricScreen extends StatefulWidget {
  final vehicle_id;
  final country_id;
  final state_id;
  final reg_no;
  final model;
  final String ev_technology;
  const ChooseMetricScreen(
      {Key? key,
      required this.vehicle_id,
      required this.country_id,
      required this.state_id,
      required this.reg_no,
      required this.model,
      required this.ev_technology})
      : super(key: key);

  @override
  State<ChooseMetricScreen> createState() => _ChooseMetricScreenState();
}

class _ChooseMetricScreenState extends State<ChooseMetricScreen> {
  var veh_id = null;
  var country_id = null;
  var state_id = null;
  var reg_no = null;
  var model_no = null;
  var ev_technology = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   //Floating action button on Scaffold
      //   onPressed: () {
      //     // Navigator.pushReplacement(context,
      //     //     MaterialPageRoute(builder: (context) => SoecsResultsScreen(model: null, reg_no: null, kwh_charged: w,)));
      //   },
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.add,
      //     color: Color(0xFF75A843),
      //     size: 40,
      //   ), //icon inside button
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        title: Text(
          'Choose Metric',
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
                        builder: (context) => ChooseVehicleScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'Choose the metric you wish to calculate for the vehicle ',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  veh_id = widget.vehicle_id;
                  country_id = widget.country_id;
                  state_id = widget.state_id;
                  reg_no = widget.reg_no;
                  model_no = widget.model;
                  ev_technology = widget.ev_technology;
                  print('resullllllllllltsssssssss');
                  print(veh_id);
                  print(country_id);
                  print(state_id);
                  print(reg_no);
                  print(model_no);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddKwhChargedScreen(
                              vehicle_id: veh_id,
                              state_id: state_id,
                              country_id: country_id,
                              model: model_no,
                              regno: reg_no,
                              ev_technology: ev_technology)));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
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
                                  'assets/images/greencar.png',
                                  height: 120,
                                  width: 150,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SOECS",
                                      style: TextStyle(
                                          color: Color(0xFF75A843),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Emision from production and delivery of Charged Electricity",
                                      style: TextStyle(
                                          color: Color(0xFF75A843),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OdometerPicture(
                                vehicleId: widget.vehicle_id,
                                issoda: false,
                                ev_technology: "",
                                checkMileage: true,
                                mileage: "",
                                obcem: null,
                                obfcm: null,
                              )));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
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
                                  'assets/images/sodo.png',
                                  height: 120,
                                  width: 150,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SODO",
                                      style: TextStyle(
                                          color: Color(0xFF75A843),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "State of de-carbonization based on mileage monitoring",
                                      style: TextStyle(
                                          color: Color(0xFF75A843),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OdometerPicture(
                            vehicleId: widget.vehicle_id,
                            issoda: true,
                            ev_technology: widget.ev_technology,
                            checkMileage: true,
                            mileage: null,
                            obcem: null,
                            obfcm: null,
                          )));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
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
                              'assets/images/sodo.png',
                              height: 120,
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SODA",
                                  style: TextStyle(
                                      color: Color(0xFF75A843),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "State of de-carbonization based on monitoring mileage & consumption of fuel & electricity",
                                  style: TextStyle(
                                      color: Color(0xFF75A843),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
            ),
          ),
          //
          Card(
            color: Color(0xFFAE56E),
            shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'SODA',
                              style:
                                  TextStyle(fontSize: 18, color: Color(0xFF75A843)),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Emision from production and delivery of Charged Electricity',
                            style: TextStyle(fontSize: 18, color:  Color(0xFF75A843)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
