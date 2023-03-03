import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/google_map_screen.dart';
import 'package:ev_app/screens/history_screen.dart';
import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/process_image.dart';
import 'package:ev_app/screens/profile_menu_screen.dart';
import 'package:ev_app/screens/technology_screen.dart';
import 'package:ev_app/screens/vehicle_details_screen.dart';
import 'package:ev_app/screens/vehicle_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PermissionStatus _status;
  bool permissionGranted = false;
  int pageIndex = 0;

  final pages = [
    const MapScreen(),
    const HistoryScreen(),
    const VehicleListScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _getLocationPermission();
  }
  Future _getLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      permissionGranted = true;
    } else if (await Permission.location.request().isPermanentlyDenied) {
      throw('location.request().isPermanentlyDenied');
    } else if (await Permission.location.request().isDenied) {
      throw('location.request().isDenied');
      permissionGranted = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
        backgroundColor: const Color(0xFF75A843),
        onPressed: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChooseVehicleScreen()),
          );
        },
        child: Icon(Icons.speed_sharp,color: Colors.white,size: 40,), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xFF75A843),
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
          SingleChildScrollView(child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Color(0xFF75A843),
                      size: 30,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
            ),
             pageIndex == 0? Text('Home',style: TextStyle(color: Color(0xFF75A843)),):Text('Home',style: TextStyle(color: Colors.grey),)
            ],
          ),),
          SingleChildScrollView(child:Column(
            children: [IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.bar_chart,
                      color: Color(0xFF75A843),
                      size: 30,
                    )
                  : const Icon(
                      Icons.bar_chart_sharp,
                      color: Colors.grey,
                      size: 30,
                    ),
            ),
              pageIndex == 1? Text('History',style: TextStyle(color: Color(0xFF75A843)),):Text('History',style: TextStyle(color: Colors.grey),)
            ]
          ),
          ),
          SingleChildScrollView(child: Column(
            children: [IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.drive_eta,
                      color: Color(0xFF75A843),
                      size: 30,
                    )
                  : const Icon(
                      Icons.drive_eta,
                      color: Colors.grey,
                      size: 30,
                    ),
            ),
              pageIndex == 2? Text('Vehicles',style: TextStyle(color: Color(0xFF75A843)),):Text('Vehicles',style: TextStyle(color: Colors.grey),)
    ]
          ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.more_horiz,
                        color: Color(0xFF75A843),
                        size: 30,
                      )
                    : const Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                        size: 30,
                      ),

              ),            pageIndex == 3? Text('More',style: TextStyle(color: Color(0xFF75A843)),):Text('More',style: TextStyle(color: Colors.grey),)],
            ),
          ),
        ],
      ),
    );
  }
}
