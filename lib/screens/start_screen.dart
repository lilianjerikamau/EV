import 'dart:ui';

import 'package:ev_app/screens/login_screen.dart';
import 'package:ev_app/screens/personal_details_screen.dart';
import 'package:ev_app/screens/welcome_back_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/smallcar.png'),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Register & build your\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF75A843),
                        fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        //"${comment.data()['comment']}"
                        text: 'EV Ledger & Lifetime SOD',

                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Color(0xFF75A843)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'Register',
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalDetailsScreen()),
                  );
                },
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF75A843), width: 0.5)),
                child:
                    const Text('Login', style: TextStyle(color: Color(0xFF75A843))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeBackScreen()),
                  );
                },
              )),
        ],
      ),
    );
  }
}
