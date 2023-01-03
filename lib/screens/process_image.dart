import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProcessImage extends StatefulWidget {
  const ProcessImage({super.key});

  @override
  State<ProcessImage> createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Process Image',
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
                ]),
              ],
            ),
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
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => WelcomeBackScreen()),
                  // );
                },
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
