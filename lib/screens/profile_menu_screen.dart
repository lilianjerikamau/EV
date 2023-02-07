import 'package:ev_app/screens/aboutus_screen.dart';
import 'package:ev_app/screens/account_information_screen.dart';
import 'package:ev_app/screens/metrics_screen.dart';
import 'package:ev_app/screens/settings_screen.dart';
import 'package:ev_app/screens/splash_screen.dart';
import 'package:ev_app/screens/subscription_screen.dart';
import 'package:ev_app/screens/termsandconditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth_service.dart';
import '../Services/settings_service.dart';
import '../widget/info_card.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const url = "Settings";
  static const email = "Terms and conditions";
  static const about = "About Us";
  static const delete = "Delete";
  static const phone = "Account Information"; // not real number :)
  static const location = "Subscription";
  String? token;
  int? id;
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
            'Menu',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
          ),
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

                // we will be creating a new widget name info carrd

                InfoCard(
                    text: phone,
                    icon: Icons.person,
                    color: Colors.green,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountinformationScreen()),
                      );
                    }),
                InfoCard(
                    text: url,
                    icon: Icons.settings,
                    color: Colors.green,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MetricsScreen()),
                      );
                    }),
                InfoCard(
                    text: location,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    icon: Icons.credit_card,
                    color: Colors.green,
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscriptionScreen()),
                      );
                    }),
                InfoCard(
                    text: email,
                    icon: Icons.shield_outlined,
                    color: Colors.green,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsandconditionsScreen()),
                      );
                    }),
                InfoCard(
                    text: about,
                    icon: Icons.info_outline_rounded,
                    color: Colors.green,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutusScreen()),
                      );
                    }),
                InfoCard(
                    text: delete,
                    icon: Icons.delete_outline,
                    color: Colors.red,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontFamily: "Source Sans Pro"),
                    onPressed: () async {
                      print('Errror');
                      await AuthenticationServices(context)
                          .getUserDetails()
                          .then((value) async => {id = value.id});
                      await AuthenticationServices(context)
                          .getUser()
                          .then((value) async => {token = value.access_token});
                      await  SettingsService(context)
                          .deleteUser( id!, token!)
                          .then((value) async => {
                        if (value.status != "success")

                          {
                            print('Errror'),
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Error'),
                              duration: Duration(seconds: 3),
                            ))
                          }
                        else
                          {
                            print('Okay'),
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text("Deleted"),
                              duration: Duration(seconds: 3),
                            )),
                            // await AuthenticationServices(context)

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StartScreen(),
                                ))
                          }
                      });
                    }),
              ],
            ),
          ),
        ));
  }
}
