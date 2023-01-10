import 'package:ev_app/screens/add_kwh_charged_screen.dart';
import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ChooseMetricScreen extends StatefulWidget {
  const ChooseMetricScreen({Key? key}) : super(key: key);

  @override
  State<ChooseMetricScreen> createState() => _ChooseMetricScreenState();
}

class _ChooseMetricScreenState extends State<ChooseMetricScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SoecsResultsScreen()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green,
          size: 40,
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        title: Text(
          'Choose Metric',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AddKwhChargedScreen()));
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
                                          color: Colors.green,
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
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OdometerPicture()));
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
                                          color: Colors.green,
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
                ),
              )
            ],
          ),
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OdometerPicture()));
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
                              'assets/images/soda.png',
                              height: 120,
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SODA",
                                  style: TextStyle(
                                      color: Colors.green,
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
            ),
          ),
        ],
      ),
    );
  }
}
