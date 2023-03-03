// import 'dart:async';
// import 'dart:js';
//
// import 'package:ev_app/screens/start_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
//
// class StartScreen extends StatefulWidget {
//   const StartScreen({super.key});
//
//   @override
//   State<StartScreen> createState() => _StartScreenState();
//
// }
//
// class _StartScreenState extends State<StartScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTime();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => SplashScreen()),
//           );
//         },
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/smallcar.png'),
//                     Text(
//                       'How much is your priceless EV miles worth?',
//                       style: TextStyle(color: Color(0xFF75A843)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
//
// }
import 'dart:async';
import 'package:ev_app/screens/start_screen.dart';
import 'package:flutter/material.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();

}
   class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  startTime();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: initScreen(context),
  );
  }

  startTime() async {
  var duration = new Duration(seconds: 3);
  return new Timer(duration, route);
  }
  route() {
  Navigator.pushReplacement(context, MaterialPageRoute(
  builder: (context) => SplashScreen()
  )
  );
  }

  initScreen(BuildContext context) {
  return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SplashScreen()),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset('assets/images/smallcar.png'),
                    Text(
                      'How much is your priceless EV miles worth?',
                      style: TextStyle(color: Color(0xFF75A843)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
