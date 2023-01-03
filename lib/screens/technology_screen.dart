import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({super.key});

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(12.0),
                child: Text('Technology',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
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
                                        InputDecoration(hintText: "BEV"),
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
                                        InputDecoration(hintText: "PHEV"),
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
                                        InputDecoration(hintText: "HEV"),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Text('Fuel Type',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
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
                                        InputDecoration(hintText: "Diesel"),
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
                                        InputDecoration(hintText: "Gas"),
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
                margin: EdgeInsets.all(12.0),
                child: Text('Model & Year',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
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
                                    decoration: InputDecoration(
                                        hintText:
                                            "2021 A7 Sportback plig-in Hybrid"),
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
                                    decoration: InputDecoration(
                                        hintText:
                                            "2021 A7 Sportback 55 TEFSIe e quatro plug"),
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
                margin: EdgeInsets.all(12.0),
                child: Text('Usage',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
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
                                    decoration: InputDecoration(
                                        hintText: "Commercial "),
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
                                        InputDecoration(hintText: "Private "),
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
                                    decoration: InputDecoration(
                                        hintText: "Company-Owned"),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
