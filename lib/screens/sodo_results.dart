import 'package:ev_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SodoResultsScreen extends StatefulWidget {
  const SodoResultsScreen({Key? key}) : super(key: key);

  @override
  State<SodoResultsScreen> createState() => _SodoResultsScreenState();
}

class _SodoResultsScreenState extends State<SodoResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'SODO Results',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
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
                        '91.29%',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text('SODO %',
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
                            'KCB 344k',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
                          ),
                          Text('Plate number',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green)),
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
                          '21.11.2022',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
                        ),
                        Text('Date',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green)),
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
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
                      ),
                      Text('Location',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green)),
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
                            color: Colors.green,
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
