import 'package:ev_app/screens/profile_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountinformationScreen extends StatefulWidget {
  const AccountinformationScreen({Key? key}) : super(key: key);

  @override
  State<AccountinformationScreen> createState() => _AccountinformationScreenState();
}

class _AccountinformationScreenState extends State<AccountinformationScreen> {
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
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(
              'Account Information',
              style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
            ),
              Text(
                'Done',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
              ),
          ]),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}
