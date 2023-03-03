import 'package:ev_app/models/sodo_responsemodel.dart';
import 'package:ev_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SodoResultsScreen extends StatefulWidget {
  final issoda;
  final val;
  final regno;
  final date;

  var pttwe;

  var pusfse;

  var embp;

  var bttwe;

  var busfse;

  var btpei;

  var ltee;

  var pusese;

  var lte;

  var ptpei;

  var lter;

  var vwwei;

  var tdp_percentage;

  var sodo_percentage;

  final gps_location;

  var odo_reading;
  SodoResultsScreen( {Key? key, required this.issoda,  this.val,   this.regno, this.date,  this.pttwe, this.pusfse, this.embp, this.bttwe, this.busfse, this.btpei, this.ltee, this.pusese, this.lte, this.ptpei, this.lter, this.vwwei, this.tdp_percentage, this.sodo_percentage, this.gps_location, this.odo_reading}) : super(key: key);

  @override
  State<SodoResultsScreen> createState() => _SodoResultsScreenState();
}

class _SodoResultsScreenState extends State<SodoResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title:widget.issoda!=true? Text(
          'SODO Results',
          style: TextStyle(
              color: Color(0xFF75A843), fontWeight: FontWeight.bold, fontSize: 22),
        ): Text(
          'SODA Results',
          style: TextStyle(
              color: Color(0xFF75A843), fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey,
                    width: 0.08, //<-- SEE HERE
                  ),
                ),
                margin: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    widget!=null?  Text(
                       widget.val,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ):  Text(
                      '',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                   widget.issoda!=true?   Text('SODO %',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)):Text('SODA %',
                       style: TextStyle(
                           fontSize: 25, fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
            SizedBox(
              height: 120,

              child: Row(children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      side: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey,
                        width: 0.08, //<-- SEE HERE
                      ),
                    ),
                    margin: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                     widget.regno!=null?     Text(
                            widget.regno,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                          ):Text(
                       '',
                       style: TextStyle(
                           fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                     ),
                          Text('Plate number',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843))),
                        ]),
                  ),
                ),
                Expanded(child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    side: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.grey,
                      width: 0.08, //<-- SEE HERE
                    ),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    widget.date!=null?    Text(
                          widget.date,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                        ):  Text(
                      '',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                    ),
                        Text('Date',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843))),
                      ]),
                ),),
              ]),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey,
                    width: 0.08, //<-- SEE HERE
                  ),
                ),
                margin: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                 widget.gps_location!=null?     Text(
                        widget.gps_location,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                      ): Text(
                   '',
                   style: TextStyle(
                       fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843)),
                 ),
                      Text('Location',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF75A843))),
                    ]),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.08, //<-- SEE HERE
                ),
              ),
              margin: EdgeInsets.all(8),
              child: Column(children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detailed Report',
                        style: TextStyle(
                            color: Color(0xFF75A843),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('ODOREG',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 18)),
                //       Text('',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18,
                //               color: Colors.grey))
                //     ],
                //   ),
                // ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ODO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(widget.odo_reading,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EMBP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(widget.embp,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BKPL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(widget.busfse,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BTTWE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.bttwe!=null? Text(widget.bttwe,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text("",
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BUSFSE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                   widget.busfse!=null?   Text(widget.busfse,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text("widget.busfse",
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 18,
                           color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
              widget.issoda!=true?  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BTPEI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      widget.btpei!=null?Text(widget.btpei,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text("",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ):Container(),
                SizedBox(height: 10),
               widget.issoda!=true? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LTEE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      widget.ltee!=null?Text(widget.ltee,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ):Container(),
                SizedBox(height: 10),
               widget.issoda!=true? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PUSESE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.pusese!=null? Text(widget.pusese,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)): Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ):Container(),
                SizedBox(height: 10),
               widget.issoda!=true? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PTTWE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.pttwe!=null? Text(widget.pttwe,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ):Container(),
                SizedBox(height: 10),
               widget.issoda!=true? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PUSFSE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.pusfse!=null? Text(widget.pusfse,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ):Container(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PTPEI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.ptpei!=null? Text(widget.ptpei,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LTE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                   widget.lte!=null  ? Text(widget.lte,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text(widget.lte,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LTER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    widget.lter!=null?  Text(widget.lter,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VWWEI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.vwwei!=null? Text(widget.vwwei,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TPD% ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                     widget.tdp_percentage!=null? Text(widget.tdp_percentage,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)):Text('',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
