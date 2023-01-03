import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OdometerPicture extends StatefulWidget {
  const OdometerPicture({super.key});

  @override
  State<OdometerPicture> createState() => _OdometerPictureState();
}

class _OdometerPictureState extends State<OdometerPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Odometer Picture',
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
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ForgotPasswordScreenTwo()),
                  // );
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            // alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Take a picture of the odometer capturing the current milage',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(children: [
                  Container(
                    color: Colors.white,
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/odometer.png')),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 170,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.green,
                      size: 80,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
