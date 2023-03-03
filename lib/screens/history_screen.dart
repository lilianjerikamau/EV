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
      title: Text(
        'History',
        style: TextStyle(
            color: Color(0xFF75A843), fontWeight: FontWeight.bold, fontSize: 22),
      ),
    ),);
  }
}
