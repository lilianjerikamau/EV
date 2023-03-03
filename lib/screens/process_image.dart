import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/phev.dart';
import 'package:ev_app/screens/process_image_two.dart';
import 'package:ev_app/screens/scan_obcem.dart';
import 'package:ev_app/screens/scan_obfcm.dart';
import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'dart:io';

class ProcessImage extends StatefulWidget {
  final imagePath;
  final vehicleId;
  final issoda;
  final mileage;
  final ev_technology;
  final checkMileage;
  final isphev;
  final obcem;
  final obfcm;


  ProcessImage(
      {super.key,
      required this.imagePath,
      required this.vehicleId,
      required this.issoda,
      required this.ev_technology,
      required this.checkMileage,
       required this.isphev,
        required this.obfcm,
        required this.obcem,
      required this.mileage});

  @override
  State<ProcessImage> createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Process Image',
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            backgroundColor: Color(0xFF75A843).withOpacity(0.3),
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF75A843)),
            value: 0.5,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              // alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.file(
                          File(widget.imagePath),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Process Image',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    print('EV TECHNOLOGY(PROCESS IMAGE)');
                    print("vehicleid is");
                    print(widget.vehicleId);
                    print(widget.ev_technology);
                    if (widget.checkMileage != true) {
                      print("isphev");
                      print(widget.isphev);
                      if(widget.ev_technology.contains("PHEV") ) {
                        if (widget.isphev != null) {
                          if (widget.isphev ==false) {
                            print("isphev");
                            print(widget.isphev);
                            print('You are moving to SODA with ev_tech FCEV');
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return OBFCM(
                                    imagePath: widget.imagePath,
                                    vehicleId: widget.vehicleId,
                                    issoda: widget.issoda,
                                    ev_technology: widget.ev_technology,
                                    obecm: 0,
                                    mileage: widget.mileage,
                                  );
                                }));
                          } else if ((widget.isphev == "null")) {
                            print(
                                'widget.isphevvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
                            print(widget.isphev);
                            print('You are moving to SODA with ev_tech BEV');
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return PHEV(
                                    imagePath: widget.imagePath,
                                    vehicleId: widget.vehicleId,
                                    issoda: widget.issoda,
                                    ev_technology: widget.ev_technology,
                                    mileage: widget.mileage,
                                    obfcm: widget.obfcm,
                                    obcem: widget.obfcm,
                                  );
                                }));
                          }
                          // } else if ((widget.ev_technology.contains("PHEV")) &&
                          //     (widget.isphev == true)) {
                          //   print('You are moving to SODA with ev_tech PHEV');
                          //   if (widget.ev_technology.contains("PHEV")) {
                          //     Navigator.pushReplacement(context,
                          //         MaterialPageRoute(builder: (context) {
                          //           return PHEV(
                          //             imagePath: widget.imagePath,
                          //             vehicleId: widget.vehicleId,
                          //             issoda: widget.issoda,
                          //             ev_technology: widget.ev_technology,
                          //             mileage: widget.mileage,
                          //             obfcm: widget.obfcm,
                          //             obcem: widget.obfcm,
                          //           );
                          //         }));
                          //   }
                          // }
                        }
                      }else{
                        if(widget.ev_technology.contains("FCEV")){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return OBFCM(
                                  imagePath: widget.imagePath,
                                  vehicleId: widget.vehicleId,
                                  issoda: widget.issoda,
                                  ev_technology: widget.ev_technology,
                                  obecm: 0,
                                  mileage: widget.mileage,
                                );
                              }));
                        }else if(widget.ev_technology.contains("BEV")){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return OBCEM(
                                  imagePath: widget.imagePath,
                                  vehicleId: widget.vehicleId,
                                  issoda: widget.issoda,
                                  ev_technology: widget.ev_technology,
                                  mileage: widget.mileage, obfcm: 0,
                                );
                              }));
                        }
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProcessImageTwo(
                                imagePath: widget.imagePath,
                                vehicleId: widget.vehicleId,
                                issoda: widget.issoda,
                                ev_technology: widget.ev_technology)),
                      );
                    }
                  },
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
