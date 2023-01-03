import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProcessImageTwo extends StatefulWidget {
  const ProcessImageTwo({super.key});

  @override
  State<ProcessImageTwo> createState() => _ProcessImageTwoState();
}

class _ProcessImageTwoState extends State<ProcessImageTwo> {
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
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/odometer.png')),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  side: BorderSide(
                    color: Colors.green,
                    width: 1, //<-- SEE HERE
                  ),
                ),
                elevation: 2,
                margin: EdgeInsets.all(12.0),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      SizedBox(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('Select Mileage',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ]),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.green),
                                  // initialValue:
                                  //     ,
                                  // onSaved: (value) =>,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(hintText: "144969"),
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.green),
                                  // initialValue:
                                  //     ,
                                  // onSaved: (value) =>,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(hintText: "300km"),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.green),
                                  // initialValue:
                                  //     ,
                                  // onSaved: (value) =>,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(hintText: "11: 22-244km"),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Proceed',
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
      ),
    );
  }
}
