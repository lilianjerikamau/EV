import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SoecsResultsScreen extends StatefulWidget {
  final reg_no;
  final model;
  final kwh_charged;
  final soecs_result;
  const SoecsResultsScreen({Key? key,required this.model,required this.reg_no,required this.kwh_charged,required this.soecs_result}) : super(key: key);

  @override
  State<SoecsResultsScreen> createState() => _SoecsResultsScreenState();
}

class _SoecsResultsScreenState extends State<SoecsResultsScreen> {
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
                    MaterialPageRoute(builder: (context) => ChooseVehicleScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'SOECS Results',
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
                      Text(
                        widget.soecs_result,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text('SOECS',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
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
                        'Details',
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      Expanded(child: Text(DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Vehicle registration',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    widget.reg_no!=null?  Expanded(child: Text(widget.reg_no,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))):  Expanded(child: Text('REG NO',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey)))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Model',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                     widget.model!=null? Expanded(child:Text(widget.model,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))):Expanded(child:Text('Model',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Colors.grey)))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                     Expanded(child:Text(' Muthaiga, Nairobi, Kenya ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Kwh charge',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      Expanded(child:Text(widget.kwh_charged,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey))
                      )
                    ],
                  ),
                ),



              ]),
            ),
            SizedBox(height: 70),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.2,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF75A843), width: 0.5)),
                  child:
                  const Text('Thanks!', style: TextStyle(color: Color(0xFF75A843),fontSize: 22)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
