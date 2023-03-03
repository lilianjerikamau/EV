import 'package:ev_app/models/sodo_responsemodel.dart';
import 'package:ev_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SodaResultsScreen extends StatefulWidget {
  final issoda;
  final val;
  const SodaResultsScreen( {Key? key, required this.issoda,  this.val}) : super(key: key);

  @override
  State<SodaResultsScreen> createState() => _SodaResultsScreenState();
}

class _SodaResultsScreenState extends State<SodaResultsScreen> {
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
          'Soda Results',
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
                      Text(
                        "93.7327",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      widget.issoda!=true?   Text('Soda %',
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
                          Text(
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
                        Text(
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
                      Text(
                        'Muthaiga, Nairobi',
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ODOREG',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('129,000.00 ',
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
                      Text('ODO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('150,000.00 ',
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
                      Text('  12,000.00 ',
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
                      Text('  17.54 ',
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
                      Text('Ken  20,037.06 ',
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
                      Text('  5,009.26 ',
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
                      Text('BTPEI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('  133.58 ',
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
                      Text('LTEE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('  1,958.42 ',
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
                      Text('PUSESE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('268.30 ',
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
                      Text('PTTWE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('_',
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
                      Text('PUSFSE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('_',
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
                      Text('PTPEI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('_',
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
                      Text('  2,226.73 ',
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
                      Text('  18,078.64 ',
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
                      Text('  14.84 ',
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
                      Text('  100.00 ',
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
