import 'package:ev_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
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
        'History',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    ),);
  }
}
