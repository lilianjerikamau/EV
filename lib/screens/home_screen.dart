import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/process_image.dart';
import 'package:ev_app/screens/technology_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const VehicleDetailsScreen(),
    const OdometerPicture(),
    const ProcessImage(),
    const TechnologyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.green,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.bar_chart,
                    color: Colors.green,
                    size: 35,
                  )
                : const Icon(
                    Icons.bar_chart_sharp,
                    color: Colors.grey,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.bus_alert_outlined,
                    color: Colors.green,
                    size: 35,
                  )
                : const Icon(
                    Icons.bus_alert,
                    color: Colors.grey,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.more,
                    color: Colors.green,
                    size: 35,
                  )
                : const Icon(
                    Icons.more_outlined,
                    color: Colors.grey,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
